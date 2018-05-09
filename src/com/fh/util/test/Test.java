package com.fh.util.test;

public class Test {
	
	private static final String FFMPEG = "f:/ffmpeg.exe "; 

	public void liveVideo() throws Exception {
		String rtspVideo = "rtsp://admin:admin123@192.168.10.91:554/h264/ch1/main/av_stream";
		String rtmpVideo = "rtmp://192.168.1.29/oflaDemo/hello";
		String commend = FFMPEG+"ffmpeg -i " + "\"" + rtspVideo + "\" -b 4096k -f flv -r 25 -s 1280x720 -an " + "\"" + rtmpVideo + "\"";


		Runtime rt = Runtime.getRuntime();
		Process proc = rt.exec(commend);


		StreamGobbler sg1 = new StreamGobbler(proc.getInputStream(), "Console");
		StreamGobbler sg2 = new StreamGobbler(proc.getErrorStream(), "Error");
		sg1.start();
		sg2.start();
		proc.waitFor();
		proc.destroy();
		}

}
