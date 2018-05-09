package com.fh.util;

import java.util.Random;

public class MathUtils {

	public static String getFourRandomNumber() {

		String num = "";
		Random ne = new Random();// 实例化一个random的对象ne
		num = "" + (ne.nextInt(9999 - 1000 + 1) + 1000);// 为变量赋随机值1000-9999
		return num;

	}

}
