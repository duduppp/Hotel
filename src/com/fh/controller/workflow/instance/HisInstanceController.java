package com.fh.controller.workflow.instance;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.workflow.process.HistoricProcessInstanceVo;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

 
/**
 * 历史流程管理
 */
@Controller
@RequestMapping(value = "/workflow/instance/")
public class HisInstanceController extends BaseController{

	
	String menuUrl = "workflow/instance/list.do";  
	
	@Autowired
	 private HistoryService historyService;

	 	
	@RequestMapping(value = "list")
	@ResponseBody 
	public ModelAndView list(Page page) {
	 
		logBefore(logger, Jurisdiction.getUsername()+"列表Model");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		
		ModelAndView mv = this.getModelAndView();
		PageData pageData = new PageData();
		pageData = this.getPageData();
		String keywords = pageData.getString("name");					//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			keywords= keywords.trim(); 
		}
		page.setPd(pageData); 
		int pageNum = page.getCurrentPage(); 
		int pageSize=page.getShowCount(); 
		 
		HistoricProcessInstanceQuery query=historyService.createHistoricProcessInstanceQuery().finished()
				.orderByProcessInstanceEndTime().desc();
		List<HistoricProcessInstance> list = query.listPage(pageNum, pageSize);
		List<HistoricProcessInstanceVo> vos=new ArrayList<HistoricProcessInstanceVo>();
		for (HistoricProcessInstance t : list) {
			HistoricProcessInstanceVo vo = new HistoricProcessInstanceVo(t.getId() ,t.getProcessDefinitionId(),
					t.getStartTime(), t.getEndTime(), t.getDeleteReason());
		 
			vos.add(vo);
		}
		long countLong=query.count();
		int count=(int) countLong;
		page.setTotalResult(count); 
		page.setTotalPage(vos.size());

		mv.setViewName("workflow/instance/his_list");  
		mv.addObject("varList", vos);
		mv.addObject("pd", pageData);  
		mv.addObject("page", page);  
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		 
		return mv;
	}
	 
}
