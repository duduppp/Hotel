package com.fh.entity.educat;

import java.util.List;

import org.apache.ibatis.type.Alias;

/** 
 * 说明：课程分类 实体类
 * 创建人：dp
 * 创建时间：2017-09-18
 */
public class Coursetype{ 
	
	private String COURSETYPE_ID;	//主键
	private String NAME;					//名称
	private String PARENT_ID;				//父类ID
	private String target;
	private Coursetype coursetype;
	private List<Coursetype> subCoursetype;
	private boolean hasCoursetype = false;
	private String treeurl;
	
	private String COURSE_NAME;			//课程类别
	public String getFCOURSE_NAME() {
		return COURSE_NAME;
	}
	public void setFCOURSE_NAME(String COURSE_NAME) {
		this.COURSE_NAME = COURSE_NAME;
	}

	public String getCOURSETYPE_ID() {
		return COURSETYPE_ID;
	}
	public void setCOURSETYPE_ID(String COURSETYPE_ID) {
		this.COURSETYPE_ID = COURSETYPE_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String NAME) {
		this.NAME = NAME;
	}
	public String getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(String PARENT_ID) {
		this.PARENT_ID = PARENT_ID;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public Coursetype getCoursetype() {
		return coursetype;
	}
	public void setCoursetype(Coursetype coursetype) {
		this.coursetype = coursetype;
	}
	public List<Coursetype> getSubCoursetype() {
		return subCoursetype;
	}
	public void setSubCoursetype(List<Coursetype> subCoursetype) {
		this.subCoursetype = subCoursetype;
	}
	public boolean isHasCoursetype() {
		return hasCoursetype;
	}
	public void setHasCoursetype(boolean hasCoursetype) {
		this.hasCoursetype = hasCoursetype;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}
	
}
