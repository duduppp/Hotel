package com.fh.controller.website.graphic;

import java.io.PrintWriter;
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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.website.graphic.GraphicManager;


 
/** 
 * 说明：网站图文
 * 创建人：dp
 * 创建时间：2017-04-20
 */
@Controller
@RequestMapping(value="/graphic")
public class GraphicController extends BaseController {
	
	String menuUrl = "graphic/list.do"; //菜单地址(权限用)
	@Resource(name="graphicService")
	private GraphicManager graphicService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Graphic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GRAPHIC_ID", this.get32UUID());	//主键
		graphicService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Graphic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		graphicService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Graphic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		graphicService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Graphic");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		 
		PageData pd = new PageData();
		pd = this.getPageData();
		String username=user.getUSERNAME();
		if(!username.equalsIgnoreCase("admin")){ 
			pd.put("NAME", user.getNAME()); 
		}
		String keywords = pd.getString("keywords"); 				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = graphicService.list(page);	//列出Graphic列表
		mv.setViewName("website/graphic/graphic_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/videoList")
	public ModelAndView videoList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Graphic");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		 
		PageData pd = new PageData();
		pd = this.getPageData();
		String username=user.getUSERNAME();
		if(!username.equalsIgnoreCase("admin")){ 
			pd.put("NAME", user.getNAME()); 
		}
		pd.put("CATALOG_NAME", "在线视频"); 
		String keywords = pd.getString("keywords"); 				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = graphicService.list(page);	//列出Graphic列表
		mv.setViewName("website/graphic/graphic_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
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
		mv.setViewName("website/graphic/graphic_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = graphicService.findById(pd);	//根据ID读取
		mv.setViewName("website/graphic/graphic_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
 
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Graphic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			graphicService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Graphic到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("主目录");	//1
		titles.add("子目录");	//2
		titles.add("孙子目录");	//3
		titles.add("录入时间");	//4
		titles.add("编辑人");	//5
		titles.add("内容");	//6
		titles.add("标题");	//7
		titles.add("简介");	//8
		titles.add("上传图片");	//9
		titles.add("是否展示");	//10
		titles.add("排序编号");	//11
		titles.add("主目录名称");	//12
		titles.add("子目录名称");	//13
		titles.add("孙子目录名称");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = graphicService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CATALOG"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUBDIRECTORY"));	    //2
			vpd.put("var3", varOList.get(i).getString("SUNCATALOGUE"));	    //3
			vpd.put("var4", varOList.get(i).getString("INPUTDATE"));	    //4
			vpd.put("var5", varOList.get(i).getString("NAME"));	    //5
			vpd.put("var6", varOList.get(i).getString("CONTENT"));	    //6
			vpd.put("var7", varOList.get(i).getString("TITLE"));	    //7
			vpd.put("var8", varOList.get(i).getString("BRIEF_INTRODUCTION"));	    //8
			vpd.put("var9", varOList.get(i).getString("IMGPATH"));	    //9
			vpd.put("var10", varOList.get(i).get("SHOWSTATUS").toString());	//10
			vpd.put("var11", varOList.get(i).get("SORT_NO").toString());	//11
			vpd.put("var12", varOList.get(i).getString("CATALOG_NAME"));	    //12
			vpd.put("var13", varOList.get(i).getString("SUBDIRECTORY_NAME"));	    //13
			vpd.put("var14", varOList.get(i).getString("SUNCATALOGUE_NAME"));	    //14
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
