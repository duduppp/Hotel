package com.fh.util.video;

import java.util.HashMap;
import java.util.Map;

/**
 *  系统测试
 * @author Administrator
 *
 */
public class Test001 {
	
	public static void main(String[] args) {
		
		
		  try {
			PushManager pusher = new PushManagerImpl();  
			    Map map=new HashMap();  
			    map.put("ffmpeg_path", "F:/ffmpeg.exe");
			    map.put("name", "test3");  
			    map.put("input", "G:/BaiduNetdiskDownload/yxqy.mp4");  
			    map.put("output", "rtmp://127.0.0.1:1935/live/");  
			    map.put("fmt", "flv");  
			    map.put("fps", "25");  
			    map.put("rs", "640x360");  
			    map.put("disableAudio", true);  
			    map.put("appName", "dudu");   
			   //ffmpeg.exe -re -i G:\BaiduNetdiskDownload\yxqy.mp4 -vcodec libx264 -f flv rtmp://localhost:1935/live/polo 
			    //推送后会获得该处理器的id，通过该id可关闭推送流  
			    String id = pusher.push(map);  
			//    Thread.sleep(100000);  
			    //关闭推送流  
			  //  pusher.closePush("test3");
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
	}

}
