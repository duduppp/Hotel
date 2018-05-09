package com.fh.service.system.task_schedule;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 定时任务初始化
 */
@Component
public class ScheduleJobInit {

	/** 日志对象 */
	private static final Logger LOG = LoggerFactory
			.getLogger(ScheduleJobInit.class);
	
	@Resource(name="task_scheduleService")
	private Task_scheduleManager task_scheduleService; 

	/** 定时任务service */
 
	/**
	 * 项目启动时初始化
	 */
	@PostConstruct
	public void init() {
		 LOG.info("定时任务初始化init");
		try {
			task_scheduleService.initScheduleJob();
		} catch (Exception e) {
			e.printStackTrace();
			LOG.info("定时任务初始化失败");
		}
		LOG.info("定时任务初始化end"); 
	}

}
