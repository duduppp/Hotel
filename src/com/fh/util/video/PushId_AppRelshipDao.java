package com.fh.util.video;

import java.util.List;

/**
 * 用于维护管理应用名与pushId的关系对应
 * 
 * @author Administrator
 * 
 */
public interface PushId_AppRelshipDao {
	/**
	 * 获取应用名对应的pushId
	 * 
	 * @param appName
	 * @return pushId
	 */
	public String getPushId(String appName);

	/**
	 * 插入一个应用名和pushId对应
	 * 
	 * @param appName
	 * @param pushId
	 */
	public void set(String appName, String pushId);

	/**
	 * 通过应用名删除对应关系
	 * 
	 * @param appName
	 */
	public void delete(String appName);

	/**
	 * 获取全部应用
	 */
	public List<String> getAll();

	/**
	 * 是否存在应用名
	 * 
	 * @param appName
	 * @return true:存在；false:不存在
	 */
	public boolean isHave(String appName);
}
