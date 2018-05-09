package com.fh.test;


import java.io.*;
import java.util.Vector;


public class AnsiToUtf8 {


	public static void main(String[] args) throws UnsupportedEncodingException, IOException {
		
	/*	ReadFileName tmp=new ReadFileName();
		Vector<String> vec=tmp.FileNameOftype("f:\\test", ".txt");
		System.out.println(vec.size());
		for (int i=0;i<vec.size(); i++){
			System.out.println(vec.get(i));
			change(vec.get(i));
		}*/
		change("f:\\test\\1.txt");
	}
	
	
	public static void change(String filepath) throws UnsupportedEncodingException, IOException{
		BufferedReader buf = null;
		OutputStreamWriter pw=null;		
		String str = null;
		String allstr="";
		
		//用于输入换行符的字节码
		byte[] c=new byte[2];
        c[0]=0x0d;
        c[1]=0x0a;
        String t=new String(c);
        
        buf=new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "GBK"));
		while((str = buf.readLine()) != null){
			allstr=allstr+str+t;
		}
		
		buf.close();		

		pw =new OutputStreamWriter(new FileOutputStream(filepath),"UTF-8");
		System.out.println(allstr);
		pw.write(allstr); 
		pw.close();
	}
	
}







class ReadFileName {

	//存储遍历获取的所有文件名
	private  Vector<String> filelist = new Vector<String>(); 
	
	
		//遍历指定路径下的所有文件
		//以ArrayList存储于filelist中	
		private  void RefreshFileList(String strpath) { 
	        File dir = new File(strpath); 
	        File[] files = dir.listFiles(); 
	        
	        
	        if (files == null) 
	            return; 
	        for (int i = 0; i < files.length; i++) { 
	            if (files[i].isDirectory()) { 
	                RefreshFileList(files[i].getAbsolutePath()); 
	            } else { 
	                //String strFileName = files[i].getAbsolutePath().toLowerCase();	             
	                filelist.add(files[i].getAbsolutePath());                    
	            }     
	        }      
}
  
	    //过滤当前目录下的指定后缀名的文件
	     //返回Vector
	    public  Vector<String> FileNameOftype(String strpath2,String filetype){
	    		String strfilename=new String();
	    		Vector<String> filelistofjava= new Vector<String>(); 
		    		
	    		//读取指定路径下的所有文件
	    		RefreshFileList(strpath2);		

	    		for (int i = 0; i < filelist.size(); i++) {
	    			strfilename=filelist.get(i).toString();
	    			strfilename=strfilename.substring(strfilename.length()-5, strfilename.length());
	    			
		    			if (strfilename.equals(filetype)) {
		    				filelistofjava.add(filelist.get(i));	    					    				
		    			}		    			
	    			}
	    		return filelistofjava;
	    	}

}
	
	
