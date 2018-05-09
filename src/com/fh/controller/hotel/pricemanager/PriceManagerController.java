package com.fh.controller.hotel.pricemanager;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
import com.fh.service.hotel.configtype.ConfigTypeManager;
import com.fh.service.hotel.housetype.HouseTypeManager;
import com.fh.service.hotel.pricemanager.PriceManagerManager;

/** 
 * 说明：房价管理
 * 创建人：dp
 * 创建时间：2017-07-03
 */
@Controller
@RequestMapping(value="/pricemanager")
public class PriceManagerController extends BaseController {
	
	String menuUrl = "pricemanager/list.do"; //菜单地址(权限用)
	@Resource(name="pricemanagerService")
	private PriceManagerManager pricemanagerService;
	
	@Resource(name="housetypeService")
	private HouseTypeManager housetypeService;
	
	@Resource(name="configtypeService")
	private ConfigTypeManager configtypeService;
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PriceManager");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PRICEMANAGER_ID", this.get32UUID());	//主键
		pricemanagerService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除PriceManager");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pricemanagerService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PriceManager");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pricemanagerService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PriceManager");
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
		List<PageData>	varList = pricemanagerService.list(page);	//列出PriceManager列表
		mv.setViewName("hotel/pricemanager/pricemanager_list");
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
		mv.setViewName("hotel/pricemanager/pricemanager_edit");
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
		pd = pricemanagerService.findById(pd);	//根据ID读取
		mv.setViewName("hotel/pricemanager/pricemanager_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PriceManager");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			pricemanagerService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PriceManager到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("房型");	//1
		titles.add("会员类型");	//2
		titles.add("价格");	//3
		titles.add("账户");	//4
		titles.add("备注");	//5
		titles.add("类型排序");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = pricemanagerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("HOUSETYPE"));	    //1
			vpd.put("var2", varOList.get(i).getString("MEMBERTYPE"));	    //2
			vpd.put("var3", varOList.get(i).getString("PRICE"));	    //3
			vpd.put("var4", varOList.get(i).getString("LOGINNAME"));	    //4
			vpd.put("var5", varOList.get(i).getString("REMARK"));	    //5
			vpd.put("var6", varOList.get(i).get("TYPESORT").toString());	//6
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
	
	
	/***
	 * 输出化，报表结构，只需要 在修改界面，修改数据，每次初始化删除以前旧记录
	 * 作用 ：   方便前台查询展现
	 * @throws Exception
	 */
	@RequestMapping(value="/initPrice")
	@ResponseBody
	public String initPersonalPriceInfo() throws Exception{
		
		
		PageData pd = new PageData(); 
		pd = this.getPageData();
		String ftype=this.getRequest().getParameter("ftype");
		
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		pd.put("LOGINNAME", user.getUSERNAME()); //关键词检索条件
		
		//TODO 删除个人所有信息
		pricemanagerService.deleteByLoginName(pd); 
	
		//先得到房间类型
		PageData housetypepd   = new PageData(); 
		housetypepd.put("LOGINNAME", user.getUSERNAME()); //关键词检索条件
		List<PageData> hostTypelList=	housetypeService.listAll(pd);
		
		int  houseCount=hostTypelList.size(); 
		
		//在得到会员类型
		PageData configtypepd   = new PageData(); 
		configtypepd.put("LOGINNAME", user.getUSERNAME()); //关键词检索条件
		List<PageData>  configtypeList=	configtypeService.listAll(pd);
		List<PageData>  priceManagerList   = new  ArrayList<PageData>();
		int  memCount=configtypeList.size();
		
		for (int i = -1; i <houseCount; i++) {
			
			for (int j = -1; j < memCount; j++) {
				
				String mapKey=String.valueOf(i+1)+"_"+String.valueOf(j+1);
				PageData vpd = new PageData();
				vpd.put("LOGINNAME", user.getUSERNAME());	    
				vpd.put("TYPESORT",mapKey);	
				if(i==-1&&j==-1){
					vpd.put("HOUSETYPE", ftype); 	
				}else{
					
					if(i==-1&&j!=-1){
						String membertype=configtypeList.get(j).getString("MEMBERTYPE");   
						vpd.put("MEMBERTYPE",membertype);	
					}
					if(j==-1&&i!=-1){
						String typename=hostTypelList.get(i).getString("TYPENAME");	
						vpd.put("HOUSETYPE", typename);	 
					}
					
					if(j!=-1&&i!=-1){
						String membertype=configtypeList.get(j).getString("MEMBERTYPE");
						String typename=hostTypelList.get(i).getString("TYPENAME");	
						vpd.put("HOUSETYPE", typename);	
						vpd.put("MEMBERTYPE",membertype);	
						vpd.put("PRICE","0");
					}
				}
			
				vpd.put("PRICEMANAGER_ID", this.get32UUID());	
				priceManagerList.add(vpd); 
			}
		}
		//保存所有数据
		for (PageData pageData : priceManagerList) {
			
			pricemanagerService.save(pageData);
			
		}
		Map<String, String> resultMap=new HashMap<String, String>();
		
		resultMap.put("success", "true");
		resultMap.put("msg", "初始化成功！");
		JSONObject  jsonObject=JSONObject.fromObject(resultMap);
		return jsonObject.toString(); 
		
	}
}
