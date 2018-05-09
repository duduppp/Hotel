package com.fh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

/**
 * 配置文件操作类 String path4=request.getSession().getServletContext().getRealPath(
 * "propfile/load.properties"); String
 * ztfilepath=op.readDataBase("ztfilepath",path4);
 * 
 * @author duping
 * 
 */
public class OperateProperties {

	/**
	 * read two
	 * 
	 * @param name
	 * @return
	 */
	public static String readDataBase(String name, String pathname) {

		try {
			File dest = new File(pathname);
			Properties properties = new Properties();
			InputStream in = new FileInputStream(dest);
			properties.load(in);
			return properties.getProperty(name);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "error";
	}

	/**
	 * write properties file
	 * 
	 * @param key
	 * @param value
	 * @param pathname
	 */
	public static void setPropertyValue(String key, String value,
			String pathname) {
		Properties pro = new Properties();
		File dest = new File(pathname);
		try {
			InputStream in = new FileInputStream(dest);
			pro.load(in);
			try {
				pro.load(in);
			} finally {
				in.close();
			}
			pro.put(key, value);
			OutputStream out = new FileOutputStream(dest);
			try {
				out.flush();
				pro.store(out, "modi by du");
				out.flush();
			} finally {
				out.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
