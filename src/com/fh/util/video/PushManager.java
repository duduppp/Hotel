/**
 * 
 */
package com.fh.util.video;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 *
 */
public interface PushManager {

	String push(Map<String, Object> map);

	void closePush(String appName);

	List<String> viewAppName();

}
