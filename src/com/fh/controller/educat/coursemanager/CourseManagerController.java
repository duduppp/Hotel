package com.fh.controller.educat.coursemanager;

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
import com.fh.service.educat.aboutinstructor.AboutInstructorManager;
import com.fh.service.educat.coursemanager.CourseManagerManager;
import com.fh.service.educat.coursetype.CoursetypeManager;
import com.fh.util.AppUtil;
import com.fh.util.CreatePh;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.code.QrCode;

/**
 * 说明：课程管理 创建人：dp 创建时间：2017-09-18
 */
@Controller
@RequestMapping(value = "/coursemanager")
public class CourseManagerController extends BaseController {

	String menuUrl = "coursemanager/list.do"; // 菜单地址(权限用)
	@Resource(name = "coursemanagerService")
	private CourseManagerManager coursemanagerService;

	@Resource(name = "aboutinstructorService")
	private AboutInstructorManager aboutinstructorService;

	@Resource(name = "coursetypeService")
	private CoursetypeManager coursetypeService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增CourseManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String uuid = this.get32UUID();
		pd.put("COURSEMANAGER_ID", uuid); // 主键
		String urlContent = "educat" + uuid;
		String rootPath = FileUtil.getWebInfPath();
		String SHARE2CODE = QrCode.makeCode(urlContent, rootPath
				+ "/static/edu/zyy.png", rootPath + "uploadFiles/edu/");
		SHARE2CODE = SHARE2CODE.substring(SHARE2CODE.indexOf("uploadFiles"));

		pd.put("SHARE2CODE", SHARE2CODE);
		pd.put("VIEWTIMES", 0);
		pd.put("MESSAGETIMES", 0);
		pd.put("SUPPORTTIMES", 0);

		pd.put("ismovieuploaded", "1");
		makePic(pd, null);

		pd.put("REWARD2CODE", "static/edu/code2.png");
		coursemanagerService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	public void makePic(PageData pd, PageData oldpd) throws Exception {

		// 上传成功，
		String source = "";
		String target = "";
		String filePath = pd.getString("COURSEURL");
		if (filePath.length() > 0) {

			String rootPath = FileUtil.getWebInfPath();
			source = rootPath + filePath;
			target = rootPath + "uploadFiles/hotel/videos/" + "ffmpeg.exe"; 

			String logoPath = rootPath.substring(0, rootPath.indexOf(":"))
					+ "\\\\" + rootPath.substring(rootPath.indexOf(":"))
					+ "uploadFiles/hotel/videos/" + "logo.png";

			// 生成图片
			Map<String, String> map = null;
			String newPath = "", picPath = "";
			String ismovieuploaded = pd.getString("ismovieuploaded");
			if (ismovieuploaded.equals("1")) {
				if (CreatePh.processMP4(target, logoPath, source)) {
					newPath = source.substring(0, source.lastIndexOf("."))+ "_1.mp4";

					map = CreatePh.getInfo(target, newPath);
					picPath = filePath.substring(0, filePath.lastIndexOf("."))+ "_1.jpg";
					newPath = filePath.substring(0, filePath.lastIndexOf("."))+ "_1.mp4";

					pd.put("FILEPATH", newPath); 
					pd.put("SCREENSHOT", picPath);
					if (FileUtil.deleteFile(source)) {
						pd.put("COURSEURL", newPath);
					}
					String filesize = FileUtil.getFileSize(rootPath + newPath);
					pd.put("FILESIZE", filesize); // 主键
					if (null != map && null != map.get("bitrate")) {

						pd.put("RESOLUTION", map.get("bitrate"));

					} else {
						pd.put("RESOLUTION", "");
					}
					if (null != map) {
						pd.put("PLAYTIME", map.get("playtime"));
					}
				}
			} else {
				pd.put("COURSEURL", oldpd.getString("COURSEURL"));
				pd.put("FILEPATH", oldpd.getString("FILEPATH"));
				pd.put("SCREENSHOT", oldpd.getString("SCREENSHOT"));
				pd.put("FILESIZE", oldpd.getString("FILESIZE"));
				pd.put("RESOLUTION", oldpd.getString("RESOLUTION"));
				pd.put("PLAYTIME", oldpd.getString("PLAYTIME"));
			}
		}
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除CourseManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		coursemanagerService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "修改CourseManager");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String urlContent = "educat" + pd.getString("COURSEMANAGER_ID");
		String rootPath = FileUtil.getWebInfPath();

		PageData oldpd = coursemanagerService.findById(pd);

		String SHARE2CODE = QrCode.makeCode(urlContent, rootPath
				+ "/static/edu/zyy.png", rootPath + "uploadFiles/edu/");

		SHARE2CODE = SHARE2CODE.substring(SHARE2CODE.indexOf("uploadFiles"));

		pd.put("SHARE2CODE", SHARE2CODE);

		makePic(pd, oldpd);
		coursemanagerService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "列表CourseManager");
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
		List<PageData> varList = coursemanagerService.list(page); // 列出CourseManager列表
		mv.setViewName("educat/coursemanager/coursemanager_list");
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
		mv.setViewName("educat/coursemanager/coursemanager_edit");
		PageData aboutinstructorPageData = new PageData();
		List<PageData> aboutinstructorList = aboutinstructorService
				.listAll(aboutinstructorPageData);

		JSONArray arr = JSONArray.fromObject(coursetypeService.listTree("0"));
		String json = null == arr ? "" : arr.toString();
		json = json.replaceAll("COURSETYPE_ID", "id")
				.replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name")
				.replaceAll("subCoursetype", "nodes")
				.replaceAll("hasCoursetype", "checked")
				.replaceAll("treeurl", "url");

		System.out.println(json);
		mv.addObject("zTreeNodes", json);
		mv.addObject("aboutinstructorList", aboutinstructorList);
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
		pd = coursemanagerService.findById(pd); // 根据ID读取
		mv.setViewName("educat/coursemanager/coursemanager_edit");
		PageData aboutinstructorPageData = new PageData();
		List<PageData> aboutinstructorList = aboutinstructorService
				.listAll(aboutinstructorPageData);

		mv.addObject("aboutinstructorList", aboutinstructorList);
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除CourseManager");
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
			coursemanagerService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	@RequestMapping(value = "/deletefile")
	public void deletefile(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除文件");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String fileurl = pd.getString("fileurl");
		String syspath = FileUtil.getSysPath();
		String rootPath = syspath.substring(0, syspath.indexOf("WEB-INF") - 1);
		fileurl = rootPath + "/" + fileurl;
		if (fileurl.indexOf(".mp4") > 0) {
			String picImg = fileurl.substring(0, fileurl.indexOf(".mp4"))
					+ ".jpg";
			FileUtil.deleteFile(picImg);
		}

		if (FileUtil.deleteFile(fileurl)) {
			out.write("success");
		} else {
			out.write("fail");
		}

		out.close();

	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出CourseManager到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("课程标题"); // 1
		titles.add("课程简介"); // 2
		titles.add("讲师名称"); // 3
		titles.add("讲师编号"); // 4
		titles.add("文章分类"); // 5
		titles.add("视频地址"); // 6
		titles.add("文章内容"); // 7
		titles.add("分享二维码"); // 8
		titles.add("打赏二维码"); // 9
		titles.add("备注"); // 10
		titles.add("课程章程"); // 11
		titles.add("文章分类编号"); // 12
		titles.add("音频地址"); // 13
		titles.add("发布时间"); // 14
		titles.add("上传封面"); // 15
		titles.add("播放时间"); // 16
		titles.add("分辨率"); // 17
		titles.add("快照"); // 18
		titles.add("文件路径"); // 19
		titles.add("视频大小"); // 20
		titles.add("观看"); // 21
		titles.add("消息"); // 22
		titles.add("收藏"); // 23
		titles.add("课程章节"); // 24
		dataMap.put("titles", titles);
		List<PageData> varOList = coursemanagerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("COURSETITLE")); // 1
			vpd.put("var2", varOList.get(i).getString("COURSEINTRODUCTION")); // 2
			vpd.put("var3", varOList.get(i).getString("LECTURERNAME")); // 3
			vpd.put("var4", varOList.get(i).getString("LECTURERID")); // 4
			vpd.put("var5", varOList.get(i).getString("ARTICLETYPE")); // 5
			vpd.put("var6", varOList.get(i).getString("VIDEOURL")); // 6
			vpd.put("var7", varOList.get(i).getString("ARTICLECONTENT")); // 7
			vpd.put("var8", varOList.get(i).getString("SHARE2CODE")); // 8
			vpd.put("var9", varOList.get(i).getString("REWARD2CODE")); // 9
			vpd.put("var10", varOList.get(i).getString("REMARK")); // 10
			vpd.put("var11", varOList.get(i).getString("COURSECONSTITUTION")); // 11
			vpd.put("var12", varOList.get(i).getString("ARTICLETYPEID")); // 12
			vpd.put("var13", varOList.get(i).getString("AUDIOURL")); // 13
			vpd.put("var14", varOList.get(i).getString("RELEASETIME")); // 14
			vpd.put("var15", varOList.get(i).getString("IMGPATH")); // 15
			vpd.put("var16", varOList.get(i).getString("PLAYTIME")); // 15
			vpd.put("var17", varOList.get(i).getString("RESOLUTION")); // 15
			vpd.put("var18", varOList.get(i).getString("SCREENSHOT")); // 15
			vpd.put("var19", varOList.get(i).getString("FILEPATH")); // 15
			vpd.put("var20", varOList.get(i).getString("FILESIZE")); // 15
			vpd.put("var21", varOList.get(i).getString("VIEWTIMES")); // 15
			vpd.put("var22", varOList.get(i).getString("MESSAGETIMES")); // 15
			vpd.put("var23", varOList.get(i).getString("SUPPORTTIMES")); // 15
			vpd.put("var24", varOList.get(i).getString("COURSECHAPTERS")); // 15
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
