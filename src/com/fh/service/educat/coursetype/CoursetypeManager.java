package com.fh.service.educat.coursetype;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.educat.Coursetype;
import com.fh.util.PageData;

/** 
 * 说明： 课程分类接口
 * 创建人：dp
 * 创建时间：2017-09-18
 * @version
 */
public interface CoursetypeManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<Coursetype> listByParentId(String parentId) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<Coursetype> listTree(String parentId) throws Exception;
	
	/**
	 * 通过名称查询 课程类型 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByNAME(PageData pd)throws Exception;
	
 
}

