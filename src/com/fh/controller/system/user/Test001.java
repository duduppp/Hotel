package com.fh.controller.system.user;

import org.hibernate.services.DesUtil;

import com.fh.util.DateUtil;
import com.fh.util.Tools;

public class Test001 {
	
	public static void main(String[] args) {
		
		System.out.println(Tools.date2Str(DateUtil.getNextNetDate()));
	String dfdfd=	DesUtil.encrypt(Tools.date2Str(DateUtil.getNextNetDate()));
	System.out.println(dfdfd);
	}

}
