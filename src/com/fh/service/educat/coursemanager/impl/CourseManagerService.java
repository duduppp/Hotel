package com.fh.service.educat.coursemanager.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.educat.coursemanager.CourseManagerManager;
import com.fh.util.FileUtil;
import com.fh.util.Logger;
import com.fh.util.PageData;

/** 
 * 说明： 课程管理
 * 创建人：dp
 * 创建时间：2017-09-18
 * @version
 */
@SuppressWarnings("unchecked")
@Service("coursemanagerService")
public class CourseManagerService implements CourseManagerManager{

	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CourseManagerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		
		
		//这里要删除  上传的文件
		PageData newpd=	this.findById(pd);
		String IMGPATH=newpd.getString("IMGPATH");
		String FILEPATH=newpd.getString("FILEPATH");
		String SCREENSHOT=newpd.getString("SCREENSHOT");
		String SHARE2CODE=newpd.getString("SHARE2CODE");
		String COURSEURL=newpd.getString("COURSEURL");
		String rootPath=FileUtil.getWebInfPath(); 
		
		if(FileUtil.deleteFile(rootPath+SHARE2CODE)){
			logger.info("删除文件"+SHARE2CODE);  
		}
		
		if(FileUtil.deleteFile(rootPath+IMGPATH)){
			logger.info("删除文件"+IMGPATH);
		}
		
		if(FileUtil.deleteFile(rootPath+FILEPATH)){
		
			logger.info("删除文件"+FILEPATH);	
		}
		
		if(FileUtil.deleteFile(rootPath+SCREENSHOT)){
			
			logger.info("删除文件"+SCREENSHOT);	
		}
		
		if(FileUtil.deleteFile(rootPath+COURSEURL)){
			
			logger.info("删除文件"+COURSEURL);  	
		}
		dao.delete("CourseManagerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CourseManagerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagerMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagerMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CourseManagerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CourseManagerMapper.deleteAll", ArrayDATA_IDS); 
	}

	
	public List<PageData> rankingList(PageData pd) throws Exception {  
		
		return ((List<PageData>)dao.findForList("CourseManagerMapper.rankingList", pd));
		
	}   
 

	public List<PageData> courseRelated(PageData pd) throws Exception { 
		 
		String methodName=	Thread.currentThread().getStackTrace()[1].getMethodName();
		return (List<PageData>)dao.findForList("CourseManagerMapper."+methodName, pd); 
	}

	@Override
	public List<PageData> recommendRelated(PageData pd) throws Exception {
		
		String methodName=	Thread.currentThread().getStackTrace()[1].getMethodName();
		return (List<PageData>)dao.findForList("CourseManagerMapper."+methodName, pd); 
	}

	@Override
	public List<PageData> newestCourseList(PageData pd) throws Exception {
		   
		String methodName=	Thread.currentThread().getStackTrace()[1].getMethodName();
		return (List<PageData>)dao.findForList("CourseManagerMapper."+methodName, pd); 
	}

	@Override
	public List<PageData> rankingByLecture(PageData pd) throws Exception {
		 
		return ((List<PageData>)dao.findForList("CourseManagerMapper.rankingByLecture", pd));
	}
	
}

