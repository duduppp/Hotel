package com.fh.entity.base;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fh.util.PageData;

@Alias("ScheduleJob")
public class ScheduleJob extends BaseEntity{

	private static final long serialVersionUID = 1L;

	/** 任务id */
	private String  TASK_SCHEDULE_ID;

	/** 任务名称 */
	private String JOBNAME;

	/** 任务分组 */
	private String JOBGROUP;
	
    /** 任务别名 */
    private String  ALIASNAME;
	
	/** 指定执行类 */
	private String JOBCLASS;

	/** 任务状态  0停用 1启用 2删除 */
	private Integer STATUS;

	/** 任务运行时间表达式 */
	private String CRONEXPRESSION;

	/** 任务描述 */
	private String DESCRIPTION;

	/** 创建时间 */
	private Date CREATETIME;

	/** 修改时间 */
	private Date UPDATETIME;

	private String CRONEXPRESSION_EXPLAIN;
	
	
	public static ScheduleJob setScheduleJob(PageData pageData){ 
		
		ScheduleJob  scheduleJob=new ScheduleJob();
		scheduleJob.setTASK_SCHEDULE_ID(pageData.getString("TASK_SCHEDULE_ID"));
		scheduleJob.setJOBNAME(pageData.getString("JOBNAME"));
		scheduleJob.setJOBGROUP(pageData.getString("JOBGROUP"));
		scheduleJob.setALIASNAME(pageData.getString("ALIASNAME"));
		scheduleJob.setJOBCLASS(pageData.getString("JOBCLASS"));
		Integer  status=(Integer) pageData.get("STATUS");
	 
		scheduleJob.setSTATUS(status );
		scheduleJob.setCRONEXPRESSION(pageData.getString("CRONEXPRESSION"));
		scheduleJob.setDESCRIPTION(pageData.getString("DESCRIPTION"));
		scheduleJob.setCREATETIME((Date) pageData.get("CREATETIME"));
		scheduleJob.setUPDATETIME((Date) pageData.get("UPDATETIME"));
		scheduleJob.setCRONEXPRESSION_EXPLAIN(pageData.getString("CRONEXPRESSION_EXPLAIN")); 
		return scheduleJob;
	}
	
	
public static PageData  setPageData(ScheduleJob scheduleJob){
		
		PageData pageData=new PageData();
		pageData.put("TASK_SCHEDULE_ID",scheduleJob.getTASK_SCHEDULE_ID());
		pageData.put("JOBNAME",scheduleJob.getJOBNAME());
		pageData.put("JOBGROUP",scheduleJob.getJOBGROUP());
		pageData.put("ALIASNAME",scheduleJob.getALIASNAME());
		pageData.put("JOBCLASS",scheduleJob.getJOBCLASS());
		pageData.put("STATUS",scheduleJob.getSTATUS());
		pageData.put("CRONEXPRESSION",scheduleJob.getCRONEXPRESSION());
		pageData.put("DESCRIPTION",scheduleJob.getDESCRIPTION());
		pageData.put("CREATETIME",scheduleJob.getCREATETIME());
		pageData.put("UPDATETIME",scheduleJob.getUPDATETIME());
		pageData.put("CRONEXPRESSION_EXPLAIN",scheduleJob.getCRONEXPRESSION_EXPLAIN());
		 
		return pageData;
	}


	public String getTASK_SCHEDULE_ID() {
		return TASK_SCHEDULE_ID;
	}

	public void setTASK_SCHEDULE_ID(String tASK_SCHEDULE_ID) {
		TASK_SCHEDULE_ID = tASK_SCHEDULE_ID;
	}

	public String getJOBNAME() {
		return JOBNAME;
	}

	public void setJOBNAME(String jOBNAME) {
		JOBNAME = jOBNAME;
	}

	public String getJOBGROUP() {
		return JOBGROUP;
	}

	public void setJOBGROUP(String jOBGROUP) {
		JOBGROUP = jOBGROUP;
	}

	public String getALIASNAME() {
		return ALIASNAME;
	}

	public void setALIASNAME(String aLIASNAME) {
		ALIASNAME = aLIASNAME;
	}

	public String getJOBCLASS() {
		return JOBCLASS;
	}

	public void setJOBCLASS(String jOBCLASS) {
		JOBCLASS = jOBCLASS;
	}

	public Integer getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Integer sTATUS) {
		STATUS = sTATUS;
	}

	public String getCRONEXPRESSION() {
		return CRONEXPRESSION;
	}

	public void setCRONEXPRESSION(String cRONEXPRESSION) {
		CRONEXPRESSION = cRONEXPRESSION;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public Date getCREATETIME() {
		return CREATETIME;
	}

	public void setCREATETIME(Date cREATETIME) {
		CREATETIME = cREATETIME;
	}

	public Date getUPDATETIME() {
		return UPDATETIME;
	}

	public void setUPDATETIME(Date uPDATETIME) {
		UPDATETIME = uPDATETIME;
	}

	public String getCRONEXPRESSION_EXPLAIN() {
		return CRONEXPRESSION_EXPLAIN;
	}

	public void setCRONEXPRESSION_EXPLAIN(String cRONEXPRESSION_EXPLAIN) {
		CRONEXPRESSION_EXPLAIN = cRONEXPRESSION_EXPLAIN;
	}
	
	 
}
