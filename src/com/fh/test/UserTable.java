package com.fh.test;

public class UserTable {

	private String name;
	private int age;
	private String tel;
	public UserTable(String name, String tel) {
		 this.name=name;
		 this.tel=tel;
	}

	public UserTable(String name, int age) {
		 this.name=name;
		 this.age=age;  
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public static void main(String[] args) {
		String string="F:\\server\\apache-tomcat-7.0.56\\webapps\\Hotel\\uploadFiles\\edu\\share\\admin";
	}
	

}
