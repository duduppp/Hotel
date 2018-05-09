package com.fh.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Utils {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Object invokeMethod(Object owner, String methodName,
			Object[] args) throws Exception {

		Class ownerClass = owner.getClass();
		Class[] argsClass = new Class[args.length];
		for (int i = 0, j = args.length; i < j; i++) {
			argsClass[i] = args[i].getClass();
		}
		java.lang.reflect.Method method = null;
		try {
			method = ownerClass.getMethod(methodName, argsClass);
		} catch (Exception e) {
			throw e;
		}
		Object object = null;
		if (method != null) {
			try {
				object = method.invoke(owner, args);
			} catch (Exception e) {
				throw e;
			}
		}
		return object;
	}

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	 * 将字节数组转换为16进制的字符串
	 * 
	 * @param byteArray
	 *            字节数组
	 * @return 16进制的字符串
	 */
	private static String byteArrayToHexString(byte[] byteArray) {
		StringBuffer sb = new StringBuffer();
		for (byte byt : byteArray) {
			sb.append(byteToHexString(byt));
		}
		return sb.toString();
	}

	/**
	 * 将字节转换为16进制字符串
	 * 
	 * @param byt
	 *            字节
	 * @return 16进制字符串
	 */
	private static String byteToHexString(byte byt) {
		int n = byt;
		if (n < 0)
			n = 256 + n;
		return hexDigits[n / 16] + hexDigits[n % 16];
	}

	/**
	 * 将摘要信息转换为相应的编码
	 * 
	 * @param code
	 *            编码类型
	 * @param message
	 *            摘要信息
	 * @return 相应的编码字符串
	 */
	private static String Encode(String code, String message) {
		MessageDigest md;
		String encode = null;
		try {
			md = MessageDigest.getInstance(code);
			encode = byteArrayToHexString(md.digest(message.getBytes()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return encode;
	}

	/**
	 * 将摘要信息转换成MD5编码
	 * 
	 * @param message
	 *            摘要信息
	 * @return MD5编码之后的字符串
	 */
	public static String md5Encode(String message) {
		return Encode("MD5", message);
	}

	/**
	 * 将摘要信息转换成SHA编码
	 * 
	 * @param message
	 *            摘要信息
	 * @return SHA编码之后的字符串
	 */
	public static String shaEncode(String message) {
		return Encode("SHA", message);
	}

	/**
	 * 将摘要信息转换成SHA-256编码
	 * 
	 * @param message
	 *            摘要信息
	 * @return SHA-256编码之后的字符串
	 */
	public static String sha256Encode(String message) {
		return Encode("SHA-256", message);
	}

	/**
	 * 将摘要信息转换成SHA-512编码
	 * 
	 * @param message
	 *            摘要信息
	 * @return SHA-512编码之后的字符串
	 */
	public static String sha512Encode(String message) {
		return Encode("SHA-512", message);
	}

	/***
	 * 写文件
	 * 
	 * @param content
	 * @param filepath
	 * @return
	 */
	public static boolean writeFile(String content, String filepath) {
		File fl = new File(filepath);
		if (fl.exists()) {
			fl.delete();
		}
		try {
			FileWriter fw = new FileWriter(filepath);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static boolean writeFileUTF8(String content, String filepath) {
		File fl = new File(filepath);
		if (fl.exists()) {
			fl.delete();
		}
		try {
			OutputStreamWriter out = new OutputStreamWriter(
					new FileOutputStream(fl), "UTF-8");
			out.write(content);
			out.flush();
			out.close();
			// writeStream.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
