package com.fh.controller.educat.coursemanager;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.service.educat.aboutinstructor.AboutInstructorManager;
import com.fh.service.educat.bigbusinessevents.BigBusinessEventsManager;
import com.fh.service.educat.commentmanagement.CommentmanagementManager;
import com.fh.service.educat.coursemanager.CourseManagerManager;
import com.fh.service.educat.coursetype.CoursetypeManager;
import com.fh.service.educat.mediauser.MediaUserManager;
import com.fh.service.educat.mycollection.MyCollectionManager;
import com.fh.service.educat.myshare.MyshareManager;
import com.fh.service.educat.studyrecord.StudyRecordManager;
import com.fh.util.Const;
import com.fh.util.CreatePh;
import com.fh.util.DateUtil;
import com.fh.util.FileUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
public class BusinessSchooController extends BaseController {

	@Resource(name = "coursemanagerService")
	private CourseManagerManager coursemanagerService;

	@Resource(name = "aboutinstructorService")
	private AboutInstructorManager aboutinstructorService;

	@Resource(name = "mycollectionService")
	private MyCollectionManager mycollectionService;

	@Resource(name = "studyrecordService")
	private StudyRecordManager studyrecordService;

	@Resource(name = "commentmanagementService")
	private CommentmanagementManager commentmanagementService;

	@Resource(name = "mediauserService")
	private MediaUserManager mediauserService;

	@Resource(name = "myshareService")
	private MyshareManager myshareService;

	@Resource(name = "coursetypeService")
	private CoursetypeManager coursetypeService;

	@Resource(name = "bigbusinesseventsService")
	private BigBusinessEventsManager bigbusinesseventsService;

	/**
	 * 显示主界面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edu")
	public ModelAndView initHomePage() throws Exception {

		PageData headPageData = new PageData();
		headPageData.put("SHOWSTATUS", "5");
		ModelAndView mv = this.getModelAndView();
		List<PageData> headCourseList = coursemanagerService
				.listAll(headPageData);
		PageData aboutinstuctPageData = new PageData();
		List<PageData> teacherList = aboutinstructorService
				.listAll(aboutinstuctPageData);

		PageData proProfessionalPageData = new PageData();
		proProfessionalPageData.put("SHOWSTATUS", "6");

		List<PageData> proProfessionalList = coursemanagerService
				.listAll(proProfessionalPageData);
		mv.addObject("proProfessionalList", proProfessionalList);

		PageData newCoursePageData = new PageData();
		newCoursePageData.put("SHOWSTATUS", "3");

		List<PageData> newCourselList = coursemanagerService
				.listAll(newCoursePageData);
		PageData shareCoursePageData = new PageData();
		shareCoursePageData.put("SHOWSTATUS", "8");

		List<PageData> shareCourseList = coursemanagerService
				.listAll(shareCoursePageData);
		mv.addObject("shareCourseList", shareCourseList);
		mv.addObject("newCourselList", newCourselList);
		mv.addObject("teacherList", teacherList);
		mv.addObject("headCourseList", headCourseList);
		mv.addObject("msg", "success");
		mv.setViewName("../../edu/index");
		return mv;
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allLecturer")
	public ModelAndView allLecturer() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		List<PageData> teacherList = aboutinstructorService.listAll(page);
		mv.addObject("teacherList", teacherList);
		mv.setViewName("../../edu/allLecturer");
		return mv;
	}

	/**
	 * 所有活动专题信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allProProfessionalList")
	public ModelAndView allProProfessionalList() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		List<PageData> proProfessionalList = coursemanagerService.listAll(page);
		mv.addObject("proProfessionalList", proProfessionalList);
		mv.setViewName("../../edu/allProProfessionalList");
		return mv;
	}

	/**
	 * 所有精品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allBoutiqueList")
	public ModelAndView allBoutiqueList() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		page.put("SHOWSTATUS", "3");
		List<PageData> newCourselList = coursemanagerService.listAll(page);
		mv.addObject("newCourselList", newCourselList);
		mv.setViewName("../../edu/allBoutiqueList");
		return mv;
	}

	/**
	 * 所有分享信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allShareList")
	public ModelAndView allShareList() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		page.put("SHOWSTATUS", "3");
		List<PageData> newCourselList = coursemanagerService.listAll(page);
		mv.addObject("newCourselList", newCourselList);
		mv.setViewName("../../edu/allShareList");
		return mv;
	}

	/**
	 * 显示爱好
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/myFavorites")
	public ModelAndView showMyFavorites() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		List<PageData> varList = mycollectionService.listAll(page); // 列出MyCollection列表
		String COURSEID = "";
		List<PageData> coursevarList = new ArrayList<PageData>();
		for (PageData myfavoritesPageData : varList) {
			COURSEID = myfavoritesPageData.getString("COURSEID");
			PageData coursepage = new PageData();
			coursepage.put("COURSEMANAGER_ID", COURSEID);
			coursepage = coursemanagerService.findById(coursepage);
			coursevarList.add(coursepage);
		}

		mv.addObject("varList", coursevarList);
		mv.setViewName("../../edu/myFavorites");
		return mv;
	}

	/**
	 * 显示文章
	 * 
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/showArticle")
	public ModelAndView showArticle() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		List<PageData> varList = coursemanagerService.listAll(page);
		if (varList.size() > 0) {
			mv.addObject("ArtData", varList.get(0));
			mv.setViewName("../../edu/article");
		} else {
			mv.setViewName("../../edu/index");
		}

		return mv;
	}

	/***
	 * 展示学习记录
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/studyRecord")
	@ResponseBody
	public String showStudyRecord() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> varList = studyrecordService.listAll(page);
		String COURSEID = "";
		List<PageData> coursevarList = new ArrayList<PageData>();
		for (PageData myfavoritesPageData : varList) {
			COURSEID = myfavoritesPageData.getString("COURSEID");
			PageData coursepage = new PageData();
			coursepage.put("COURSEMANAGER_ID", COURSEID);
			coursepage = coursemanagerService.findById(coursepage);
			if (null != coursepage) {
				coursevarList.add(coursepage);
			}
		}

		String json = "";
		if (null != varList) {
			JSONArray arr = JSONArray.fromObject(coursevarList);
			json = arr.toString();
		}
		return json;
	}

	@RequestMapping(value = "/showManagerTypes")
	@ResponseBody
	public String showManagerTypes() throws Exception {

		String json = "";
		PageData page = new PageData();
		page = this.getPageData();
		PageData parentData = coursetypeService.findByNAME(page);
		String COURSETYPE_ID = parentData.getString("COURSETYPE_ID");
		JSONArray arr = JSONArray.fromObject(coursetypeService
				.listTree(COURSETYPE_ID));
		json = arr.toString();

		return json;
	}

	/***
	 * 展示讲师课程
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showLecturerCourse")
	@ResponseBody
	public String showLecturerCourse() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> coursevarList = coursemanagerService.listAll(page);
		String json = "";
		if (null != coursevarList) {
			JSONArray arr = JSONArray.fromObject(coursevarList);
			json = arr.toString();
		}
		return json;
	}

	/***
	 * 展示管理类所有课程
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showManagerCourse")
	@ResponseBody
	public String showManagerCourse() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> coursevarList = coursemanagerService.listAll(page);
		String json = "";
		if (null != coursevarList) {
			JSONArray arr = JSONArray.fromObject(coursevarList);
			json = arr.toString();
		}
		return json;
	}

	/**
	 * 判断是否是讲师
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goLecturerCoursePage")
	@ResponseBody
	public String goLecturerCoursePage() throws Exception {

		PageData mediaPageData = new PageData();
		mediaPageData = this.getPageData();
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		mediaPageData.put("USERNAME", user.getUSERNAME());
		PageData mediaUser = mediauserService.findByUserName(mediaPageData);
		String goStatus = "0";
		if (null != mediaUser) {
			goStatus = "1";
		}
		return goStatus;

	}

	/**
	 * 排名按课程
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rankingList")
	@ResponseBody
	public String rankingList() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> varList = coursemanagerService.rankingList(page);
		String json = "";
		if (null != varList) {
			JSONArray arr = JSONArray.fromObject(varList);
			json = arr.toString();
		}
		return json;
	}

	/**
	 * 排名按讲师
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rankingBylecture")
	@ResponseBody
	public String rankingBylecture() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> varList = coursemanagerService.rankingByLecture(page);
		String json = "";
		if (null != varList) {
			JSONArray arr = JSONArray.fromObject(varList);
			json = arr.toString();
		}
		return json;
	}

	/**
	 * 排名
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/newestCourseList")
	@ResponseBody
	public String newestCourseList() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> varList = coursemanagerService.newestCourseList(page);
		String json = "";
		if (null != varList) {
			JSONArray arr = JSONArray.fromObject(varList);
			json = arr.toString();
		}
		return json;
	}

	/**
	 * 显示课程
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showCourse")
	@ResponseBody
	public ModelAndView showCourse() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		PageData course = coursemanagerService.findById(page);

		// 观看次数增加一个
		int viewtimes = (Integer) course.get("VIEWTIMES");
		viewtimes += 1;
		course.put("VIEWTIMES", viewtimes);
		coursemanagerService.edit(course);

		// 得到所有信息课程
		PageData allCoursePageData = new PageData();
		String COURSETITLE = course.getString("COURSETITLE");
		allCoursePageData.put("COURSETITLE", COURSETITLE);
		List<PageData> allCourseList = coursemanagerService
				.recommendRelated(allCoursePageData);
		mv.addObject("allCourseList", allCourseList);

		// 查询个人的学习信息
		PageData studyRecordPageData = new PageData();
		studyRecordPageData.put("COURSEID", page.getString("COURSEMANAGER_ID"));
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);

		// 查询课程
		studyRecordPageData.put("USERNAME", user.getUSERNAME());
		PageData studyRecordData = studyrecordService
				.findByUserAndCourseId(studyRecordPageData);
		if (null == studyRecordData) {
			studyRecordPageData.put("STUDYRECORD_ID", this.get32UUID()); // 主键
			studyRecordPageData.put("READSTATUS", "0");
			studyRecordPageData.put("SUPPORTSTATUS", 0);
			studyRecordPageData.put("WATCHCOUNT", "1");
			studyRecordPageData.put("LEAVEMESSAGECOUNT", "0");
			studyRecordPageData
					.put("RECORDTIME", DateUtil.getCurrentDateTime());
			studyRecordPageData.put("LOVECOUNT", 0);
			studyRecordPageData.put("COURSENAME", COURSETITLE);
			studyRecordPageData.put("SCORE", 0);

			studyrecordService.save(studyRecordPageData);
		}

		// 如果是null，则要创建学习记录
		mv.addObject("studyRecordData", studyRecordData);

		// 查询这门课程的所有阅读人
		PageData pageData = new PageData();
		pageData.put("COURSEID", page.getString("COURSEMANAGER_ID"));
		List<PageData> readCoursePageDataList = studyrecordService
				.listAll(pageData);

		mv.addObject("readCoursePageDataList", readCoursePageDataList);
		mv.addObject("studyRecordData", studyRecordData);
		mv.addObject("recommendRelatedList", allCourseList);

		mv.addObject("course", course);
		mv.setViewName("../../edu/course");

		return mv;
	}

	/**
	 * 得到评论消息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCommentMessages")
	@ResponseBody
	public Map<String, List<PageData>> getCommentMessagePageData()
			throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		Map<String, List<PageData>> map = new HashMap<String, List<PageData>>();
		PageData messagePageData = new PageData();
		messagePageData.put("COURSEID", page.getString("COURSEMANAGER_ID"));
		List<PageData> commentmanagementList = commentmanagementService
				.listAll(messagePageData);
		map.put("commentmanagementList", commentmanagementList);

		return map;
	}

	/**
	 * 修改课程的信息，是否喜欢，评价星数，打赏金额, 是否打赏
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateCourseData")
	@ResponseBody
	public Map<String, String> updateCourseData() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		// 查询自己的阅读信息
		PageData studyRecorData = studyrecordService
				.findByUserAndCourseId(page);

		if (null != page.get("SCORE")) {
			int score = Integer.parseInt(page.get("SCORE").toString());
			studyRecorData.put("SCORE", score);
		}
		if (null != page.get("SUPPORTSTATUS")) {
			int SUPPORTSTATUS = Integer.parseInt(page.get("SUPPORTSTATUS")
					.toString());
			studyRecorData.put("SUPPORTSTATUS", SUPPORTSTATUS);
		}
		// 修改
		studyrecordService.edit(studyRecorData);
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", "success");
		return map;

	}

	@RequestMapping(value = "/leaveMessageSupport")
	@ResponseBody
	public Map<String, String> leaveMessageSupport() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		PageData newpage = commentmanagementService.findById(page);
		newpage.put("SUPPORT", page.get("SUPPORT"));

		PageData mediaPageData = new PageData();
		mediaPageData.put("USERNAME", newpage.getString("USERNAME"));
		PageData mePageData = mediauserService.findByUserName(mediaPageData);
		String userheadImg = mePageData.getString("PICPATH");
		newpage.put("REMARK", userheadImg);
		commentmanagementService.edit(newpage);
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", "success");
		return map;

	}

	@RequestMapping(value = "/courseManagerSupport")
	@ResponseBody
	public Map<String, String> courseManagerSupport() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		PageData newpage = coursemanagerService.findById(page);
		if (null != page.get("SUPPORTTIMES")) {
			int VIEWTIMES = Integer.parseInt(page.get("SUPPORTTIMES")
					.toString());
			newpage.put("SUPPORTTIMES", VIEWTIMES);
		}
		coursemanagerService.edit(newpage);
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", "success");
		return map;

	}

	@RequestMapping(value = "/addleaveMessageSupport")
	@ResponseBody
	public Map<String, String> addleaveMessageSupport() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		String uuid = this.get32UUID();
		page.put("COMMENTMANAGEMENT_ID", uuid); // 主键

		Map<String, String> map = new HashMap<String, String>();
		// 评论 增加一个积分
		PageData mediauserPageData = new PageData();
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);

		mediauserPageData.put("USERNAME", user.getUSERNAME());
		PageData userData = mediauserService.findByUserName(mediauserPageData);
		String userheadImg = userData.getString("PICPATH");
		page.put("REMARK", userheadImg);
		commentmanagementService.save(page);
		int INTEGRAL = Integer.parseInt(userData.getString("INTEGRAL")) + 1;
		userData.put("INTEGRAL", String.valueOf(INTEGRAL));
		mediauserService.edit(userData);

		map.put("status", "success");
		return map;

	}

	@RequestMapping(value = "/showUserInfo")
	@ResponseBody
	public Map<String, String> showUserInfo() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		String uuid = this.get32UUID();
		page.put("COMMENTMANAGEMENT_ID", uuid); // 主键
		commentmanagementService.save(page);
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", "success");
		return map;

	}

	@RequestMapping(value = "/getMediaUserCurrent")
	@ResponseBody
	public Map<String, Object> getMediaUserCurrent() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);

		page.put("USERNAME", user.getUSERNAME());
		PageData userData = mediauserService.findByUserName(page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userData", userData);
		map.put("status", "success");
		return map;

	}

	/**
	 * 传媒用户签到 这里增加签到时间字段
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/signMediaUser")
	@ResponseBody
	public Map<String, Object> signMediaUser() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		PageData newpage = mediauserService.findById(page);
		String currentDateStr = DateUtil.getCurrentDateTime();

		newpage.put("SIGN", page.get("SIGN"));
		Map<String, Object> map = new HashMap<String, Object>();
		if (null == newpage.getString("SIGNDATE")) {
			mediauserService.edit(newpage);
			map.put("msg", "签到成功");
			map.put("success", true);
		} else {
			String oldDateStr = newpage.getString("SIGNDATE");
			long diffDay = DateUtil.getDaySub(oldDateStr, currentDateStr);
			if (diffDay > 0) {
				newpage.put("SIGNDATE", currentDateStr);
				mediauserService.edit(newpage);
				map.put("success", true);
				map.put("msg", "签到成功");
			} else {
				map.put("success", false);
				map.put("msg", "已经签到,明天再来吧！");
			}
		}
		return map;

	}

	/**
	 * 传媒用户 提醒状态 这里增加签到时间字段
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/editMediaUserByREMINDSTATUS")
	@ResponseBody
	public Map<String, Object> editMediaUserByREMINDSTATUS() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		PageData newpage = mediauserService.findById(page);

		int REMINDSTATUS = Integer.valueOf(page.getString("REMINDSTATUS"));
		newpage.put("REMINDSTATUS", REMINDSTATUS);
		// 提醒时间
		if (REMINDSTATUS == 1) {
			newpage.put("REMINDLEARNING", page.getString("REMINDLEARNING"));
		}
		mediauserService.edit(newpage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);

		return map;

	}

	/**
	 * 上传头像
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateUserImage")
	@ResponseBody
	public Map<String, Object> updateUserImage() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		PageData newpage = mediauserService.findById(page);
		newpage.put("PICPATH", page.getString("PICPATH"));
		// 这里也要更新
		mediauserService.edit(newpage);

		PageData commentmanagementpage = new PageData();
		commentmanagementpage.put("REMARK", page.getString("PICPATH"));
		User user = (User) Jurisdiction.getSession().getAttribute(
				Const.SESSION_USER);
		PageData studyrecordPageData = new PageData();

		studyrecordPageData.put("REMARK", page.getString("PICPATH"));
		studyrecordPageData.put("USERNAME", user.getUSERNAME());
		studyrecordService.updateReamrkByUserName(studyrecordPageData);
		commentmanagementpage.put("USERNAME", user.getUSERNAME());
		commentmanagementService.updateReamrkByUserName(commentmanagementpage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);

		return map;

	}

	/**
	 * 我的分享
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showMyShare")
	@ResponseBody
	public Map<String, Object> showMyShare() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		List<PageData> myshareList = myshareService.listAll(page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myshareList", myshareList);

		return map;

	}

	/**
	 * 显示我的分享
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goShareRecord")
	@ResponseBody
	public ModelAndView goShareRecord() {

		ModelAndView mv = this.getModelAndView();
		mv.setViewName("../../edu/shareRecord");
		return mv;
	}

	/**
	 * 我的分享
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/educate/saveMyShare")
	@ResponseBody
	public Map<String, Object> saveMyShare() throws Exception {

		PageData page = new PageData();
		page = this.getPageData();
		page.put("MYSHARE_ID", this.get32UUID());
		page.put("UPLOADTIME", DateUtil.getCurrentDateTime());
		myshareService.save(page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;

	}

	/**
	 * 我的分享
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/educate/editMyShare")
	@ResponseBody
	public Map<String, Object> editMyShare() throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();

		if (null != pd.get("editType")) {
			PageData editPageData = myshareService.findById(pd);
			editPageData.put("APPROVESTATUS", pd.get("APPROVESTATUS"));
			makePic(editPageData);

			// 这里在 保存到课程里

			PageData coursePageData = new PageData();
			String courseID = this.get32UUID();
			editPageData.put("COURSEMANAGER_ID", courseID);
			myshareService.edit(editPageData);
			coursePageData.put("COURSEMANAGER_ID", courseID);
			coursePageData.put("COURSETITLE",
					editPageData.getString("COURSENAME"));
			coursePageData.put("LECTURERNAME",
					editPageData.getString("USERNAME"));
			coursePageData
					.put("LECTURERID", "d0571662edd148e380411a16cbfb6298");
			coursePageData.put("ARTICLETYPE", "技能");
			coursePageData.put("VIDEOURL", "");
			coursePageData.put("ARTICLECONTENT", "");
			coursePageData.put("SHARE2CODE", "");
			coursePageData.put("REWARD2CODE", "static/edu/code2.png");
			coursePageData.put("COURSECONSTITUTION", "1");
			coursePageData.put("ARTICLETYPEID",
					"60d139fe47bc4141ac62b03d369e9450");
			coursePageData.put("AUDIOURL", "http://");
			coursePageData.put("RELEASETIME", new Date());

			String baseurl = "uploadFiles/edu/share/"
					+ editPageData.getString("USERNAME") + "/";
			String imagePath = baseurl + editPageData.getString("IMAGEPATH");
			coursePageData.put("IMGPATH", imagePath);
			String shareurlString = baseurl
					+ editPageData.getString("SHAREURL");
			coursePageData.put("COURSEURL", shareurlString);
			coursePageData.put("FILEPATH", shareurlString);
			coursePageData.put("SCREENSHOT",
					editPageData.getString("IMAGEPATH"));
			coursePageData.put("FILESIZE", editPageData.getString("FILESIZE"));
			coursePageData.put("RESOLUTION", this.get32UUID());
			coursePageData.put("PLAYTIME", editPageData.getString("PLAYTIME"));
			coursePageData.put("SHOWSTATUS", "8"); // 8 位分享
			coursePageData.put("SHOWTYPE", "0");
			coursePageData.put("VIEWTIMES", 0);
			coursePageData.put("MESSAGETIMES", 0);
			coursePageData.put("SUPPORTTIMES", 0);
			coursePageData.put("COURSECHAPTERS", "1");

			coursemanagerService.save(coursePageData);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;

	}

	public void makePic(PageData pd) throws Exception {

		// 上传成功，
		String source = "";
		String target = "";
		String filePath = pd.getString("SHAREURL");
		filePath = StringUtils.trimToEmpty(filePath);
		if (filePath.length() > 0) {

			String rootPath = FileUtil.getWebInfPath();
			User user = (User) Jurisdiction.getSession().getAttribute(
					Const.SESSION_USER);
			FileUtil.createDirectory(rootPath + "uploadFiles/edu/share/"
					+ user.getUSERNAME());
			source = rootPath + "uploadFiles/edu/share/" + user.getUSERNAME()
					+ "/" + filePath;
			target = rootPath + "uploadFiles/hotel/videos/" + "ffmpeg.exe";

			String logoPath = rootPath.substring(0, rootPath.indexOf(":"))
					+ "\\\\" + rootPath.substring(rootPath.indexOf(":"))
					+ "uploadFiles/hotel/videos/" + "logo.png";

			// 生成图片
			Map<String, String> map = null;
			String newPath = "", picPath = "";
			if (CreatePh.processMP4(target, logoPath, source)) {
				newPath = source.substring(0, source.lastIndexOf("."))
						+ "_1.mp4";

				map = CreatePh.getInfo(target, newPath);
				picPath = filePath.substring(0, filePath.lastIndexOf("."))
						+ "_1.jpg";
				newPath = filePath.substring(0, filePath.lastIndexOf("."))
						+ "_1.mp4";
			}

			if (FileUtil.deleteFile(source)) {
				pd.put("SHAREURL", newPath);
			}

			pd.put("IMAGEPATH", picPath);

			String filesize = FileUtil.getFileSize(rootPath
					+ "uploadFiles/edu/share/" + user.getUSERNAME() + "/"
					+ newPath);
			pd.put("FILESIZE", filesize); // 主键
			if (null != map) {
				pd.put("PLAYTIME", map.get("playtime"));
			}
		}

	}

	@RequestMapping(value = "/educate/saveUserImage")
	@ResponseBody
	public Map<String, Object> saveUserImage(String fileName) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String rootPath = FileUtil.getWebInfPath();
			BASE64Decoder decoder = new BASE64Decoder();
			byte[] b = decoder.decodeBuffer(fileName);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					b[i] += 256;
				}
			}
			User user = (User) Jurisdiction.getSession().getAttribute(
					Const.SESSION_USER);
			String firstname = new java.text.SimpleDateFormat("yyyyMMddhhmmss")
					.format(new Date()); // 获取当前日期
			firstname = firstname + (int) (Math.random() * 90000 + 10000);
			String imgfoder = rootPath + "uploadFiles/edu/user/"
					+ user.getUSERNAME() + "/";
			FileUtil.createDirectory(imgfoder);
			String imgFilePath = rootPath + "uploadFiles/edu/user/"
					+ user.getUSERNAME() + "/" + firstname + ".png"; // 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();

			map.put("success", true);
			map.put("imgPath", "/uploadFiles/edu/user/" + user.getUSERNAME()
					+ "/" + firstname + ".png");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value = "/getSortBigEvent")
	@ResponseBody
	public Map<String,  List<PageData>> getSortBigEvent() throws Exception {

		PageData pd = new PageData();
		List<PageData> varOList = bigbusinesseventsService.listAll(pd);
		Map<String, List<PageData>> map = new TreeMap<String, List<PageData>>(); 

		for (int i = 2020; i >2005; i--) { 

			List<PageData> sortList = new ArrayList<PageData>();
			for (PageData pageData : varOList) {
				String BIGTIME = pageData.getString("BIGTIME");
				if (BIGTIME.indexOf(String.valueOf(i)) > -1) {
					sortList.add(pageData);
				}
				map.put(String.valueOf(i), sortList);
			}
		}
		return map; 
	}

	
	/**
	 * 显示我的分享
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/goIntroduction")
	public ModelAndView goIntroduction() throws Exception {
		PageData page = new PageData();
		page = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		PageData IntroductionData= bigbusinesseventsService.findById(page);
		mv.setViewName("../../edu/introduction"); 
		mv.addObject("IntroductionData", IntroductionData);
		return mv;
	}
}
