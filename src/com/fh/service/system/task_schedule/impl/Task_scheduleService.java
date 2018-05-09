package com.fh.service.system.task_schedule.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.base.ScheduleJob;
import com.fh.service.system.task_schedule.Task_scheduleManager;
import com.fh.util.PageData;
import com.fh.util.ScheduleUtils;

/** 
 * 说明： 定时任务管理
 * 创建人：dp
 * 创建时间：2017-09-06
 * @version
 */
@Service("task_scheduleService")
public class Task_scheduleService implements Task_scheduleManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	private static SchedulerFactory gSchedulerFactory = new StdSchedulerFactory(); // 创建一个SchedulerFactory工厂实例
 
		 
 
	 
	 
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("Task_scheduleMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("Task_scheduleMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("Task_scheduleMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Task_scheduleMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Task_scheduleMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Task_scheduleMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Task_scheduleMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<ScheduleJob> list(PageData pd) throws Exception {
		return (List<ScheduleJob>)dao.findForList("Task_scheduleMapper.listAll", pd);
	}

	@Override
	public ScheduleJob findByIdToJob(PageData pd) throws Exception { 
		return (ScheduleJob) dao.findForObject("Task_scheduleMapper.findById", pd);
	}

	@Override
	public void initScheduleJob() throws Exception { 
		//查找启用的任务
		PageData  pageData=new PageData();
		pageData.put("STATUS", 1);
		List<PageData> pageDataList=this.listAll(pageData);
		Scheduler	scheduler=gSchedulerFactory.getScheduler();
		if (CollectionUtils.isNotEmpty(pageDataList)) {
			for (PageData newPageData : pageDataList) {
				
				ScheduleJob	scheduleJob=ScheduleJob.setScheduleJob(newPageData);
			
				CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getJOBNAME(),scheduleJob.getJOBGROUP());
			 
					if (cronTrigger == null) {
						// 不存在，创建一个
						ScheduleUtils.createScheduleJob(scheduler, scheduleJob);	
					} else {
						// 已存在，那么更新相应的定时设置
						ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
					}
			}
		}
	}

	
	
	public int creatScheduleJob(PageData  pageData) throws Exception {
		int res=0;
		Scheduler	scheduler=gSchedulerFactory.getScheduler();
			pageData.put("CREATETIME", new Date());
			if(null!=pageData.get("STATUS")){
				   
				int status=(Integer) pageData.get("STATUS"); 
				//当状态为启用时
				if(status==1){
					ScheduleJob scheduleJob=ScheduleJob.setScheduleJob(pageData);
					
					ScheduleUtils.createScheduleJob(scheduler,scheduleJob);		
				}
				//更新数据库
				this.edit(pageData);
				 
				res=1;
			}
			
		 
		return res;
	}
	public int updateScheduleJob(PageData  pageData) throws Exception {
		int res=0;
		Scheduler	scheduler=gSchedulerFactory.getScheduler();
			//从数据库查找原信息
			ScheduleJob scheduleJob=this.findByIdToJob(pageData);
 
			//先删除
			ScheduleUtils.deleteScheduleJob(scheduler,scheduleJob.getJOBNAME(),scheduleJob.getJOBGROUP());
			//当状态为启用时
			if( scheduleJob.getSTATUS()==1){
				ScheduleUtils.createScheduleJob(scheduler, scheduleJob);		
			}
			//更新数据库
			scheduleJob.setUPDATETIME(new Date());
		 
			PageData  newpageData=ScheduleJob.setPageData(scheduleJob);
			this.edit(newpageData);
			res=1;
 
		return res;
	}

	
	public int deleteScheduleJob(PageData  pageData) {
		int res=0;
	
		try {
			Scheduler	scheduler=gSchedulerFactory.getScheduler();
			//从数据库查找原信息
			ScheduleJob scheduleJob=this.findByIdToJob(pageData);
			//先删除
			ScheduleUtils.deleteScheduleJob(scheduler, scheduleJob.getJOBNAME(),scheduleJob.getJOBGROUP());
			//更新数据库
			this.delete(pageData); 
			res=1;
		}catch (Exception e) {
		//	logger.error("删除任务失败", e);
		}
		return res;
	}

	
	public int runOnce(PageData  pageData) throws Exception {
		int res=0;
		Scheduler	scheduler=gSchedulerFactory.getScheduler();
			//从数据库查找原信息
		PageData newPageData=this.findById(pageData);
			ScheduleJob scheduleJob=ScheduleJob.setScheduleJob(newPageData);
			if(scheduleJob.getSTATUS()!=null && scheduleJob.getSTATUS()==1){
				//运行一次任务
				res=2;
			}else{
				//当任务没启动，必须先创建
				ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
				//时间短可能促发多次
				//ScheduleUtils.pauseJob(scheduler,scheduleJob.getJobName(), scheduleJob.getJobGroup());
				//然后立刻运行一次任务
				ScheduleUtils.runOnce(scheduler, scheduleJob.getJOBNAME(), scheduleJob.getJOBGROUP());
				try {
					//休眠3秒，等任务完成，完成不了就加长休眠时间吧...
			        Thread.sleep(3000);
			    } catch (InterruptedException e) {
			        e.printStackTrace();
			    }
				//再删除任务
				ScheduleUtils.deleteScheduleJob(scheduler,scheduleJob.getJOBNAME(), scheduleJob.getJOBGROUP());
				res=1;
			}			
	 
		return res;
	}

	
	public int pauseJob(PageData  pageData) {
		int res=0;
		try {
			//从数据库查找原信息
			Scheduler	scheduler=gSchedulerFactory.getScheduler(); 
			PageData newPageData=this.findById(pageData);
			ScheduleJob scheduleJob=ScheduleJob.setScheduleJob(newPageData);
			if(scheduleJob.getSTATUS()!=null && scheduleJob.getSTATUS()==1){
				//判断jobKey为不为空，如为空，任务已停止
				//先暂停任务
				//ScheduleUtils.pauseJob(scheduler, scheduleJob.getJobName(), scheduleJob.getJobGroup());		
				ScheduleUtils.deleteScheduleJob(scheduler, scheduleJob.getJOBNAME(), scheduleJob.getJOBGROUP());
				//更新数据库
				scheduleJob.setSTATUS(0);
				scheduleJob.setUPDATETIME(new Date()); 
				PageData  editPageData=	ScheduleJob.setPageData(scheduleJob);
				this.edit(editPageData);
				res=1;
			}else{	
				//任务没启动，谈何暂停...
				res=2;			
			}
		} catch (Exception e) {
			e.printStackTrace();
			//logger.error("暂停定时任务失败", e);
		}
		return res;
	}

	
	@Override
	public int resumeJob(PageData  pageData) throws Exception {
		
		     int res=0;		 
		     Scheduler	scheduler=gSchedulerFactory.getScheduler();
			//从数据库查找原信息
			PageData newPageData=this.findById(pageData); 
			ScheduleJob scheduleJob=ScheduleJob.setScheduleJob(newPageData);
			if(scheduleJob.getSTATUS()!=null && scheduleJob.getSTATUS()==0){
				ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
				//更新数据库
				scheduleJob.setSTATUS(1);
				scheduleJob.setUPDATETIME(new Date());
				PageData editPageData=	ScheduleJob.setPageData(scheduleJob);
				this.edit(editPageData);
				res=1;
			}else{
				res=2;
			}
		 
		return res;
	}

	
}

