package com.fh.controller.workflow.online.myTask;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.online.TaskVo;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
 
 

 
/**
 * 我的任务
 */
@Controller
@RequestMapping(value = "/workflow/online/")
public class MyTaskController extends BaseController{

	private static final String SIGN_SECURITY_URL="/backstage/workflow/online/myTask/signList";
	
	private static final String TODO_SECURITY_URL="/backstage/workflow/online/myTask/todoList";
	
	 @Autowired
	 private RuntimeService runtimeService;
	 @Autowired
	 private IdentityService identityService;
	 @Autowired
	 private TaskService taskService; 
	 
	 @Autowired
	 private HistoryService historyService;  
	 
	 @Autowired
	 private RepositoryService repositoryService;
	/*
	 @Autowired
	 private LeaveService leaveService;
    */
	 
	@RequestMapping("/finishedList")
	public ModelAndView finishedList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView(); 
		setTaskListData(page, mv); 
		mv.setViewName("workflow/online/finished_list"); 
		return mv;
	}
	
	@RequestMapping("/historyTaskList")
	public ModelAndView historyTaskList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView(); 
		setTaskListData(page, mv); 
		mv.setViewName("workflow/online/historyTask_list");  
		return mv;
	}

	private void setTaskListData(Page page, ModelAndView mv) {
		PageData pageData = new PageData();
		pageData = this.getPageData();
		String keywords = pageData.getString("name"); 	
		if(null != keywords && !"".equals(keywords)){
			keywords= keywords.trim(); 
		}
		page.setPd(pageData); 
		int pageNum = page.getCurrentPage(); 
		int pageSize=page.getShowCount();  
		String name="";//用户
		String groupId="zuz";
											//创建流程历史实例查询
		List<HistoricTaskInstance> histList=historyService.createHistoricTaskInstanceQuery()
				.taskCandidateGroup(groupId)//根据角色名称查询
				.taskNameLike("%"+name+"%")
				.listPage(pageNum, pageSize);
		
		long histCount=historyService.createHistoricTaskInstanceQuery()
				.taskCandidateGroup(groupId)
				.taskNameLike("%"+name+"%")
				.count();
		List<TaskVo> taskList=new ArrayList<TaskVo>();
		//这里递出没有用的字段，免得给前端页面做成加载压力
		for(HistoricTaskInstance hti:histList){
			TaskVo taskVo=new TaskVo();
			taskVo.setId(hti.getId());
			taskVo.setName(hti.getName());
			taskVo.setProcessDefinitionId(hti.getProcessDefinitionId());
			taskVo.setProcessInstanceId(hti.getProcessInstanceId());
			taskVo.setCreateTime(hti.getCreateTime());
			taskVo.setEndTime(hti.getEndTime());
			taskList.add(taskVo);
		}
		 
			int count=(int) histCount;
			page.setTotalResult(count); 
			page.setTotalPage(taskList.size());
		 
			mv.addObject("varList", taskList);
			mv.addObject("pd", pageData);  
			mv.addObject("page", page);  
			mv.addObject("QX",Jurisdiction.getHC());
	}
		
		/**
		 * 查询历史批注
		 * @param response
		 * @param taskId 流程ID  
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/listHistoryComment")
		public ModelAndView listHistoryComment(HttpServletResponse response,String taskId) throws Exception{
			ModelAndView mv = this.getModelAndView(); 
			
			if(taskId==null){
				taskId="";
			}
			HistoricTaskInstance hti=historyService.createHistoricTaskInstanceQuery()
					.taskId(taskId)
					.singleResult();
			JsonConfig jsonConfig=new JsonConfig();
			JSONObject result=new JSONObject();
			List<Comment> commentList=null;
			if(hti!=null){
			    commentList=taskService.getProcessInstanceComments(hti.getProcessInstanceId()); 
				// 集合元素反转
				Collections.reverse(commentList); 
			}
			mv.setViewName("workflow/online/comment_list");  
			mv.addObject("varList", commentList);
			mv.addObject("QX",Jurisdiction.getHC()); 
			return mv;
		}
		
		/**
		 * 根据任务id查询流程实例的具体执行过程
		 * @param taskId
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/listAction")
		public ModelAndView listAction(String taskId,HttpServletResponse response)throws Exception{
			ModelAndView mv = this.getModelAndView(); 
			HistoricTaskInstance hti=historyService.createHistoricTaskInstanceQuery().taskId(taskId).singleResult();
			String processInstanceId=hti.getProcessInstanceId(); // 获取流程实例id
			List<HistoricActivityInstance> haiList=historyService.createHistoricActivityInstanceQuery().processInstanceId(processInstanceId).list();
			mv.setViewName("workflow/online/task_list");  
			mv.addObject("varList", haiList);
			mv.addObject("QX",Jurisdiction.getHC()); 
			return mv;
		}
		
		
	 /**
     * 签收任务列表
     */ 
    @RequestMapping(value = "signlist", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView findSignByPage(Page page) {
	 
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
		List<TaskVo> taskVos=new ArrayList<TaskVo>();
				 		
		// 根据当前人的ID查询
        TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateUser(keywords);	        
		List<Task> tasks = taskQuery.listPage(pageNum, pageSize);
		for(Task t:tasks){
			TaskVo taskVo=new TaskVo(t.getId(),t.getTaskDefinitionKey(),t.getName(),t.getProcessDefinitionId()
					,t.getProcessInstanceId(),t.getPriority(),t.getCreateTime(),t.getDueDate()
					,t.getDescription(),t.getOwner(),t.getAssignee());					
			taskVos.add(taskVo); 
		}
		 
        long countLong=taskQuery.count();    
    	int count=(int) countLong;
		page.setTotalResult(count); 
		page.setTotalPage(taskVos.size());
		mv.setViewName("workflow/online/sign_list");  
		mv.addObject("varList", taskVos);
		mv.addObject("pd", pageData);  
		mv.addObject("page", page);  
		mv.addObject("QX",Jurisdiction.getHC()); 
		 
		return mv;
	}
    
     /**
     * 待办任务列表
     */ 
    @RequestMapping(value = "todoList")
	@ResponseBody
	public ModelAndView findTodoByPage(Page page) {
     
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
		List<TaskVo> taskVos=new ArrayList<TaskVo>(); 
		// 根据当前人的ID查询 userId组织Id
		String userId="zuz";
		String name="";
        TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateGroup(userId).taskNameLike("%"+name+"%");       
		List<Task> tasks = taskQuery.listPage(pageNum, pageSize);
		for(Task t:tasks){
			TaskVo taskVo=new TaskVo(t.getId(),t.getTaskDefinitionKey(),t.getName(),t.getProcessDefinitionId()
					,t.getProcessInstanceId(),t.getPriority(),t.getCreateTime(),t.getDueDate()
					,t.getDescription(),t.getOwner(),t.getAssignee());					
			taskVos.add(taskVo);
		}	        
	    long countLong=taskQuery.count();    
    	int count=(int) countLong; 
		page.setTotalResult(count); 
		page.setTotalPage(taskVos.size());
		mv.setViewName("workflow/online/todo_list");     
		mv.addObject("varList", taskVos);
		mv.addObject("pd", pageData);  
		mv.addObject("page", page);  
		mv.addObject("QX",Jurisdiction.getHC()); 
			 
		 return mv;
	 
	}
 
    /**
	 * 查询历史流程批注
	 * 
	 * @param response
	 * @param processInstanceId
	 *            流程ID
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/listHistoryCommentWithProcessInstanceId")
	public ModelAndView listHistoryCommentWithProcessInstanceId() throws Exception {
		ModelAndView mv = this.getModelAndView(); 
		PageData pageData = new PageData();
		pageData = this.getPageData();
		String  processInstanceId = pageData.getString("processInstanceId");					//关键词检索条件
		if(null != processInstanceId && !"".equals(processInstanceId)){
			processInstanceId= processInstanceId.trim(); 
		}
		List<Comment> commentList = taskService
				.getProcessInstanceComments(processInstanceId); 
		// 改变顺序，按原顺序的反向顺序返回list
		Collections.reverse(commentList); //集合元素反转
		mv.setViewName("workflow/online/comment_list");     
		mv.addObject("varList", commentList);
		mv.addObject("pd", pageData);  
		 
		mv.addObject("QX",Jurisdiction.getHC()); 
		
		return mv;
	}
	
	
     /**
     * 签收任务
     *//*
    @RequestMapping(value = "claim/{id}", method = RequestMethod.POST)
   	@ResponseBody
   	public AjaxRes claimTask(@PathVariable("id")String taskId) {
    	AjaxRes ar=getAjaxRes();
    	if (ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, SIGN_SECURITY_URL))) {
    		try {
				String currentUserId = AccountShiroUtil.getCurrentUser().getAccountId();
				taskService.claim(taskId, currentUserId);
				ar.setSucceedMsg("签收成功");
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg("签收失败");
			}
    	}
    	return ar;
    }
    *//**
     * 办理任务
     *//*
    @RequestMapping(value = "complete/{id}", method = RequestMethod.POST)
   	@ResponseBody
   	public AjaxRes complete(@PathVariable("id")String taskId,Variable var) {
    	AjaxRes ar=getAjaxRes();
    	if (ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, TODO_SECURITY_URL))) {
    		try {
    			Map<String, Object> variables = var.getVariableMap();
				taskService.complete(taskId,variables);
				ar.setSucceedMsg("办理成功");
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg("办理失败");
			}
    	}
    	return ar;
    }
    
    
    *//**
     * 查询任务
     *//*
    @RequestMapping(value = "findTask", method = RequestMethod.POST)
   	@ResponseBody
   	public AjaxRes findTask(String pId) {
    	AjaxRes ar=getAjaxRes();
    	if (ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, TODO_SECURITY_URL))) {
    		try {
    			Leave leave=leaveService.findLeaveByPId(pId);
				ar.setSucceed(leave,Const.DATA_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
    	}
    	return ar;
    }
    
    *//**
     * 驳回任务
     *//*
    @RequestMapping(value = "reject/{id}", method = RequestMethod.POST)
   	@ResponseBody
   	public AjaxRes reject(@PathVariable("id")String taskId,String pId,String rejectReason,Variable var) {
    	AjaxRes ar=getAjaxRes();
    	if (ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, TODO_SECURITY_URL))) {
    		try {
    			Map<String, Object> variables = var.getVariableMap();
    			leaveService.updateRejectReason(pId,rejectReason);
				taskService.complete(taskId,variables);
				ar.setSucceedMsg("驳回成功");
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg("驳回失败");
			}
    	}
    	return ar;
    }
    
    *//**
     * 调整任务
     *//*
    @RequestMapping(value = "adjust/{taskId}", method = RequestMethod.POST)
   	@ResponseBody
   	public AjaxRes adjust(@PathVariable("taskId")String taskId,String pId,String description,Variable var) {
    	AjaxRes ar=getAjaxRes();
    	if (ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, TODO_SECURITY_URL))) {
    		try {
    			Map<String, Object> variables = var.getVariableMap();
    			leaveService.updateDescription(pId,description);
				taskService.complete(taskId,variables);
				ar.setSucceedMsg("调整成功");
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg("调整失败");
			}
    	}
    	return ar;
    }*/
}
