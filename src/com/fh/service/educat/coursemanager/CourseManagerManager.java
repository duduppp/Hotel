package com.fh.service.educat.coursemanager;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 课程管理接口
 * 创建人：dp
 * 创建时间：2017-09-18
 * @version
 */
public interface CourseManagerManager{

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
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	
	/**
	 *  排行
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> rankingList(PageData pd)throws Exception;
	
	/**
	 *  排行按讲师
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> rankingByLecture(PageData pd)throws Exception;
	
	
	/**
	 * 相关推荐
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> recommendRelated (PageData pd)throws Exception;
	
	/**
	 * 相关课程
	 * @param pd
	 * @return
	 * @throws Exception
	 */ 
	public List<PageData> courseRelated (PageData pd)throws Exception;
	
	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> newestCourseList(PageData pd)throws Exception; 
	
}

