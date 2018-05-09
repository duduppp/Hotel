package com.fh.controller.Vendition.vipuser;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.Vendition.vipuser.VipUserManager;
import com.fh.util.AppUtil;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.office.ExcelUtil;
import com.fh.util.office.POIUtil;

/**
 * 说明：会员管理 创建人：dp 创建时间：2018-05-04
 */
@Controller
@RequestMapping(value = "/vipuser")
public class VipUserController extends BaseController {

	String menuUrl = "vipuser/list.do"; // 菜单地址(权限用)
	@Resource(name = "vipuserService")
	private VipUserManager vipuserService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("VIPUSER_ID", this.get32UUID()); // 主键
		vipuserService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		vipuserService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		vipuserService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表VipUser");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = vipuserService.list(page); // 列出VipUser列表
		mv.setViewName("Vendition/vipuser/vipuser_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("Vendition/vipuser/vipuser_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去充值頁面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goVipRecharge") 
	public ModelAndView goVipRecharge() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = vipuserService.findById(pd); // 根据ID读取
		mv.setViewName("Vendition/vipuser/vip_recharge");
		mv.addObject("msg", "rechargeEdit");
		mv.addObject("pd", pd);
		return mv;

	}
	 
	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/rechargeEdit")
	public  ModelAndView rechargeEdit()throws Exception {
		
		logBefore(logger, Jurisdiction.getUsername() + "修改VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();
		
		pd = this.getPageData();  
		
		PageData oldPageData = vipuserService.findById(pd);
		String storageBalance= pd.getString("STORAGEBALANCE");
		String  donationAmount= pd.getString("DonationAmount");
		
		Float float_storageBalance=Float.parseFloat(storageBalance);		
		Float float_donationAmount=Float.parseFloat(donationAmount);
		Float odl_storageBalance=(Float) oldPageData.get("STORAGEBALANCE");
		
		Float  sumFloat=float_storageBalance+float_donationAmount+odl_storageBalance; 
		if(float_storageBalance!=0){
			
			oldPageData.put("STORAGEBALANCE", sumFloat); 
			vipuserService.edit(oldPageData); 	
		}  
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 去积分兑换页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goVipExchange")
	public ModelAndView goVipExchange() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = vipuserService.findById(pd); // 根据ID读取
		mv.setViewName("Vendition/vipuser/vip_exchange");
		mv.addObject("msg", "vipExchange"); 
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 *  操作积分兑换
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/vipExchange")
	public  ModelAndView vipExchange()throws Exception {
		
		logBefore(logger, Jurisdiction.getUsername() + "修改VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();		
		pd = this.getPageData();  
		
		PageData oldPageData = vipuserService.findById(pd);
		String integral= pd.getString("integral");
		Float current_integral=Float.parseFloat(integral); 
		Float  oldIntegral= (Float) oldPageData.get("INTEGRAL");
		if(oldIntegral<current_integral){
			mv.addObject("msg", "fail"); 
			mv.setViewName("save_result");
			return mv;
		}
		Float  new_integral=  oldIntegral-current_integral; 
		oldPageData.put("INTEGRAL", new_integral); 
		vipuserService.edit(oldPageData); 	
	  
		mv.addObject("msg", "success"); 
		mv.setViewName("save_result");
		return mv;
	}
	
	
	

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = vipuserService.findById(pd); // 根据ID读取
		mv.setViewName("Vendition/vipuser/vipuser_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除VipUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			vipuserService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 去导入页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goVipImport")
	public ModelAndView goVipImport() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("Vendition/vipuser/vip_import");  
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	   
	@RequestMapping(value = "/getExcelTable")
	@ResponseBody
	public Map<String, Object>   getExcelTable()throws Exception {
		
		Map<String,Object> resultMap=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		String excelFilePath=pd.getString("excelFile");
		File excelfile=new File(FileUtil.getWebInfPath()+excelFilePath);
		List<String[]>  listData= POIUtil.readExcel(excelfile);
		resultMap.put("listData", listData);
		return resultMap;
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出VipUser到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("会员卡号"); // 1
		titles.add("会员类型"); // 2
		titles.add("折扣"); // 3
		titles.add("姓名"); // 4
		titles.add("电话"); // 5
		titles.add("地址"); // 6
		titles.add("生日"); // 7
		titles.add("存储余额"); // 8
		titles.add("存卷余额"); // 9
		titles.add("积分"); // 10
		titles.add("开卡时间 "); // 11
		titles.add("过期日期"); // 12
		titles.add("备注"); // 13
		titles.add("生日提醒"); // 14
		titles.add("会员密码"); // 15
		dataMap.put("titles", titles);
		List<PageData> varOList = vipuserService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CARDNO")); // 1
			vpd.put("var2", varOList.get(i).getString("VIPTYPE")); // 2
			vpd.put("var3", varOList.get(i).getString("DISCOUNT")); // 3
			vpd.put("var4", varOList.get(i).getString("NAME")); // 4
			vpd.put("var5", varOList.get(i).getString("TEL")); // 5
			vpd.put("var6", varOList.get(i).getString("ADDRESS")); // 6
			vpd.put("var7", String.valueOf(varOList.get(i).get("BRITHDAY"))); // 7
			vpd.put("var8", String.valueOf(varOList.get(i).get("STORAGEBALANCE"))); // 8
			vpd.put("var9", varOList.get(i).getString("INVENTORYBALANCE")); // 9
			vpd.put("var10", String.valueOf( varOList.get(i).get("INTEGRAL")) ); // 10
			vpd.put("var11", varOList.get(i).getString("OPENCARDTIME")); // 11
			vpd.put("var12", varOList.get(i).getString("EXPIRATIONDATE")); // 12
			vpd.put("var13", varOList.get(i).getString("REMARK")); // 13
			vpd.put("var14", varOList.get(i).getString("REMINDING")); // 14
			vpd.put("var15", varOList.get(i).getString("PASSWORD")); // 15
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}

}
