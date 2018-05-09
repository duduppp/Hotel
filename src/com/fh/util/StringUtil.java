package com.fh.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;

/**
 * 字符串相关方法
 * 
 */
public class StringUtil extends org.apache.commons.lang3.StringUtils {

	/**
	 * 获得用户远程地址
	 */
	public static String getRemoteAddr(HttpServletRequest request) {
		String remoteAddr = request.getHeader("X-Real-IP");
		if (isNotBlank(remoteAddr)) {
			remoteAddr = request.getHeader("X-Forwarded-For");
		} else if (isNotBlank(remoteAddr)) {
			remoteAddr = request.getHeader("Proxy-Client-IP");
		} else if (isNotBlank(remoteAddr)) {
			remoteAddr = request.getHeader("WL-Proxy-Client-IP");
		}
		return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
	}

	/**
	 * 获得i18n字符串
	 */
	public static String getMessage(String code, Object[] args) {
		LocaleResolver localLocaleResolver = SpringContextHolder
				.getBean(LocaleResolver.class);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		Locale localLocale = localLocaleResolver.resolveLocale(request);
		return SpringContextHolder.getApplicationContext().getMessage(code,
				args, localLocale);
	}

	/**
	 * 转换为Double类型
	 */
	public static Double toDouble(Object val) {
		if (val == null) {
			return 0D;
		}
		try {
			return Double.valueOf(trim(val.toString()));
		} catch (Exception e) {
			return 0D;
		}
	}

	/**
	 * 转换为Float类型
	 */
	public static Float toFloat(Object val) {
		return toDouble(val).floatValue();
	}

	/**
	 * 转换为Long类型
	 */
	public static Long toLong(Object val) {
		return toDouble(val).longValue();
	}

	/**
	 * 转换为Integer类型
	 */
	public static Integer toInteger(Object val) {
		return toLong(val).intValue();
	}

	/**
	 * 替换掉HTML标签方法
	 */
	public static String replaceHtml(String html) {
		if (isBlank(html)) {
			return "";
		}
		// . 匹配除换行符以外的任意字符
		// + 重复一次或更多次
		// ? 重复零次或一次
		String regEx = "<.+?>";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(html);
		String s = m.replaceAll("");
		return s;
	}

	/**
	 * 缩略字符串（不区分中英文字符）
	 * 
	 * @param str
	 *            目标字符串
	 * @param length
	 *            截取长度
	 * @return
	 */
	public static String abbr(String str, int length) {
		if (str == null) {
			return "";
		}
		try {
			StringBuilder sb = new StringBuilder();
			int currentLength = 0;
			for (char c : replaceHtml(StringEscapeUtils.unescapeHtml4(str))
					.toCharArray()) {
				currentLength += String.valueOf(c).getBytes("GBK").length;
				if (currentLength <= length - 3) {
					sb.append(c);
				} else {
					sb.append("...");
					break;
				}
			}
			return sb.toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 缩略字符串（替换html）
	 * 
	 * @param str
	 *            目标字符串
	 * @param length
	 *            截取长度
	 * @return
	 */
	public static String rabbr(String str, int length) {
		return abbr(replaceHtml(str), length);
	}

	// 将首字母改成小写
	public static String lowerFirst(String str) {
		if (StringUtils.isBlank(str)) {
			return "";
		} else {
			return str.substring(0, 1).toLowerCase() + str.substring(1);
		}
	}

	// 将首字母改成大写
	public static String upperFirst(String str) {
		if (StringUtils.isBlank(str)) {
			return "";
		} else {
			return str.substring(0, 1).toUpperCase() + str.substring(1);
		}
	}

	/**
	 * right align
	 */
	public static final int RIGHT = 1;

	/**
	 * left align
	 */
	public static final int LEFT = 2;

	public static String subString(String str, int offset, int leng) {
		return new String(str.getBytes(), (offset - 1), leng);
	}

	public static String subString(String str, int offset) {
		byte[] bytes = str.getBytes();
		int size = bytes.length - (offset - 1);
		return new String(bytes, (offset - 1), size);
	}

	public static String fitString(String str, int size) {
		return fitString(str, size, StringUtil.LEFT);
	}

	public static String fitString(String str, int size, int align) {
		byte[] bts = str.getBytes();
		int len = bts.length;
		if (len == size) {
			return str;
		}
		if (len > size) {
			String s = new String(bts, 0, size);
			if (s.length() == 0) {
				StringBuffer sb = new StringBuffer(size);
				for (int idx = 0; idx < size; idx++) {
					sb.append("?");
				}
				s = sb.toString();
			}
			return s;
		}
		if (len < size) {
			int cnt = size - len;
			char[] values = new char[cnt];
			for (int idx = 0; idx < cnt; idx++) {
				values[idx] = ' ';
			}
			if (align == StringUtil.RIGHT) {
				return String.copyValueOf(values) + str;
			} else {
				return str + String.copyValueOf(values);
			}
		}
		return str;
	}

	public static String[] toStringArray(String str) {
		List<String> list = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(str);
		while (st.hasMoreTokens()) {
			list.add(st.nextToken());
		}

		return toStringArray(list);
	}

	public static String[] toStringArray(List<String> list) {
		String[] strings = new String[list.size()];
		for (int idx = 0; idx < list.size(); idx++) {
			strings[idx] = list.get(idx).toString();
		}
		return strings;
	}

	public static String replace(String src, String from, String to) {
		if (src == null)
			return null;
		if (from == null)
			return src;
		if (to == null)
			to = "";
		StringBuffer buf = new StringBuffer();
		for (int pos; (pos = src.indexOf(from)) >= 0;) {
			buf.append(src.substring(0, pos));
			buf.append(to);
			src = src.substring(pos + from.length());
		}
		buf.append(src);
		return buf.toString();
	}

	public static String cutString(String str, int limit) {

		if (str == null || limit < 4)
			return str;

		int len = str.length();
		int cnt = 0, index = 0;

		while (index < len && cnt < limit) {
			if (str.charAt(index++) < 256)
				cnt++;
			else
				cnt += 2;
		}

		if (index < len)
			str = str.substring(0, index - 1) + "...";

		return str;
	}

	public static String cutEndString(String src, String end) {
		if (src == null)
			return null;
		if (end == null)
			return src;

		int pos = src.indexOf(end);

		if (pos >= 0) {
			src = src.substring(0, pos);
		}

		return src;
	}

	public static char[] makeCharArray(char c, int cnt) {
		char[] a = new char[cnt];
		Arrays.fill(a, c);
		return a;
	}

	public static String getString(char c, int cnt) {
		return new String(makeCharArray(c, cnt));
	}

	public static String getLeftTrim(String lstr) {

		if (!lstr.equals("")) {
			int strlen = 0;
			int cptr = 0;
			boolean lpflag = true;
			char chk;

			strlen = lstr.length();
			cptr = 0;
			lpflag = true;

			do {
				chk = lstr.charAt(cptr);
				if (chk != ' ') {
					lpflag = false;
				} else {
					if (cptr == strlen) {
						lpflag = false;
					} else {
						cptr++;
					}
				}
			} while (lpflag);

			if (cptr > 0) {
				lstr = lstr.substring(cptr, strlen);
			}
		}
		return lstr;
	}

	public static String getRightTrim(String lstr) {
		if (!lstr.equals("")) {
			int strlen = 0;
			int cptr = 0;
			boolean lpflag = true;
			char chk;

			strlen = lstr.length();
			cptr = strlen;
			lpflag = true;

			do {
				chk = lstr.charAt(cptr - 1);
				if (chk != ' ') {
					lpflag = false;
				} else {
					if (cptr == 0) {
						lpflag = false;
					} else {
						cptr--;
					}
				}
			} while (lpflag);

			if (cptr < strlen) {
				lstr = lstr.substring(0, cptr);
			}
		}
		return lstr;
	}

	public static String getLeft(String str, int len) {
		if (str == null)
			return "";

		return str.substring(0, len);
	}

	public static String getRight(String str, int len) {
		if (str == null)
			return "";

		String dest = "";
		for (int i = (str.length() - 1); i >= 0; i--) {
			dest = dest + str.charAt(i);
		}

		str = dest;
		str = str.substring(0, len);
		dest = "";

		for (int i = (str.length() - 1); i >= 0; i--) {
			dest = dest + str.charAt(i);
		}

		return dest;
	}

	public static String nvl(String str, String replace) {
		if (str == null) {
			return replace;
		} else {
			return str;
		}
	}

	public static String checkEmpty(String str, String replace) {
		if (str == null || str.equals("")) {
			return replace;
		} else {
			return str;
		}
	}

	public static String capitalize(String str) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0) {
			return str;
		}
		return new StringBuffer(strLen)
				.append(Character.toTitleCase(str.charAt(0)))
				.append(str.substring(1)).toString();
	}

	public static String getErrorTrace(Exception e) {
		if (e == null) {
			return "";
		}
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		e.printStackTrace(pw);

		String errTrace = sw.toString();

		return errTrace;
	}

	public static String escapeXml(String s) {
		if (s == null)
			return "";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c == '&') {
				sb.append("&amp;");
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	public static List<String> getTokenList(String s, String token) {
		if (s == null || s.equals(""))
			return null;

		List<String> tokenList = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(s, token);

		while (st.hasMoreTokens()) {
			tokenList.add(st.nextToken().trim());
		}

		return tokenList;
	}

	public static int getTokenLength(String s, String token) {
		if (s == null)
			return 0;

		int len = 0;
		StringTokenizer st = new StringTokenizer(s, token);
		while (st.hasMoreTokens()) {
			len++;
		}
		return len;
	}

	public static String getToken(int index, String s, String token) {
		if (s == null)
			return "";

		StringTokenizer st = new StringTokenizer(s, token);
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; st.hasMoreTokens(); i++) {
			if (index == i) {
				sb.append(st.nextToken());
				break;
			}
			st.nextToken();
		}

		if (sb.toString().length() > 0)
			return sb.toString().trim();
		else
			return "";
	}

	public static String getToken(int index, String s, String token, String nvl) {
		if (s == null)
			return nvl;

		StringTokenizer st = new StringTokenizer(s, token);
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; st.hasMoreTokens(); i++) {
			if (index == i) {
				sb.append(st.nextToken());
				break;
			}
			st.nextToken();
		}

		if (sb.toString().length() > 0)
			return sb.toString().trim();
		else
			return nvl;
	}

	public static void deleteStringBuffer(StringBuffer strBuf) {
		strBuf.delete(0, strBuf.length());
	}

	public static boolean isset(String str) {
		return (str != null && str.trim().length() > 0);
	}

	public static String collapse(String str, String characters,
			String replacement) {
		if (str == null) {
			return null;
		}

		StringBuffer newStr = new StringBuffer();

		boolean prevCharMatched = false;
		char c;
		for (int i = 0; i < str.length(); i++) {
			c = str.charAt(i);
			if (characters.indexOf(c) != -1) {
				if (prevCharMatched) {
					continue;
				}
				prevCharMatched = true;
				newStr.append(replacement);
			} else {
				prevCharMatched = false;
				newStr.append(c);
			}
		}
		return newStr.toString();
	}

	public static String getString(String str, int max) {

		byte[] temp = str.getBytes();

		int count = 0;
		int str_count = 0;

		while (max > str_count) {

			if (str_count == temp.length)
				break;

			if (temp[str_count] < 0)
				count++;

			str_count++;
		}

		if (count % 2 != 0) {
			str = new String(temp, 0, str_count - 1);
		} else {
			str = new String(temp, 0, str_count);
		}

		return str;
	}

	public static boolean checkUndefined(Object obj) {

		boolean result = false;

		if (obj.toString().equals("Undefined")) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	public static String dashedPdaNo(String pdaNo) {

		String firstPdaNo = "";
		String secondPdaNo = "";
		String thirdPdaNo = "";

		if (null == pdaNo || 0 == pdaNo.trim().length()) {
			return "";
		}

		if (pdaNo.trim().length() < 10 || 11 < pdaNo.trim().length()) {
			return pdaNo;
		}

		firstPdaNo = pdaNo.substring(0, 3) + "-";
		secondPdaNo = pdaNo.substring(3, pdaNo.length() - 4) + "-";
		thirdPdaNo = pdaNo.substring(pdaNo.length() - 4);

		return firstPdaNo + secondPdaNo + thirdPdaNo;
	}

	public static String makeLikeValue(String value) {
		StringBuffer sb = new StringBuffer();
		sb.append('%');
		if (value != null) {
			sb.append(value);
		}
		sb.append('%');

		return sb.toString();
	}

	public static boolean existsNonAscii(String src) {
		byte[] b = src.getBytes();
		for (int i = 0; i < b.length; i++) {
			if (b[i] < 0)
				return true;
		}
		return false;
	}

	public static boolean isEnglish(String str) {
		boolean flag = false;

		for (int j = 0; j < str.length(); j++) {
			char c = str.charAt(j);
			if (c < 0xac00 || 0xd7a3 < c) {
				flag = true;
			}
		}
		return flag;
	}

	public static String nullToBlank(String str) {
		return str == null ? "" : str;
	}

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * 
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr) {
		int i = 0;
		String TempStr = valStr;
		String[] returnStr = new String[valStr.length() + 1
				- TempStr.replace(",", "").length()];
		valStr = valStr + ",";
		while (valStr.indexOf(',') > 0) {
			returnStr[i] = valStr.substring(0, valStr.indexOf(','));
			valStr = valStr.substring(valStr.indexOf(',') + 1, valStr.length());

			i++;
		}
		return returnStr;
	}

	/**
	 * 获取字符串编码
	 * 
	 * @param str
	 * @return
	 */
	public static String getEncoding(String str) {
		String encode = "GB2312";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s = encode;
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}

}
