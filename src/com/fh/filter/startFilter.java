package com.fh.filter;

import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.services.ServicesManager;
import org.java_websocket.WebSocketImpl;

import com.fh.controller.base.BaseController;
import com.fh.plugin.websocketInstantMsg.ChatServer;
import com.fh.plugin.websocketOnline.OnlineChatServer;
import com.fh.util.Const;
import com.fh.util.DbFH;
import com.fh.util.Tools;

/**
 * 启动tomcat时运行此类
 * 
 * @version
 */
public class startFilter extends BaseController implements Filter {

	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		//this.startWebsocketInstantMsg();   //注释掉  web  socket  聊天程序
		//this.startWebsocketOnline();
		this.reductionDbBackupQuartzState();
		new ServicesManager();
	}

	/**
	 * 启动即时聊天服务
	 */
	public void startWebsocketInstantMsg() {
		WebSocketImpl.DEBUG = false;
		ChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);// 读取WEBSOCKET配置,获取端口配置
			if (null != strWEBSOCKET && !"".equals(strWEBSOCKET)) {
				String strIW[] = strWEBSOCKET.split(",fh,");
				if (strIW.length == 5) {
					s = new ChatServer(Integer.parseInt(strIW[1]));
					s.start();
				}
			}
			// System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 启动在线管理服务
	 */
	public void startWebsocketOnline() {
		WebSocketImpl.DEBUG = false;
		OnlineChatServer s;
		try {
			String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);// 读取WEBSOCKET配置,获取端口配置
			if (null != strWEBSOCKET && !"".equals(strWEBSOCKET)) {
				String strIW[] = strWEBSOCKET.split(",fh,");
				if (strIW.length == 5) {
					s = new OnlineChatServer(Integer.parseInt(strIW[3]));
					s.start();
				}
			}
			// System.out.println( "websocket服务器启动,端口" + s.getPort() );
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}

	/**
	 * web容器重启时，所有定时备份状态关闭
	 */
	public void reductionDbBackupQuartzState() {
		try {
			DbFH.executeUpdateFH("update DB_TIMINGBACKUP set STATUS = '2'");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 计时器(废弃)用quartz代替
	 */
	public void timer() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 9); // 控制时
		calendar.set(Calendar.MINUTE, 0); // 控制分
		calendar.set(Calendar.SECOND, 0); // 控制秒
		Date time = calendar.getTime(); // 得出执行任务的时间
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				// PersonService personService =
				// (PersonService)ApplicationContext.getBean("personService");
				// System.out.println("-------设定要指定任务--------");
			}
		}, time, 1000 * 60 * 60 * 24);// 这里设定将延时每天固定执行
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		  HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse resp = (HttpServletResponse) response;
	        Cookie[] cookies = req.getCookies();
	        if(cookies!=null){
	            for(Cookie cookie : cookies){
	                String value = cookie.getValue();
	                StringBuilder builder = new StringBuilder();
	                builder.append("JSESSIONID=" + value + "; ");
	                builder.append("Secure; ");
	                builder.append("HttpOnly; ");
	                Calendar cal = Calendar.getInstance();
	                cal.add(Calendar.HOUR, 1);
	                Date date = cal.getTime();
	                Locale locale = Locale.CHINA;
	                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss",locale);
	                builder.append("Expires=" + sdf.format(date));
	                resp.setHeader("Set-Cookie", builder.toString());
	            }
	            filterChain.doFilter(request, response); 
	        }
	}

}
