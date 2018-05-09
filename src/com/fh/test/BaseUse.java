package com.fh.test;

import java.util.Date;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fh.plugin.Test;
public class BaseUse {


	/**
	 *   单测    运行
	 * @param args
	 * @throws Exception
	 */
    public static void main(String[] args) throws Exception {

        //首先要通过工厂方法schedulerFactory的一个实现获取一个Scheduler对象作为调度器
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        Scheduler scheduler = schedulerFactory.getScheduler();
        //获取一个下一分钟的调度时间
        
        CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule("0/5 * * * * ?");
        

        //每个job都归于一个name和一个group作为任务的坐标，创建一个BaseJob的JobDetail 
        JobDetail detail =JobBuilder.newJob(Test.class).withIdentity("job1", "group1").build();

        //每个trigger都归于一个name和一个group作为的触发器的坐标，创建触发器Trigger 
        Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger1", "group1").withSchedule(scheduleBuilder).build(); 

        //调度器按JobDetail 、Trigger初始化调度器，相当于加入调度队列
        scheduler.scheduleJob(detail, trigger);

        //开启调度
        scheduler.start();

        Thread.sleep(10000);
        //结束调度
        scheduler.shutdown();

    }

}