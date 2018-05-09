package com.fh.util.video;

import java.util.concurrent.ConcurrentMap;
 
 /**
  * 命令行执行处理器缓存，方便管理处理器的开启和关闭  
  * @author Administrator
  *
  */
public interface HandlerDao  
{  
    /** 
     *  获取某个处理器 
     * @param pushId 
     * @return 
     */  
    public ConcurrentMap get(String pushId);  
    /** 
     * 存放一个处理器 
     * @param handlerMap 
     */  
    public void set(String key, ConcurrentMap<String, Object> resultMap);  
    /** 
     * 获取全部处理器的id 
     * @return 
     */  
    public ConcurrentMap getAll();  
    /** 
     * 删除某个处理器 
     * @param pushId 
     */  
    public void delete(String pushId);  
    /** 
     * 是否存在key 
     */  
    public boolean isHave(String pushId);  
}  