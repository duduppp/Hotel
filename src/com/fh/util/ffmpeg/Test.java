package com.fh.util.ffmpeg;

import com.xuggle.xuggler.ICodec;
import com.xuggle.xuggler.IContainer;
import com.xuggle.xuggler.IStream;
import com.xuggle.xuggler.IStreamCoder;

public class Test {
	
	 public static void getVedioInfo(String filename){
		 
	     
         // first we create a Xuggler container object
         IContainer container = IContainer.make();

         // we attempt to open up the container
         int result = container.open(filename, IContainer.Type.READ, null);

         // check if the operation was successful
         if (result<0)
             return ;
         
         // query how many streams the call to open found
         int numStreams = container.getNumStreams();
         // query for the total duration
         long duration = container.getDuration();
         // query for the file size
         long fileSize = container.getFileSize();
         long secondDuration = duration/1000000;
         
         System.out.println("时长："+secondDuration+"秒");
         System.out.println("文件大小:"+fileSize+"M");
      
   
         for (int i=0; i<numStreams; i++) {

             IStream stream = container.getStream(i);

             IStreamCoder coder = stream.getStreamCoder();
           
            if (coder.getCodecType() == ICodec.Type.CODEC_TYPE_VIDEO) {
                 System.out.printf("width: %d; ", coder.getWidth());
                 System.out.printf("height: %d; ", coder.getHeight());
                 System.out.printf("format: %s; ", coder.getPixelType());
                 System.out.printf("frame-rate: %5.2f; ", coder.getFrameRate().getDouble());
             }
 
         }
	 }
 
	 public static void main(String[] args) {
			//FfmpegUtil.ffmpeg("g:/ffmpeg.exe", "H:/迅雷下载/[YYSoR]亮剑01.国语.Speed2.v-vb(ED2000.COM).rmvb", "g:/444.mp4");
			   String filePath = "D:\\video\\old\\test.avi";
	            ConvertVedio.convertVedio("H:/迅雷下载/[YYSoR]亮剑01.国语.Speed2.v-vb(ED2000.COM).rmvb");
	            
		 
		//	getVedioInfo("H:/迅雷下载/[YYSoR]亮剑01.国语.Speed2.v-vb(ED2000.COM).rmvb"); 
		 
	}


}
