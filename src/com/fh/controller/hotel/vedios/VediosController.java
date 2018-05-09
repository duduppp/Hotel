package com.fh.controller.hotel.vedios;

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
import com.fh.service.hotel.vedios.VediosManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.CreatePh;
import com.fh.util.DateUtil;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：上传视频
 * 创建人：dp
 * 创建时间：2017-07-13
 */
@Controller
@RequestMapping(value="/vedios")
public class VediosController extends BaseController {
	
	String menuUrl = "vedios/list.do"; //菜单地址(权限用)
	@Resource(name="vediosService")
	private VediosManager vediosService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
	
		logBefore(logger, Jurisdiction.getUsername()+"新增Vedios");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("VEDIOS_ID", this.get32UUID());	//主键
	
		
		// 上传成功，
		String source="";     
		 
		String target=""; 
		String filePath=pd.getString("FILEPATH");
		String syspath=FileUtil.getSysPath(); 
		String rootPath=syspath.substring(0, syspath.indexOf("WEB-INF")-1) ;
	
		source=rootPath+filePath;  
		
		target=rootPath+"/uploadFiles/hotel/videos/"+"ffmpeg.exe";  
		//生成图片
		Map<String, String> vedioinfoMap= CreatePh.getInfo(target, source); 
	    String videoname=filePath.substring(1,filePath.indexOf("."))+".jpg";   
	    //已经转码
	    String newPath=filePath.substring(0,filePath.lastIndexOf("."))+".flv"; 
	    pd.put("FILEPATH",newPath);
		pd.put("SCREENSHOT", videoname);       
	 
		String filesize=FileUtil.getFileSize(source); 
		pd.put("FILESIZE",filesize);	//主键
		
		vedioinfoMap.get("bitrate");
		pd.put("RESOLUTION", vedioinfoMap.get("bitrate")); 
		pd.put("PLAYTIME", vedioinfoMap.get("playtime"));
		pd.put("CREATETIME", DateUtil.getTime());  
		pd.put("DESCRIP", "未定义"); 
		vediosService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Vedios");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData delpd= vediosService.findById(pd);
		String FILEPATH=delpd.getString("FILEPATH");
		String SCREENSHOT=delpd.getString("SCREENSHOT");
		String syspath=FileUtil.getSysPath(); 
		String rootPath=syspath.substring(0, syspath.indexOf("WEB-INF")-1) +FILEPATH;
		String imgpath=syspath.substring(0, syspath.indexOf("WEB-INF")) +SCREENSHOT;
		
		FileUtil.deleteFile(rootPath);  
		FileUtil.deleteFile(imgpath);   
		vediosService.delete(pd);
		out.write("success");
		out.close();
	} 
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Vedios");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		vediosService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Vedios");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String LOGINNAME=pd.getString("LOGINNAME");  
		if(LOGINNAME==null){
			User user = (User) Jurisdiction.getSession().getAttribute(
					Const.SESSION_USER);
			if(!user.getUSERNAME().equals("admin")){
				pd.put("LOGINNAME", user.getUSERNAME()); 
			}
		} 
		page.setPd(pd);
		List<PageData>	varList = vediosService.list(page);	//列出Vedios列表
		mv.setViewName("hotel/vedios/vedios_list");
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
		mv.setViewName("hotel/vedios/vedios_edit");
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
		pd = vediosService.findById(pd);	//根据ID读取
		mv.setViewName("hotel/vedios/vedios_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Vedios");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			vediosService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Vedios到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("标题");	//1
		titles.add("描述");	//2
		titles.add("分辨率");	//3
		titles.add("文件大小");	//4
		titles.add("影片时长");	//5
		titles.add("创建时间");	//6
		titles.add("文件路径");	//7
		titles.add("账户");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = vediosService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("DESCRIP"));	    //2
			vpd.put("var3", varOList.get(i).getString("RESOLUTION"));	    //3
			vpd.put("var4", varOList.get(i).getString("FILESIZE"));	    //4
			vpd.put("var5", varOList.get(i).getString("PLAYTIME"));	    //5
			vpd.put("var6", varOList.get(i).getString("CREATETIME"));	    //6
			vpd.put("var7", varOList.get(i).getString("FILEPATH"));	    //7
			vpd.put("var8", varOList.get(i).getString("LOGINNAME"));	    //8
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
	
	
	@RequestMapping(value = "/getplayVidoes")
	@ResponseBody
	public String getplayVidoes() throws Exception  { 

		PageData pd = new PageData(); 
		pd = this.getPageData();
		
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		pd.put("LOGINNAME", user.getUSERNAME()); //关键词检索条件
	 
		List<PageData> varList = vediosService.listAll(pd);  
		String json = "";
		if (null != varList) {
			JSONArray arr = JSONArray.fromObject(varList);
			json = arr.toString();
		}
		return json;
			
		 
	}
}
