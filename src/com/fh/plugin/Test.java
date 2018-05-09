package com.fh.plugin;

import java.util.Map;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.fh.controller.base.BaseController;
import com.fh.service.fhdb.timingbackup.impl.TimingBackUpService;
import com.fh.service.system.task_log.Task_logManager;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

public class Test extends BaseController implements Job {

	/* 日志对象 */
	private static final Logger LOG = LoggerFactory.getLogger(Test.class);

	 
	@Override
	public void execute(JobExecutionContext context) {
		//这里存储任务调度信息
		JobDataMap dataMap = context.getJobDetail().getJobDataMap();
		WebApplicationContext webctx = ContextLoader
				.getCurrentWebApplicationContext();
		Task_logManager task_logService = (Task_logManager) webctx.getBean("task_logService");
		String ddString = context.getJobDetail().getDescription();  
		PageData pageData = new PageData();
		pageData.put("TASK_LOG_ID", UuidUtil.get32UUID());
		pageData.put("NAME", "任务调度");
		pageData.put("CLASSNAME", "Test");
		pageData.put("TYPE", 1);
		pageData.put("DESCRIPTION", UuidUtil.get32UUID());
		pageData.put("CREATETIME", DateUtil.getCurrentDateTime());

		LOG.info("任务[" + ddString + "]成功运行");
		try {

			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			System.out.println("-------test----");
			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			// 保存日志
			task_logService.save(pageData);    
			System.out.println("^^^^^^^^^^^^日志保存成功^^^^^^^^^^^^^^^^^^");
		} catch (Exception e) {
			LOG.error("任务[" + ddString + "]异常", e);
		}
	}

	/**
	 * 把定时备份任务状态改为关闭
	 * 
	 * @param pd
	 * @param parameter
	 * @param webctx
	 */
	public void shutdownJob(JobExecutionContext context, PageData pd,
			Map<String, Object> parameter, WebApplicationContext webctx) {
		try {
			context.getScheduler().shutdown(); // 备份异常时关闭任务
			TimingBackUpService timingbackupService = (TimingBackUpService) webctx
					.getBean("timingbackupService");
			pd.put("STATUS", 2); // 改变定时运行状态为2，关闭
			pd.put("TIMINGBACKUP_ID", parameter.get("TIMINGBACKUP_ID")
					.toString()); // 定时备份ID
			timingbackupService.changeStatus(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
