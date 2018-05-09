package com.fh.service.educat.coursetype.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.educat.Coursetype;
import com.fh.entity.system.Department;
import com.fh.util.PageData;
import com.fh.service.educat.coursetype.CoursetypeManager;

/** 
 * 说明： 课程分类
 * 创建人：dp
 * 创建时间：2017-09-18
 * @version
 */
@Service("coursetypeService")
public class CoursetypeService implements CoursetypeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CoursetypeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CoursetypeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CoursetypeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CoursetypeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CoursetypeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CoursetypeMapper.findById", pd);
	}

	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Coursetype> listByParentId(String parentId) throws Exception {
		return (List<Coursetype>) dao.findForList("CoursetypeMapper.listByParentId", parentId);
	}
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<Coursetype> listTree(String parentId) throws Exception {
		List<Coursetype> valueList = this.listByParentId(parentId);
		for(Coursetype fhentity : valueList){
			fhentity.setTreeurl("coursetype/list.do?COURSETYPE_ID="+fhentity.getCOURSETYPE_ID());
			fhentity.setSubCoursetype(this.listTree(fhentity.getCOURSETYPE_ID()));
			fhentity.setTarget("treeFrame");
		}
		return valueList;
	}

	@Override
	public PageData findByNAME(PageData pd) throws Exception {
		 
		return (PageData)dao.findForObject("CoursetypeMapper.findByNAME", pd);  
	}

		
}

