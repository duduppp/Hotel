package com.fh.controller.workflow.model;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.workflow.ModelVo;
import com.fh.util.Const;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;

/**
 * 流程模型控制器
 */
@Controller
@RequestMapping(value = "/workflow")
public class ModelController extends BaseController {

	String menuUrl = "workflow/list.do";
	@Autowired
	private RepositoryService repositoryService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public ModelAndView list(Page page) {

		logBefore(logger, Jurisdiction.getUsername() + "列表Model");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		} // 校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("name"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			keywords = keywords.trim();
		}
		page.setPd(pd);
		int pageNum = page.getCurrentPage();
		int pageSize = page.getShowCount();
		ModelQuery modelQuery = repositoryService.createModelQuery();
		List<Model> list = new ArrayList<Model>();
		if (StringUtils.isNotBlank(keywords)) {
			list = modelQuery.modelNameLike("%" + keywords + "%")
					.orderByCreateTime().desc().listPage(pageNum, pageSize);
		} else {
			list = modelQuery.orderByCreateTime().desc()
					.listPage(pageNum, pageSize);
		}
		long countLong = modelQuery.count();
		int count = (int) countLong;
		List<ModelVo> modelVoList = ModelVo.toModelVo(list);
		page.setTotalResult(count);
		page.setTotalPage(modelVoList.size());

		mv.setViewName("workflow/model/model_list");
		mv.addObject("varList", modelVoList);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;

	}

	@RequestMapping(value = "edit")
	public void edit(String modelId, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			response.sendRedirect(request.getContextPath()
					+ "/act-process-editor/modeler.html?modelId=" + modelId);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit(HttpServletRequest request) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String modelId = (String) pd.get("modelId");
		mv.setViewName(request.getContextPath()
				+ "/act-process-editor/modeler.jsp?modelId=" + modelId);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value = "/goUploadFlow")
	public ModelAndView goUploadFlow(HttpServletRequest request) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("workflow/model/model_deploy"); 
		mv.addObject("msg", "uploadflow"); 
		mv.addObject("pd", pd);
		return mv;
	}
	
	

	/**
	 * @throws IOException 
		 * 
		 */
	@RequestMapping(value = "/uploadflow")
	public ModelAndView uploadFlowFile() throws IOException {

		PageData pd = new PageData();
		pd = this.getPageData(); 

		String filePath = PathUtil.getClasspath().substring(0, PathUtil.getClasspath().indexOf("WEB-INF")) + Const.FILEPATHFILEOA
				+ pd.getString("FILEPATH");
		File file = new File(filePath);
		String flowname=pd.getString("flowName");
		 
		flowname=flowname.substring(0,flowname.indexOf("."));
		FileInputStream fileInputStream = new FileInputStream(file);
		repositoryService.createDeployment() // 创建部署
				.name(flowname) // 需要部署流程名称
				.addZipInputStream(new ZipInputStream(fileInputStream))// 添加ZIP输入流
				.deploy();// 开始部署

		JSONObject result = new JSONObject();
		result.put("success", true);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg", "发布成功");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("workflow/model/model_edit");
		mv.addObject("msg", "create");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除BackgroundImg");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		repositoryService.deleteModel(pd.getString("modelId"));
		out.write(Const.DEL_SUCCEED);
		out.close();
	}

	/**
	 * 创建模型
	 */
	@RequestMapping(value = "create")
	@ResponseBody
	public String create(HttpServletRequest request,
			HttpServletResponse response) {
		logBefore(logger, Jurisdiction.getUsername() + "列表Model");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String name = pd.getString("name");
			String key = pd.getString("key");
			String description = pd.getString("description");

			ObjectMapper objectMapper = new ObjectMapper();
			ObjectNode editorNode = objectMapper.createObjectNode();
			editorNode.put("id", "canvas");
			editorNode.put("resourceId", "canvas");
			ObjectNode stencilSetNode = objectMapper.createObjectNode();
			stencilSetNode.put("namespace",
					"http://b3mn.org/stencilset/bpmn2.0#");
			editorNode.put("stencilset", stencilSetNode);
			Model modelData = repositoryService.newModel();

			ObjectNode modelObjectNode = objectMapper.createObjectNode();
			modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
			modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
			description = StringUtils.defaultString(description);
			modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION,
					description);
			modelData.setMetaInfo(modelObjectNode.toString());
			modelData.setName(name);
			modelData.setKey(StringUtils.defaultString(key));

			repositoryService.saveModel(modelData);
			repositoryService.addModelEditorSource(modelData.getId(),
					editorNode.toString().getBytes("utf-8"));
			return modelData.getId();
			// response.sendRedirect(request.getContextPath() +
			// "/act-process-editor/modeler.html?modelId=" + modelData.getId());
		} catch (Exception e) {
			logger.error("创建模型失败", e);
		}
		return "";

	}

	/**
	 * 根据Model部署流程
	 */
	@RequestMapping(value = "/deploy")
	@ResponseBody
	public String deploy(String modelId) {
		Map<String, String> map = new HashMap<String, String>();
		Deployment deployment = null;
		String jsonString = "";
		try {
			Model modelData = repositoryService.getModel(modelId);
			ObjectNode modelNode = (ObjectNode) new ObjectMapper()
					.readTree(repositoryService.getModelEditorSource(modelData
							.getId()));
			byte[] bpmnBytes = null;
			BpmnModel model = new BpmnJsonConverter()
					.convertToBpmnModel(modelNode);
			bpmnBytes = new BpmnXMLConverter().convertToXML(model);
			String processName = modelData.getName() + ".bpmn20.xml";
			deployment = repositoryService.createDeployment()
					.name(modelData.getName())
					.addString(processName, new String(bpmnBytes)).deploy();
			map.put("msg", "模型部署流程成功");
			map.put("status", "true");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "模型部署流程失败");
			map.put("status", "false");
		}
		logger.info("模型部署流程成功，部署ID=" + deployment.getId());
		jsonString = JSON.toJSONString(map);
		// ar.setFailMsg("模型部署流程失败");

		return jsonString;
	}

	/**
	 * 导出model对象为指定类型
	 * 
	 * @param modelId
	 *            模型ID
	 * @param type
	 *            导出文件类型(bpmn\json)
	 * @throws IOException
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "export/{modelId}/{type}")
	public void export(@PathVariable("modelId") String modelId,
			@PathVariable("type") String type, HttpServletResponse response)
			throws JsonProcessingException, IOException {

		Model modelData = repositoryService.getModel(modelId);
		BpmnJsonConverter jsonConverter = new BpmnJsonConverter();
		byte[] modelEditorSource = repositoryService
				.getModelEditorSource(modelData.getId());

		JsonNode editorNode = new ObjectMapper().readTree(modelEditorSource);
		BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);

		// 处理异常
		if (bpmnModel.getMainProcess() == null) {
			response.setStatus(HttpStatus.UNPROCESSABLE_ENTITY.value());
			response.getOutputStream().println(
					"no main process, can't export for type: " + type);
			response.flushBuffer();
			return;
		}
		String filename = "";
		byte[] exportBytes = null;
		String mainProcessId = bpmnModel.getMainProcess().getId();

		if (type.equalsIgnoreCase("bpmn")) {
			BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
			exportBytes = xmlConverter.convertToXML(bpmnModel);
			filename = mainProcessId + ".bpmn20.xml";
		}
		if (type.equalsIgnoreCase("json")) {

			exportBytes = modelEditorSource;
			filename = mainProcessId + ".json";
		}
		ByteArrayInputStream in = new ByteArrayInputStream(exportBytes);
		IOUtils.copy(in, response.getOutputStream());
		response.setHeader("Content-Disposition", "attachment; filename="
				+ filename);
		response.flushBuffer();
	}

	/*    *//**
	 * 模型列表
	 */
	/*
	 * @RequestMapping(value = "index") public String
	 * index(org.springframework.ui.Model model) {
	 * if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
	 * model.addAttribute("permitBtn",
	 * getPermitBtn(Const.RESOURCES_TYPE_FUNCTION)); return
	 * "/system/workflow/model/list"; } return Const.NO_AUTHORIZED_URL; }
	 *//**
	 * 创建模型
	 */
	/*
	 * @RequestMapping(value = "create", method = RequestMethod.POST) public
	 * void create(String name,String key,String description,HttpServletRequest
	 * request, HttpServletResponse response) {
	 * if(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION)){ try {
	 * ObjectMapper objectMapper = new ObjectMapper(); ObjectNode editorNode =
	 * objectMapper.createObjectNode(); editorNode.put("id", "canvas");
	 * editorNode.put("resourceId", "canvas"); ObjectNode stencilSetNode =
	 * objectMapper.createObjectNode(); stencilSetNode.put("namespace",
	 * "http://b3mn.org/stencilset/bpmn2.0#"); editorNode.put("stencilset",
	 * stencilSetNode); Model modelData = repositoryService.newModel();
	 * 
	 * ObjectNode modelObjectNode = objectMapper.createObjectNode();
	 * modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
	 * modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
	 * description = StringUtils.defaultString(description);
	 * modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION,
	 * description); modelData.setMetaInfo(modelObjectNode.toString());
	 * modelData.setName(name);
	 * modelData.setKey(StringUtils.defaultString(key));
	 * 
	 * repositoryService.saveModel(modelData);
	 * repositoryService.addModelEditorSource(modelData.getId(),
	 * editorNode.toString().getBytes("utf-8"));
	 * 
	 * response.sendRedirect(request.getContextPath() +
	 * "/act-process-editor/modeler.html?modelId=" + modelData.getId()); } catch
	 * (Exception e) { logger.error("创建模型失败", e); } }else{ try {
	 * response.sendRedirect(request.getContextPath()
	 * +"/backstage/noAuthorized"); } catch (Exception e) {
	 * logger.error(e.toString(),e); } } }
	 *//**
	 * 编辑模型
	 */
	/*
	 * @RequestMapping(value = "edit") public void edit(String
	 * modelId,HttpServletRequest request, HttpServletResponse response) { try {
	 * if(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON)){
	 * response.sendRedirect(request.getContextPath() +
	 * "/act-process-editor/modeler.html?modelId=" + modelId); }else{
	 * response.sendRedirect(request.getContextPath()
	 * +"/backstage/noAuthorized"); } }catch (Exception e) {
	 * logger.error(e.toString(),e); } }
	 *//**
	 * 根据Model部署流程
	 */
	/*
	 * @RequestMapping(value = "deploy",method=RequestMethod.POST)
	 * 
	 * @ResponseBody public AjaxRes deploy(String modelId) { AjaxRes
	 * ar=getAjaxRes();
	 * if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){ try {
	 * Model modelData = repositoryService.getModel(modelId); ObjectNode
	 * modelNode = (ObjectNode) new ObjectMapper()
	 * .readTree(repositoryService.getModelEditorSource(modelData.getId()));
	 * byte[] bpmnBytes = null; BpmnModel model = new
	 * BpmnJsonConverter().convertToBpmnModel(modelNode); bpmnBytes = new
	 * BpmnXMLConverter().convertToXML(model); String processName =
	 * modelData.getName() + ".bpmn20.xml"; Deployment deployment =
	 * repositoryService.createDeployment()
	 * .name(modelData.getName()).addString(processName, new
	 * String(bpmnBytes)).deploy(); ar.setSucceedMsg("模型部署流程成功");
	 * logger.info("模型部署流程成功，部署ID=" + deployment.getId()); } catch (Exception e)
	 * { logger.error("根据模型部署流程失败：modelId={}", modelId, e);
	 * ar.setFailMsg("模型部署流程失败"); } } return ar; }
	 *//**
	 * 导出model对象为指定类型
	 * 
	 * @param modelId
	 *            模型ID
	 * @param type
	 *            导出文件类型(bpmn\json)
	 */
	/*
	 * @RequestMapping(value = "export/{modelId}/{type}") public void
	 * export(@PathVariable("modelId") String modelId,@PathVariable("type")
	 * String type, HttpServletResponse response) {
	 * if(doSecurityIntercept(Const.
	 * RESOURCES_TYPE_BUTTON,"/backstage/workflow/model/export")){ try { Model
	 * modelData = repositoryService.getModel(modelId); BpmnJsonConverter
	 * jsonConverter = new BpmnJsonConverter(); byte[] modelEditorSource =
	 * repositoryService.getModelEditorSource(modelData.getId());
	 * 
	 * JsonNode editorNode = new ObjectMapper().readTree(modelEditorSource);
	 * BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);
	 * 
	 * // 处理异常 if (bpmnModel.getMainProcess() == null) {
	 * response.setStatus(HttpStatus.UNPROCESSABLE_ENTITY.value());
	 * response.getOutputStream
	 * ().println("no main process, can't export for type: " + type);
	 * response.flushBuffer(); return; } String filename = ""; byte[]
	 * exportBytes = null; String mainProcessId =
	 * bpmnModel.getMainProcess().getId(); switch (type) { case "bpmn": {
	 * BpmnXMLConverter xmlConverter = new BpmnXMLConverter(); exportBytes =
	 * xmlConverter.convertToXML(bpmnModel); filename = mainProcessId +
	 * ".bpmn20.xml"; break; } case "json": { exportBytes = modelEditorSource;
	 * filename = mainProcessId + ".json"; break; } } ByteArrayInputStream in =
	 * new ByteArrayInputStream(exportBytes); IOUtils.copy(in,
	 * response.getOutputStream());
	 * 
	 * response.setHeader("Content-Disposition", "attachment; filename=" +
	 * filename); response.flushBuffer(); } catch (Exception e) {
	 * logger.error("导出model的xml文件失败：modelId={}, type={}", modelId, type); } } }
	 * 
	 * @RequestMapping(value = "del",method=RequestMethod.POST)
	 * 
	 * @ResponseBody public AjaxRes del(String modelId){ AjaxRes
	 * ar=getAjaxRes();
	 * if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){ try {
	 * repositoryService.deleteModel(modelId);
	 * ar.setSucceedMsg(Const.DEL_SUCCEED); } catch (Exception e) {
	 * logger.error(e.toString(),e); ar.setFailMsg(Const.DEL_FAIL); } } return
	 * ar; }
	 */
}
