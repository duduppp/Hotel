package com.fh.controller.system.task_schedule;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.quartz.Job;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.task_schedule.Task_scheduleManager;
import com.fh.util.AppUtil;
import com.fh.util.Hanyu;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.QuartzManager;
import com.fh.util.Tools;

/** 
 * 说明：定时任务管理
 * 创建人：dp
 * 创建时间：2017-09-06
 */
@Controller
@RequestMapping(value="/task_schedule")
public class Task_scheduleController extends BaseController {
  
	String menuUrl = "task_schedule/list.do"; //菜单地址(权限用)
	
	@Resource(name="task_scheduleService")
	private Task_scheduleManager task_scheduleService;
	
	private static String JOB_GROUP_NAME = "FH_JOBGROUP_NAME"; // 任务组
	private static String TRIGGER_GROUP_NAME = "FH_TRIGGERGROUP_NAME"; // 触发器组
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() { 
		logBefore(logger, Jurisdiction.getUsername()+"新增Task_schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.put("TASK_SCHEDULE_ID", this.get32UUID());	//主键	 
			Hanyu  hanyu=new Hanyu();
			String jonName= pd.getString("JOBNAME");
			pd.put("ALIASNAME", jonName);
			String jobNamePinyin=hanyu.getStringPinYin(jonName);
			String JOBNAME =jobNamePinyin+ Tools.getRandomNum(); // 任务名称
			String CRONEXPRESSION  = pd.getString("CRONEXPRESSION"); // 时间规则 
			String STATUS  = pd.getString("STATUS"); 
 
			pd.put("CREATETIME",new Date()); // 创建时间
			pd.put("UPDATETIME", new Date()); // 修改时间
			pd.put("STATUS", Integer.parseInt(STATUS)); // 状态
			pd.put("JOBGROUP",JOB_GROUP_NAME); 
			
			Map<String, String> jopMap=new HashMap<String, String>();
			jopMap.put("JOBNAME",JOBNAME);
			jopMap.put("JOB_GROUP_NAME", JOB_GROUP_NAME);
			jopMap.put("JOBCLASS", pd.getString("JOBCLASS")); 
			//ALIASNAME
			jopMap.put("TRIGGER_GROUP_NAME",TRIGGER_GROUP_NAME);  
			jopMap.put("FHTIME", CRONEXPRESSION);
			
			//设置参数 
			Map<String, Object> paramMap=new HashMap<String, Object>();
			pd.put("JOBNAME", JOBNAME);	//主键 	
		//	this.addJob(jopMap, paramMap);
			task_scheduleService.creatScheduleJob(pd);
			task_scheduleService.save(pd); 
			mv.addObject("msg", "success");
			mv.setViewName("save_result");
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
		
	}
	
	 

	/**
	 * 删除任务
	 * 
	 * @param JOBNAME
	 */
	public void removeJob(String JOBNAME) {
		QuartzManager.removeJob(JOBNAME, JOB_GROUP_NAME, JOBNAME,
				TRIGGER_GROUP_NAME);
	}
	
	/**
	 * 新增任务
	 * 
	 * @param JOBNAME
	 *            任务名称
	 * @param FHTIME
	 *            时间规则
	 * @param parameter
	 *            传的参数
	 * @param TIMINGBACKUP_ID
	 *            定时备份任务的ID
	 * @throws ClassNotFoundException 
	 */
	public void addJob(Map<String, String> jopMap,Map<String, Object> parameter ) throws ClassNotFoundException {
		String JOBNAME=jopMap.get("JOBNAME");
		String JOB_GROUP_NAME=jopMap.get("JOB_GROUP_NAME");
		String TRIGGER_GROUP_NAME=jopMap.get("TRIGGER_GROUP_NAME");
		String FHTIME=jopMap.get("FHTIME"); 
		String JOBCLASS=jopMap.get("JOBCLASS"); 
		Class<? extends Job> jobClass=(Class<? extends Job>) Class.forName(JOBCLASS);
		QuartzManager.addJob(JOBNAME, JOB_GROUP_NAME, JOBNAME,
				TRIGGER_GROUP_NAME,jobClass, FHTIME, parameter);
		
	}
	
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Task_schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		//先删除暂停任务，在删除任务 
		
		task_scheduleService.deleteScheduleJob(pd); 
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Task_schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();  
		pd = this.getPageData();
		pd.put("UPDATETIME", Tools.date2Str(new Date())); // 修改时间
		
		String statusString=pd.getString("STATUS");
		if(statusString.equals("1")){
			int res=task_scheduleService.resumeJob(pd);	 
		}else{
			task_scheduleService.edit(pd);
		}
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Task_schedule");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = task_scheduleService.list(page);	//列出Task_schedule列表
		mv.setViewName("system/task_schedule/task_schedule_list");
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
		mv.setViewName("system/task_schedule/task_schedule_edit");
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
		pd = task_scheduleService.findById(pd);	//根据ID读取
		mv.setViewName("system/task_schedule/task_schedule_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Task_schedule");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			task_scheduleService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Task_schedule到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("任务名称");	//1
		titles.add("任务分组");	//2
		titles.add("任务别名");	//3
		titles.add("任务类Class");	//4
		titles.add("状态");	//5
		titles.add("规则说明");	//6
		titles.add("描述");	//7
		titles.add("创建时间");	//8
		titles.add("修改时间");	//9
		titles.add("规则说明解释");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = task_scheduleService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("JOBNAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("JOBGROUP"));	    //2
			vpd.put("var3", varOList.get(i).getString("ALIASNAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("JOBCLASS"));	    //4
			vpd.put("var5", varOList.get(i).get("STATUS").toString());	//5
			vpd.put("var6", varOList.get(i).getString("CRONEXPRESSION"));	    //6
			vpd.put("var7", varOList.get(i).getString("DESCRIPTION"));	    //7
			vpd.put("var8", varOList.get(i).getString("CREATETIME"));	    //8
			vpd.put("var9", varOList.get(i).getString("UPDATETIME"));	    //
			vpd.put("var10", varOList.get(i).getString("CRONEXPRESSION_EXPLAIN"));
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
     * 运行一次任务
     *
     * @param scheduleJobId the schedule job id
     * @return
     */
    @RequestMapping(value="/runOnce") 
   	@ResponseBody
    public String runOnce()throws Exception{
    	PageData pd = new PageData(); 
    	pd = this.getPageData();
    	int res=task_scheduleService.runOnce(pd);	
    	Map<String, String> map = new HashMap<String, String>();
    	if (res == 1){
    		map.put("msg", "运行成功");
    	}else if (res == 2){
			map.put("msg", "请先停用任务");
    	}else{
			map.put("msg", "运行失败");
		}
		return JSON.toJSONString(map);
    	
    }

    /**
     * 暂停任务
     *
     * @param scheduleJobId the schedule job id
     * @return
     */
    @RequestMapping(value="/pauseJob") 
	@ResponseBody
    public String pauseJob()throws Exception{
    	
    	//和删除一样的权限
    	logBefore(logger, Jurisdiction.getUsername()+"pauseJob"); 
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return "没有权限";} //校验权限
    	
    	
    	PageData pd = new PageData();
		pd = this.getPageData();
		int res=task_scheduleService.pauseJob(pd);
		Map<String, String> map = new HashMap<String, String>();
     	if (res >0)
     	map.put("msg", "暂停任务调度成功");
 		 else
    	map.put("msg", "暂停任务调度失败");
      
    	return JSON.toJSONString(map);
   	 
    	
    }
     
    @RequestMapping(value="/resumeJob") 
   	@ResponseBody
	public String resumeJob() throws Exception{ 
		
    	PageData pd = new PageData(); 
    	pd = this.getPageData();
    	 
    	int res=task_scheduleService.resumeJob(pd);	
    	Map<String, String> map = new HashMap<String, String>();
    	if (res == 1)
    	map.put("msg", "启动成功");
		else if (res == 2)
    	map.put("msg", "项目已启动");
		else
    	map.put("msg", "启动失败");
    	 
    	return JSON.toJSONString(map);
		
	}
	
	

	
 
	
}
