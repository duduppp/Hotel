package com.fh.controller.workflow.leave;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.workflow.leave.LeaveManager;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import com.fh.util.Const;
import com.fh.entity.system.User;
/** 
 * 说明：请假审批
 * 创建人：dp
 * 创建时间：2017-08-31
 */
@Controller
@RequestMapping(value="/leave")
public class LeaveController extends BaseController {
	
	String menuUrl = "leave/list.do"; //菜单地址(权限用)
	@Resource(name="leaveService")
	private LeaveManager leaveService;
	
	@Resource
	private RuntimeService runtimeService;
	
	@Resource
	private TaskService taskService;
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Leave");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("LEAVE_ID", this.get32UUID());	//主键
		pd.put("STATE", "");	//状态
		pd.put("PROCESSINSTANCEID", "");	//流程实例Id
		pd.put("STATE", "未提交");
		User user = (User) Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
		pd.put("USERID", user.getUSERNAME());
		leaveService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Leave");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		leaveService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Leave");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		leaveService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Leave");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = leaveService.list(page);	//列出Leave列表
		mv.setViewName("workflow/leave/leave_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("workflow/leave/leave_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = leaveService.findById(pd);	//根据ID读取
		mv.setViewName("workflow/leave/leave_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Leave");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			leaveService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Leave到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("请假日期");	//1
		titles.add("请假天数");	//2
		titles.add("请假原因");	//3
		titles.add("用户");	//4
		titles.add("状态");	//5
		titles.add("流程实例Id");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = leaveService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("LEAVEDATE"));	    //1
			vpd.put("var2", varOList.get(i).get("LEAVEDAYS").toString());	//2
			vpd.put("var3", varOList.get(i).getString("LEAVEREASON"));	    //3
			vpd.put("var4", varOList.get(i).getString("USERID"));	    //4
			vpd.put("var5", varOList.get(i).getString("STATE"));	    //5
			vpd.put("var6", varOList.get(i).getString("PROCESSINSTANCEID"));	    //6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	
	/**
	 * 提交流程申請
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/startApply")
	public void startApply(PrintWriter out) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"提交Leave流程");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String leave_ID=pd.getString("LEAVE_ID"); 
		Map<String,Object> variables=new HashMap<String,Object>();
		variables.put("leave_ID", leave_ID);
		// 启动流程
		ProcessInstance pi= runtimeService.startProcessInstanceByKey("activitiemployeeProcess",variables); 
		// 根据流程实例Id查询任务
		Task task=taskService.createTaskQuery().processInstanceId(pi.getProcessInstanceId()).singleResult(); 
		 // 完成 学生填写请假单任务		
		taskService.complete(task.getId());   
				
		pd = leaveService.findById(pd);	//根据ID读取
		pd.put("STATE", "审核中");
		pd.put("PROCESSINSTANCEID", pi.getProcessInstanceId());
		 // 修改请假单状态
		leaveService.edit(pd);
		
		out.write("success");
		out.close();
	}
	
	/**
	 * 查询流程信息
	 * @param response
	 * @param taskId  流程实例ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getTaskInfo")
	public ModelAndView getleaveByTaskId(PrintWriter out) throws Exception{		
		
		logBefore(logger, Jurisdiction.getUsername()+"查询流程信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		String taskId=pd.getString("taskId");		
		ModelAndView mv = this.getModelAndView();
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult(); 
		
		PageData pageData = new PageData();
		pageData.put("PROCESSINSTANCEID", task.getProcessInstanceId());
		
		List<PageData>	varList =leaveService.listAll(pageData);
		mv.setViewName("workflow/leave/taskleave_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
	 
		return mv;		
	}
	
	
	
}
