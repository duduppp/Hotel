package com.fh.controller.system.user;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.fh.controller.base.BaseController;
import com.fh.service.system.user.UserManager;
import com.fh.util.PageData;

public class TimingEndUserQuartzJob extends BaseController implements Job {

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {

		// 普通类从spring容器中拿出service
		WebApplicationContext webctx = ContextLoader
				.getCurrentWebApplicationContext();
		
		//查询用户  ，是否到期
		UserManager userManager = (UserManager) webctx.getBean("userService");  
	 
		//endtime 是否大于当前时间  
		
		
	}

}
