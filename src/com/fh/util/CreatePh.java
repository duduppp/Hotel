package com.fh.util;

import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

//生成视频文件的首帧为图片  
//windows下的版本   

import java.util.Map;
import java.util.Properties;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.alibaba.druid.util.PatternMatcher;
import com.fh.util.test.FFMPEG;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;
import com.xuggle.xuggler.ICodec;
import com.xuggle.xuggler.IContainer;
import com.xuggle.xuggler.IStream;
import com.xuggle.xuggler.IStreamCoder;

public class CreatePh {

	/**
	 * 视频的截图
	 * 
	 * @param veido_path
	 * @param ffmpeg_path
	 * @return
	 */
	// public static final String FFMPEG_PATH = "E:/ffmpeg/ffmpeg.exe";
	// ffmpeg -i xxx.mp4 -y -f image2 -t 0.001 -s 125x125 xxx.jpg
	public static boolean processImg(String veido_path, String ffmpeg_path) {
		File file = new File(veido_path);
		if (!file.exists()) {
			System.err.println("路径[" + veido_path + "]对应的视频文件不存在!");
			return false;
		}
		List<String> commands = new java.util.ArrayList<String>();
		commands.add(ffmpeg_path);
		commands.add("-i");
		commands.add(veido_path);
		commands.add("-y");
		commands.add("-f");
		commands.add("image2");
		commands.add("-ss");
		commands.add("8");// 这个参数是设置截取视频多少秒时的画面
		// commands.add("-t");
		// commands.add("0.001");
		commands.add("-s");
		commands.add("700x525");
		commands.add(veido_path.substring(0, veido_path.lastIndexOf("."))
				.replaceFirst("vedio", "file") + ".jpg");
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commands);
			builder.start();
			System.out.println("截取成功");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * @param ffmpeg
	 * @param veido_path
	 *            视频文件地址
	 * @param rtmp
	 *            转码后的留地址
	 * @param resolution
	 *            分辨率
	 * @return
	 */
	public static boolean convertProtocol(String ffmpeg, String veido_path,
			String rtmp, String resolution) {
		// ffmpeg -i "rtsp://admin:12345@192.168.3.218/h264/ch1/main/av_stream"
		// -f flv -r 25 -s 640x480 -an "rtmp://192.168.3.138:1935/myapp/test2"

		// ffmpeg.exe -re -i G:\BaiduNetdiskDownload\yxqy.mp4 -vcodec libx264 -f
		// flv rtmp://localhost:1935/live/polo
		List<String> commend = new ArrayList<String>();
		commend.add(ffmpeg);
		commend.add("-i");
		commend.add("\"" + veido_path + "\"");
		commend.add("-f");
		commend.add("flv");
		commend.add("-r");
		commend.add("25");
		commend.add("-s");
		commend.add("-an");
		commend.add(rtmp);
		try {
			ProcessBuilder builder = new ProcessBuilder(); // 创建系统进程
			builder.command(commend);
			builder.start();// 启动进程
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * pdf截图
	 * 
	 * @param source
	 * @param target
	 * @return
	 */
	public static boolean createScreenShoot(String source, String target) {

		File file = new File(source);
		if (!file.exists()) {
			System.err.println("路径[" + source + "]对应的pdf文件不存在!");
			return false;
		}
		try {
			RandomAccessFile raf = new RandomAccessFile(file, "r");
			FileChannel channel = raf.getChannel();
			ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0,
					channel.size());
			PDFFile pdffile = new PDFFile(buf);
			int num = pdffile.getNumPages();
			for (int i = 1; i < num; i++) {
				PDFPage page = pdffile.getPage(1);

				// get the width and height for the doc at the default zoom
				Rectangle rect = new Rectangle(0, 0, (int) page.getBBox()
						.getWidth(), (int) page.getBBox().getHeight());

				// generate the image
				Image img = page.getImage(rect.width, rect.height, // width &
						rect, // clip rect
						null, // null for the ImageObserver
						true, // fill background with white
						true // block until drawing is done
						);

				BufferedImage tag = new BufferedImage(rect.width, rect.height,
						BufferedImage.TYPE_INT_RGB);
				tag.getGraphics().drawImage(img, 0, 0, rect.width, rect.height,
						null);
				FileOutputStream out = new FileOutputStream(target + i + "jpg");
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				encoder.encode(tag); // JPEG编码
				out.close();
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	/**
	 * 
	 * @param ffmpeg_path
	 * @param videoFilename
	 * @return map key "bitrate" "playtime"
	 * @throws Exception
	 */
	public static Map<String, String> getInfo(String ffmpeg_path,
			String videoFilename) throws Exception {
		processImg(videoFilename, ffmpeg_path);
		String tmpFile = videoFilename + ".tmp.png";
		ProcessBuilder processBuilder = new ProcessBuilder(ffmpeg_path, "-y",
				"-i", videoFilename, "-vframes", "1", "-ss", "0:0:0", "-an",
				"-vcodec", "png", "-f", "rawvideo", "-s", "100*100", tmpFile);

		Process process = processBuilder.start();

		InputStream stderr = process.getErrorStream();
		InputStreamReader isr = new InputStreamReader(stderr);
		BufferedReader br = new BufferedReader(isr);
		String line;
		// 打印 sb，获取更多信息。 如 bitrate、width、heigt
		StringBuffer sb = new StringBuffer();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		new File(tmpFile).delete();

		Pattern pattern = Pattern.compile("Duration: (.*?),");
		Matcher matcher = pattern.matcher(sb);
		String playtime = "00:00:00";
		if (matcher.find()) {
			String time = matcher.group(1);
			playtime = calcTime(time);
		}
		int width = 0;
		int heigt = 0;
		pattern = Pattern.compile("w:\\d+ h:\\d+");
		matcher = pattern.matcher(sb);

		if (matcher.find()) {
			String wh = matcher.group();
			// w:100 h:100
			String[] strs = wh.split("\\s+");
			if (strs != null && strs.length == 2) {
				width = Integer.parseInt(strs[0].split(":")[1]);
				heigt = Integer.parseInt(strs[1].split(":")[1]);
			}
		}

		process.waitFor();
		if (br != null)
			br.close();
		if (isr != null)
			isr.close();
		if (stderr != null)
			stderr.close();

		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("bitrate", width + "X" + heigt);
		resultMap.put("playtime", playtime);

	//	processFLV(ffmpeg_path, videoFilename);
	 
		return resultMap;

	}
	
	  public static Map<String, String> getVedioInfo(String filename){  
		   

	        // first we create a Xuggler container object
	        IContainer container = IContainer.make();

	        // we attempt to open up the container
	        int result = container.open(filename, IContainer.Type.READ, null);

	        // check if the operation was successful
	        if (result<0)
	            throw new RuntimeException("Failed to open media file");

	        int numStreams = container.getNumStreams();

	        // query for the total duration
	        long duration = container.getDuration()/1000000;
	        
	        // query for the file size
	        long fileSize = container.getFileSize();

	        // query for the bit rate
	        long bitRate = container.getBitRate();

	        Map<String, String> resultMap = new HashMap<String, String>();
	      //  resultMap.put("fileSize", value);
	        System.out.println("Duration (ms): " +DateUtil.secToTime(duration) );
	        resultMap.put("playtime", DateUtil.secToTime(duration));  
	      
	        System.out.println("File Size (bytes): " +   FileUtil.bytes2kb(fileSize));
	        resultMap.put("filesize", DateUtil.secToTime(duration));
	        System.out.println("Bit Rate: " + bitRate);

         for (int i=0; i<numStreams; i++) {
             IStream stream = container.getStream(i);
             IStreamCoder coder = stream.getStreamCoder(); 
            //这里使用bitrate  代表视频宽高
            if (coder.getCodecType() == ICodec.Type.CODEC_TYPE_VIDEO) {
                 resultMap.put("bitrate", coder.getWidth()+"X"+coder.getHeight());
                 System.out.printf("format: %s; ", coder.getPixelType());
                 //format: YUV420P;  播放格式
                 resultMap.put("format",  coder.getPixelType().toString());
                // System.out.printf("frame-rate: %5.2f; ", coder.getFrameRate().getDouble());
             }
         }
         
		return resultMap;
     
   }  

 
	
	/**
	 * 降低视频码率
	 * @return
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	private static Map<String,String> downBiterate(String videoFilename,String ffmpeg_path) throws IOException, InterruptedException{
		processImg(videoFilename, ffmpeg_path);
		String tmpFile = videoFilename + ".tmp.png";
		ProcessBuilder processBuilder = new ProcessBuilder(ffmpeg_path, "-y",
				"-i", videoFilename, "-vframes", "1", "-ss", "0:0:0", "-an",
				"-vcodec", "png", "-f", "rawvideo", "-s", "100*100", tmpFile);

		Process process = processBuilder.start();

		InputStream stderr = process.getErrorStream();
		InputStreamReader isr = new InputStreamReader(stderr);
		BufferedReader br = new BufferedReader(isr);
		String line;
		// 打印 sb，获取更多信息。 如 bitrate、width、heigt
		StringBuffer sb = new StringBuffer();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		new File(tmpFile).delete();

		Pattern pattern = Pattern.compile("Duration: (.*?),");
		Matcher matcher = pattern.matcher(sb);
		String playtime = "00:00:00";
		if (matcher.find()) {
			String time = matcher.group(1);
			playtime = calcTime(time);
		}
		int width = 0;
		int heigt = 0;
		pattern = Pattern.compile("w:\\d+ h:\\d+");
		matcher = pattern.matcher(sb);

		if (matcher.find()) {
			String wh = matcher.group();
			// w:100 h:100
			String[] strs = wh.split("\\s+");
			if (strs != null && strs.length == 2) {
				width = Integer.parseInt(strs[0].split(":")[1]);
				heigt = Integer.parseInt(strs[1].split(":")[1]);
			}
		}

		process.waitFor();
		if (br != null)
			br.close();
		if (isr != null)
			isr.close();
		if (stderr != null)
			stderr.close();

		Map<String, String> resultMap = new HashMap<String, String>();

		resultMap.put("bitrate", width + "X" + heigt);
		resultMap.put("playtime", playtime);

		processFLV(ffmpeg_path, videoFilename);
	 
		return resultMap;
	}
	
	
	 
	/**
	 * 
	 * 
	 * @param ffmpeg
	 * @param logoPath
	 * @param sourcePath
	 * @return  newPath  为转换后的视频路径, <br/>
	 * 			picPath  为截图路径
	 * @throws Exception
	 */
		public static boolean processMP4(String ffmpeg,String logoPath,String sourcePath) throws Exception {

			if (!checkfile(sourcePath)) {
				System.out.println(sourcePath + " is not file");
				return false; 
			}
			
			   HashMap<String, String>dto=new HashMap<String, String>();  
	           dto.put("ffmpeg_path", ffmpeg);//必填  
	           dto.put("input_path", sourcePath);//必填  
	           String newPath = sourcePath.substring(0, sourcePath.lastIndexOf("."))
					+ "_1.mp4";
	           String picPath = sourcePath.substring(0, sourcePath.lastIndexOf("."))
						+ "_1.jpg";
	           dto.put("video_converted_path", newPath);//必填  
	           dto.put("logo", logoPath);//可选(注意windows下面的logo地址前面要写4个反斜杠,"g\\\\:/logo.png")  
	           dto.put("xaxis", "35");
	           dto.put("yaxis", "25");   
	           String secondsString=  new FFMPEG().videoTransfer(dto);  
	           System.out.println("转换共用:"+secondsString+"秒");  
//	           Map<String, String>  resultMap=getVedioInfo(newPath);
//	           resultMap.put("newPath", newPath);
//	           resultMap.put("picPath", picPath);
	           FileUtil.deleteFile(sourcePath); 
	        return true;
		}
	
	
	

	// 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等), 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
	private static String processAVI(int type,String source) {

		List<String> commend = new java.util.ArrayList<String>();
		commend.add("e://mencoder");
		//String PATH = "";
		commend.add(source);
		commend.add("-oac");
		commend.add("lavc");
		commend.add("-lavcopts");
		commend.add("acodec=mp3:abitrate=64");
		commend.add("-ovc");
		commend.add("xvid");
		commend.add("-xvidencopts");
		commend.add("bitrate=600");
		commend.add("-of");
		commend.add("avi");
		commend.add("-o");
		commend.add("c://home//a.avi");

		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.start();
			return "c://home//a.avi";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private static boolean checkfile(String path) {
		File file = new File(path);
		if (!file.isFile()) {
			return false;
		}
		return true;
	}

	public static Properties getPprVue(){
		InputStream inputStream = DbFH.class.getClassLoader().getResourceAsStream("video.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			inputStream.close();
		} catch (IOException e) {
			//读取配置文件出错
			e.printStackTrace();
		}
		return p;
	}
	
	// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	private static boolean processFLV(String ffmpeg, String video_path) {

		if (!checkfile(video_path)) {
			System.out.println(video_path + " is not file");
			return false;
		}

		List<String> commend = new java.util.ArrayList<String>();
		
  	    Properties pros = getPprVue();
			String video_size = pros.getProperty("video_size");	//地址
		//	fps:视频帧率；rs:视频分辨率；	
		commend.add(ffmpeg);
		commend.add("-i");
		commend.add(video_path);
		commend.add("-y");
		commend.add("-ab");
		commend.add("32");
		commend.add("-ar");
		commend.add("22050");
		commend.add("-qscale");
		commend.add("10");
		commend.add("-s");
		commend.add(video_size); 
		commend.add("-r");
		commend.add("15");
		String newPath = video_path.substring(0, video_path.lastIndexOf("."))
				+ ".flv";
		commend.add(newPath);
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.start();
			//删除上传的视频文件 
			FileUtil.deleteFile(video_path);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public static void main(String[] args) {

		try {
			//getInfo("F:/ffmpeg.exe", "G:/Kayaking.mp4");
			
		//  Map<String,String>  map=processMP4("g:/ffmpeg.exe","g\\\\:/logo.png", "F:/server/apache-tomcat-7.0.56/webapps/Hotel/uploadFiles/edu/course/2017101211593130540.rmvb");
		
			Map<String,String>  map=null;
			if(null!=map){
			 System.out.println("-------------"+map.get("bitrate"));
			 System.out.println("----------"+map.get("playtime"));
		 }
		   //  map=getMP4Info("g:/ffmpeg.exe","G:/chenglong_1.mp4");
			// getVedioInfo("F:/server/apache-tomcat-7.0.56/webapps/Hotel/uploadFiles/edu/course/2017101212105994754_1.mp4"); 
			map= getInfo("g:/ffmpeg.exe","F:/server/apache-tomcat-7.0.56/webapps/Hotel/uploadFiles/edu/course/2017101212105994754_1.mp4");
			 if(null!=map){
				 System.out.println("-------------"+map.get("bitrate"));
				 System.out.println("----------"+map.get("playtime"));
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 格式化时间
	 * 
	 * @param timeStr
	 * @return
	 */
	private static String calcTime(String timeStr) {
		String[] parts = timeStr.split(":");
		int hours = Integer.parseInt(parts[0]);
		int minutes = Integer.parseInt(parts[1]);
		float seconds = Float.parseFloat(parts[2]);
//		if(hours==0){
//			return   minutes + ":" + (int)seconds ;
//		}
		return hours + ":" + minutes + ":" + (int)seconds ;

	}

	// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	private static String processFLV(String inputPath) {
		List<String> commend = new java.util.ArrayList<String>();
		// commend.add("e:\\videoconver\\ffmpeg\\ffmpeg ");//可以设置环境变量从而省去这行
		commend.add("ffmpeg");
		commend.add("-i");
		commend.add(inputPath);

		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.redirectErrorStream(true);
			Process p = builder.start();

			// 1. start
			// 保存ffmpeg的输出结果流
			BufferedReader buf = null;
			String line = null;
			// read the standard output

			buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
			StringBuffer sb = new StringBuffer();
			while ((line = buf.readLine()) != null) {
				sb.append(line);
				continue;
			}

			// 这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
			@SuppressWarnings("unused")
			int ret = p.waitFor();
			// 1. end
			return sb.toString();
		} catch (Exception e) {
			return null;
		}
	}

	 

}