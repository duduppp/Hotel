package com.fh.controller.workflow.instance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.online.TaskVo;
import com.fh.entity.workflow.process.HistoricProcessInstanceVo;
import com.fh.entity.workflow.process.ProcessInstanceVo;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
  
/**
 * 运行中流程管理
 */
@Controller
@RequestMapping(value = "/workflow/instance/pro/")
public class ProInstanceController extends BaseController{

	 private static final String menuUrl = "workflow/instance/pro/list.do";
	@Autowired
	 private RuntimeService runtimeService;
	 @Autowired
	 private TaskService taskService;


	 
	@RequestMapping(value = "list")
	@ResponseBody
	public ModelAndView findByPage(Page page) {
		logBefore(logger, Jurisdiction.getUsername()+"列表Model");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		
		ModelAndView mv = this.getModelAndView();
		PageData pageData = new PageData();
		pageData = this.getPageData();
		String keywords = pageData.getString("name");					//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			keywords= keywords.trim(); 
		}
		page.setPd(pageData); 
		int pageNum = page.getCurrentPage(); 
		int pageSize=page.getShowCount(); 
		 
		ProcessInstanceQuery query=runtimeService.createProcessInstanceQuery();
		List<ProcessInstance> list =new ArrayList<ProcessInstance>();
		List<ProcessInstanceVo> vos =new ArrayList<ProcessInstanceVo>();
		
		if(StringUtils.isNotBlank(keywords)){
			list = query.processInstanceTenantIdLike("%"+keywords+"%")
					.orderByProcessInstanceId().desc()
					.listPage(pageNum, pageSize);
		}else{
			list = query.orderByProcessInstanceId().desc()
					.listPage(pageNum, pageSize);
		}
		for(ProcessInstance t:list){
			ProcessInstanceVo vo=new ProcessInstanceVo(t.getId(),t.getProcessInstanceId()
					,t.getProcessDefinitionId());		
			// 设置当前任务信息
			Task task=taskService.createTaskQuery().processInstanceId(t.getProcessInstanceId()).active().orderByTaskCreateTime().desc().singleResult();			
			TaskVo taskVo=new TaskVo(task.getId(),task.getTaskDefinitionKey(),task.getName(),task.getProcessDefinitionId()
					,task.getProcessInstanceId(),task.getPriority(),task.getCreateTime(),task.getDueDate()
					,task.getDescription(),task.getOwner(),task.getAssignee());		
			vo.setTask(taskVo);
			
			vos.add(vo);					
		}
		
		long countLong=query.count();
		int count=(int) countLong;
		page.setTotalResult(count); 
		page.setTotalPage(vos.size());

		mv.setViewName("workflow/instance/pro_list");  
		mv.addObject("varList", vos);
		mv.addObject("pd", pageData);  
		mv.addObject("page", page);  
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		 
		return mv;
	} 
	
}
