package com.fh.service.educat.aboutinstructor.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.FileUtil;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.service.educat.aboutinstructor.AboutInstructorManager;

/** 
 * 说明： 讲师介绍
 * 创建人：dp
 * 创建时间：2017-09-18
 * @version
 */
@Service("aboutinstructorService")
public class AboutInstructorService implements AboutInstructorManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("AboutInstructorMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		
		PageData  pageData=	(PageData)dao.findForObject("AboutInstructorMapper.findById", pd);
		String fileName1=pageData.getString("PICTURE1");
		String fileName2=pageData.getString("PICTURE2");
		String fileName3=pageData.getString("PICTURE3");
		String fileName4=pageData.getString("PICTURE4");
		String devepPath=PathUtil.getDevelopPath();
		devepPath=	devepPath.substring(0,devepPath.indexOf("WEB-INF"))+"uploadFiles/edu/";
		if(null!=fileName1&&fileName1.length()>0){
			FileUtil.deleteFile(devepPath+fileName1);  	
		}
		if(null!=fileName2&&fileName2.length()>0){
			FileUtil.deleteFile(devepPath+fileName2);	
		}
		if(null!=fileName1&&fileName3.length()>0){
			FileUtil.deleteFile(devepPath+fileName3);	
		}
		if(null!=fileName1&&fileName4.length()>0){
			FileUtil.deleteFile(devepPath+fileName4);	
		}
	
		dao.delete("AboutInstructorMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("AboutInstructorMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AboutInstructorMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AboutInstructorMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AboutInstructorMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AboutInstructorMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

