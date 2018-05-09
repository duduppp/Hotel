package com.fh.entity.workflow;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.repository.Model;

import com.fh.util.DateUtil;
import com.fh.util.PageData;


/**
 * 工作流
 * @author Administrator
 *
 */
public class ModelVo {
	private String version;
	private String metaInfo;
	private String createTime;
	private String deploymentId;
	private String name;
	private String id;
	private String category;
	private String key;
	private String lastUpdateTime;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getMetaInfo() {
		return metaInfo;
	}
	public void setMetaInfo(String metaInfo) {
		this.metaInfo = metaInfo;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getDeploymentId() {
		return deploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	/**
	 *  模型装换
	 * @param list
	 * @return
	 */
	public static  List<ModelVo>  toModelVo(List<Model> list){
		List<ModelVo>  modelVoList=new ArrayList<ModelVo>();
		 for (Model model : list) {
			 ModelVo  modelVo=new ModelVo();
			 modelVo.setCategory(model.getCategory());
			 modelVo.setCreateTime(DateUtil.fomatDate(model.getCreateTime()));
			 modelVo.setDeploymentId(model.getDeploymentId());
			 modelVo.setId(model.getId());
			 modelVo.setKey(model.getKey());
			 modelVo.setLastUpdateTime(DateUtil.fomatDate(model.getLastUpdateTime()));
			 modelVo.setMetaInfo(model.getMetaInfo());
			 modelVo.setName(model.getName());
			 modelVo.setVersion(String.valueOf(model.getVersion()));
			 modelVoList.add(modelVo);
			 PageData pageData=new PageData();
		}
		
		return modelVoList;
		
	}
	

}
