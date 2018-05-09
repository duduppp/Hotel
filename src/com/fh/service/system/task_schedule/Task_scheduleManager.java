package com.fh.service.system.task_schedule;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.base.ScheduleJob;
import com.fh.util.PageData;

/** 
 * 说明： 定时任务管理接口
 * 创建人：dp
 * 创建时间：2017-09-06
 * @version
 */
public interface Task_scheduleManager{

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
	public List<PageData>   listAll(PageData pd)throws Exception;
	
	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleJob> list(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	
	public ScheduleJob findByIdToJob(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;


    /**
     * 初始化定时任务
     * @throws Exception 
     */
    public void initScheduleJob() throws Exception;

    /**
     * 新增
     * 
     * @param TaskLog
     * @return
     */
    public int creatScheduleJob(PageData  pageData)throws Exception;

    
    /**
     * 直接修改 只能修改运行的时间，参数、同异步等无法修改
     * 
     * @param TaskLog
     */
    public int updateScheduleJob(PageData  pageData)throws Exception;

    /**
     * 删除
     * 
     * @param scheduleJobId
     */
    public int deleteScheduleJob(PageData  pageData)throws Exception;

    /**
     * 运行一次任务
     *
     * @param scheduleJobId the schedule job id
     * @return
     */
    public int runOnce(PageData  pageData)throws Exception;

    /**
     * 暂停任务
     *
     * @param scheduleJobId the schedule job id
     * @return
     */
    public int pauseJob(PageData  pageData)throws Exception;

     

	int resumeJob(PageData pageData) throws Exception;
	
}

