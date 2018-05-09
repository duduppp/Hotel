package com.fh.controller.hotel.playlist;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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
import com.fh.util.DbFH;
import com.fh.util.FileUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PropertiesLoader;
import com.fh.util.Tools;
import com.fh.util.video.PushManager;
import com.fh.util.video.PushManagerImpl;
import com.fh.service.hotel.playlist.PlayListManager;

/**
 * 说明：播放列表 创建人：dp 创建时间：2017-07-17
 */
@Controller
@RequestMapping(value = "/playlist")
public class PlayListController extends BaseController {

	String menuUrl = "playlist/list.do"; // 菜单地址(权限用)
	@Resource(name = "playlistService")
	private PlayListManager playlistService;

	@RequestMapping(value = "/getplayVidoes")
	@ResponseBody
	public String getplayVidoes() throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();

		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		if (!user.getUSERNAME().equals("admin")) {
			pd.put("LOGINNAME", user.getUSERNAME());
		} else {
			pd.put("LOGINNAME", "");
		}

		List<PageData> varList = playlistService.listAll(pd);

		/**
		 * 开启
		 */
		String syspath = FileUtil.getSysPath();
		String rootPath = syspath.substring(0, syspath.indexOf("WEB-INF") - 1);

		String ffmpeg = rootPath + "/uploadFiles/hotel/videos/" + "ffmpeg.exe";

		PushManager pusher = new PushManagerImpl();
		List<Map> pushList = new ArrayList<Map>();

		for (PageData pageData : varList) {
			Map map = new HashMap();
			map.put("ffmpeg_path", ffmpeg);

			String videpath = pageData.getString("VIDEOPATH");
			String loginname = pageData.getString("LOGINNAME");
			String sort = String.valueOf(pageData.get("PLAYSORT"));
			videpath = rootPath + videpath;
			System.out.println(videpath);

			Properties pros = getPprVue();
			String rtmp = pros.getProperty("rtmp"); // 地址
			map.put("name", loginname + sort);
			map.put("input", videpath);
			map.put("output", rtmp);
			map.put("fmt", "flv");
			map.put("fps", "25");
			map.put("rs", "640x360");
			map.put("disableAudio", true);
			map.put("appName", loginname + sort);
			// pageData.put("VIDEOPATH", rootPath+);
			pushList.add(map);

		}

		for (Map map2 : pushList) {
			// String id = pusher.push(map2);
		}

		String json = "";
		if (null != varList) {

			JSONArray arr = JSONArray.fromObject(varList);
			json = arr.toString();
		}
		return json;

	}

	public Properties getPprVue() {
		InputStream inputStream = DbFH.class.getClassLoader()
				.getResourceAsStream("video.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			inputStream.close();
		} catch (IOException e) {
			// 读取配置文件出错
			e.printStackTrace();
		}
		return p;
	}

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增PlayList");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PLAYLIST_ID", this.get32UUID()); // 主键
		playlistService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	@RequestMapping(value = "/saveList")
	public void saveList(PrintWriter out) throws Exception {
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		PageData pd = new PageData();
		pd.put("LOGINNAME", user.getUSERNAME());

		playlistService.delete(pd);

		String jsonStr = this.getRequest().getParameter("params");
		JSONArray arr = JSONArray.fromObject(jsonStr);
		pd = this.getPageData();

		for (int i = 0; i < arr.size(); i++) {
			JSONObject jObject = (JSONObject) arr.get(i);
			PageData pageData = new PageData();
			pageData.put("TITLE", jObject.getString("title"));
			pageData.put("PLAYERTIME", jObject.getString("playtime"));
			pageData.put("VIDEOIMG", jObject.getString("screenshot"));
			pageData.put("VIDEOPATH", jObject.getString("VIDEOPATH"));
			pageData.put("LOGINNAME", user.getUSERNAME());
			pageData.put("PLAYSORT", i + 1);
			pageData.put("PLAYLIST_ID", this.get32UUID());
			playlistService.save(pageData);
		}

		out.write("success");
		out.close();

	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除PlayList");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		playlistService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "修改PlayList");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		playlistService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "列表PlayList");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		if (!user.getUSERNAME().equals("admin")) {
			pd.put("LOGINNAME", user.getUSERNAME());
		}
		page.setPd(pd);
		List<PageData> varList = playlistService.list(page); // 列出PlayList列表
		mv.setViewName("hotel/playlist/playlist_list");
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
		mv.setViewName("hotel/playlist/playlist_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = playlistService.findById(pd); // 根据ID读取
		mv.setViewName("hotel/playlist/playlist_edit");
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除PlayList");
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
			playlistService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出PlayList到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("播放标题"); // 1
		titles.add("影片时长"); // 2
		titles.add("影片图片"); // 3
		titles.add("影片路径"); // 4
		titles.add("账号名称"); // 5
		titles.add("播放顺序"); // 6
		dataMap.put("titles", titles);
		List<PageData> varOList = playlistService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE")); // 1
			vpd.put("var2", varOList.get(i).getString("PLAYERTIME")); // 2
			vpd.put("var3", varOList.get(i).getString("VIDEOIMG")); // 3
			vpd.put("var4", varOList.get(i).getString("VIDEOPATH")); // 4
			vpd.put("var5", varOList.get(i).getString("LOGINNAME")); // 5
			vpd.put("var6", varOList.get(i).get("PLAYSORT").toString()); // 6
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
