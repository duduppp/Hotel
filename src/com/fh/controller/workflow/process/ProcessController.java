package com.fh.controller.workflow.process;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.cmd.GetBpmnModelCmd;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.ExecutionEntityManager;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.workflow.process.ProcessDefinitionVo;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 流程定义管理
 */
@Controller
@RequestMapping(value = "/workflow/process/")
public class ProcessController extends BaseController{

	String menuUrl = "workflow/process/list.do"; 
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private ProcessEngine processEngine;
	
	
	/**
	 * 流程定义列表
	 */
	@RequestMapping(value = "index")
	public String index(org.springframework.ui.Model model) {
		return null;
	 
	}
	/*
	*//**
	 * 查找流程定义列表
	 * @param page    分页类
	 * @param keyWord 关键字
	 * @return
	 */ 
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
				ProcessDefinitionQuery query=repositoryService.createProcessDefinitionQuery();
				List<ProcessDefinition> processDefinitionList =new ArrayList<ProcessDefinition>();
				List<ProcessDefinitionVo> pdvoList = new ArrayList<ProcessDefinitionVo>();
				if(StringUtils.isNotBlank(keywords)){
					processDefinitionList = query.processDefinitionNameLike("%"+keywords+"%")
							.orderByDeploymentId().desc()
							.listPage(pageNum, pageSize);
				}else{
					processDefinitionList = query.orderByDeploymentId().desc()
							.listPage(pageNum, pageSize);
				}
				for (ProcessDefinition pd : processDefinitionList) {
					String deploymentId = pd.getDeploymentId();
					Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
					ProcessDefinitionVo pdvo=new ProcessDefinitionVo(pd.getId(),deploymentId
							,pd.getName(),pd.getKey(),pd.getVersion(), deployment.getDeploymentTime()
							,pd.getResourceName(),pd.getDiagramResourceName());		
					pdvoList.add(pdvo);
				}  
			 
				
				long countLong=query.count();
				int count=(int) countLong;
				page.setTotalResult(count); 
				page.setTotalPage(pdvoList.size());

				mv.setViewName("workflow/process/process_list"); 
				mv.addObject("varList", pdvoList);
				mv.addObject("pd", pageData);  
				mv.addObject("page", page);  
				mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
				return mv;
	 
	}
	
    /**
     * 删除部署的流程，级联删除流程实例
     *
     * @param deploymentId 流程部署ID
     */ 
    @RequestMapping(value = "delete")
    @ResponseBody
	public void delete(PrintWriter out){ 
    	
    	logBefore(logger, Jurisdiction.getUsername()+"删除BackgroundImg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pageData = new PageData(); 
		pageData = this.getPageData();
		String processDefinitionId=pageData.getString("processDefinitionId");
		ProcessDefinition pd =repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
		repositoryService.deleteDeployment(pd.getDeploymentId(),true);
		out.write(Const.DEL_SUCCEED); 
		out.close();
	 
	}
    
     
    @RequestMapping(value = "convertToModel")
    @ResponseBody
    public String convertToModel(String processDefinitionId){
     
    	Map<String, String> map = new HashMap<String, String>();
    	String jsonString="";
		try {
			ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
					.processDefinitionId(processDefinitionId).singleResult();
			InputStream bpmnStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(),
					processDefinition.getResourceName());
			XMLInputFactory xif = XMLInputFactory.newInstance();
			InputStreamReader in = new InputStreamReader(bpmnStream, "UTF-8");
			XMLStreamReader xtr = xif.createXMLStreamReader(in);
			BpmnModel bpmnModel = new BpmnXMLConverter().convertToBpmnModel(xtr);
		 
			BpmnJsonConverter converter = new BpmnJsonConverter();
			com.fasterxml.jackson.databind.node.ObjectNode modelNode = converter.convertToJson(bpmnModel);
			Model modelData = repositoryService.newModel();
			modelData.setKey(processDefinition.getKey());
			modelData.setName(processDefinition.getName());
			modelData.setCategory(processDefinition.getDeploymentId());

			com.fasterxml.jackson.databind.node.ObjectNode modelObjectNode = new ObjectMapper().createObjectNode();
			modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, processDefinition.getName());
			modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
			modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, processDefinition.getDescription());
			modelData.setMetaInfo(modelObjectNode.toString());

			repositoryService.saveModel(modelData);
			repositoryService.addModelEditorSource(modelData.getId(), modelNode.toString().getBytes("utf-8"));
			map.put("msg", "转换成功");
			map.put("status", "true");
		} catch (Exception e) {
			map.put("msg", "转换失败");
			map.put("status", "false");
			e.printStackTrace();
		}  
	 
		jsonString= JSON.toJSONString(map);
		return jsonString; 
    }
    
    
    /**
     * 读取资源，通过部署ID
     *
     * @param processDefinitionId 流程定义
     * @param resourceType        资源类型(xml|image)
     * @throws Exception
     */
    @RequestMapping(value = "resource/read")
    public void loadByDeployment(@RequestParam("processDefinitionId") String processDefinitionId, @RequestParam("resourceType") String resourceType,
                                 HttpServletResponse response) throws Exception {
    	response.setCharacterEncoding("UTF-8");
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        String resourceName = "";
        if (resourceType.equals("image")) {
            resourceName = processDefinition.getDiagramResourceName();
        } else if (resourceType.equals("xml")) {
            resourceName = processDefinition.getResourceName();
        }
        InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
 
        
      /*  ProcessDiagramGenerator procDiaGenerator = new DefaultProcessDiagramGenerator();
        CommandContext cmmContext = Context.getCommandContext();  
        ExecutionEntityManager exeEntityManager = cmmContext.getExecutionEntityManager(); 
        
        GetBpmnModelCmd getBpmnModelCmd = new GetBpmnModelCmd(processDefinitionId);  
        BpmnModel bpmnModel = getBpmnModelCmd.execute(cmmContext);  
        
        ExecutionEntity executionEntity = exeEntityManager.findExecutionById(processDefinitionId);  
        List<String> activiityIds = executionEntity.findActiveActivityIds(); 
       
        InputStream is = procDiaGenerator.generateDiagram(  
                bpmnModel,   
                "png",   
                activiityIds,   
                new ArrayList<String>(),   
                "宋体",   
                "宋体",   
                null,   
                1.0);*/
        
        byte[] b = new byte[1024];
        int len = -1;
        	if(resourceType.equals("xml")){
        		response.getOutputStream().write("<data>".getBytes());
        	}
        	response.setCharacterEncoding("UTF-8");
        while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
          
        	response.getOutputStream().write(b, 0, len);
         
          
        }
        if(resourceType.equals("xml")){
    		response.getOutputStream().write("</data>".getBytes());
    	}
    }
    
    
    
}
