package com.fh.controller.educat.coursetype;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.educat.coursetype.CoursetypeManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：课程分类
 * 创建人：dp
 * 创建时间：2017-09-18
 */
@Controller
@RequestMapping(value="/coursetype")
public class CoursetypeController extends BaseController {
	
	String menuUrl = "coursetype/list.do"; //菜单地址(权限用)
	@Resource(name="coursetypeService")
	private CoursetypeManager coursetypeService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Coursetype");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("COURSETYPE_ID", this.get32UUID());	//主键
		coursetypeService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String COURSETYPE_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Coursetype");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} 					//校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd.put("COURSETYPE_ID", COURSETYPE_ID);
		String errInfo = "success";
		if(coursetypeService.listByParentId(COURSETYPE_ID).size() > 0){		//判断是否有子级，是：不允许删除
			errInfo = "false";
		}else{
			coursetypeService.delete(pd);	//执行删除
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Coursetype");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		coursetypeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Coursetype"); 
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} 	//校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");								//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		
		
		
		String COURSETYPE_ID = null == pd.get("COURSETYPE_ID")?"":pd.get("COURSETYPE_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			COURSETYPE_ID = pd.get("id").toString();
		}
		pd.put("COURSETYPE_ID", COURSETYPE_ID);					//上级ID
		page.setPd(pd);
		List<PageData>	varList = coursetypeService.list(page);			//列出Coursetype列表
		mv.setViewName("educat/coursetype/coursetype_list");
		mv.addObject("pd", coursetypeService.findById(pd));				//传入上级所有信息
		mv.addObject("COURSETYPE_ID", COURSETYPE_ID);			//上级ID
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());								//按钮权限
		return mv;
	}
	
	@RequestMapping(value="/listCourseTypeForWindow")
	public ModelAndView listCourseTypeForWindow(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Coursetype"); 
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} 	//校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");								//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		
		String COURSETYPE_ID = null == pd.get("COURSETYPE_ID")?"":pd.get("COURSETYPE_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			COURSETYPE_ID = pd.get("id").toString();
		}
		pd.put("COURSETYPE_ID", COURSETYPE_ID);					//上级ID
		page.setPd(pd);
		List<PageData>	varList = coursetypeService.list(page);			//列出Coursetype列表
		mv.setViewName("educat/coursetype/window_coursetype");
		mv.addObject("pd", coursetypeService.findById(pd));				//传入上级所有信息
		mv.addObject("COURSETYPE_ID", COURSETYPE_ID);			//上级ID
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());								//按钮权限
		return mv;
	}
	
	

	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listTree")
	public ModelAndView listTree(Model model,String COURSETYPE_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(coursetypeService.listTree("0"));
			String json = arr.toString();
			json = json.replaceAll("COURSETYPE_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subCoursetype", "nodes").replaceAll("hasCoursetype", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("COURSETYPE_ID",COURSETYPE_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("educat/coursetype/coursetype_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String COURSETYPE_ID = null == pd.get("COURSETYPE_ID")?"":pd.get("COURSETYPE_ID").toString();
		pd.put("COURSETYPE_ID", COURSETYPE_ID);					//上级ID
		mv.addObject("pds",coursetypeService.findById(pd));				//传入上级所有信息
		mv.addObject("COURSETYPE_ID", COURSETYPE_ID);			//传入ID，作为子级ID用
		mv.setViewName("educat/coursetype/coursetype_edit");
		mv.addObject("msg", "save");
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String COURSETYPE_ID = pd.getString("COURSETYPE_ID");
		pd = coursetypeService.findById(pd);							//根据ID读取		
		mv.addObject("pd", pd);													//放入视图容器
		pd.put("COURSETYPE_ID",pd.get("PARENT_ID").toString());			//用作上级信息
		mv.addObject("pds",coursetypeService.findById(pd));				//传入上级所有信息
		mv.addObject("COURSETYPE_ID", pd.get("PARENT_ID").toString());	//传入上级ID，作为子ID用
		pd.put("COURSETYPE_ID",COURSETYPE_ID);					//复原本ID
		pd = coursetypeService.findById(pd);							//根据ID读取
		mv.setViewName("educat/coursetype/coursetype_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Coursetype到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("课程类别");	//1
		dataMap.put("titles", titles);
		List<PageData> varOList = coursetypeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("COURSE_NAME"));	    //1
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
