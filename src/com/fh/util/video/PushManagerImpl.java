package com.fh.util.video;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentMap;

public class PushManagerImpl implements PushManager  
{  
    /** 
     * 引用push处理器 
     */  
    private PushHandler pusher = new PushHandlerImpl();  
    /** 
     * 管理应用名和push处理器之间的关系 
     */  
    private PushId_AppRelshipDao pard=new PushId_AppRelshipDaoImpl();  
    /** 
     * 管理处理器的主进程Process及两个输出线程的关系 
     */  
    private HandlerDao hd = new HandlerDaoImpl();  
      
    public void setPusher(PushHandler pusher)  
    {  
        this.pusher = pusher;  
    }  
  
    public void setPard(PushId_AppRelshipDao pard)  
    {  
        this.pard = pard;  
    }  
  
    public void setHd(HandlerDao hd)  
    {  
        this.hd = hd;  
    }  
  
    @Override  
    public String push(Map<String, Object> map)  
    {  
        if(map==null||map.isEmpty()||!map.containsKey("appName"))  
        {  
            return null;  
        }  
        String appName=null;  
        ConcurrentMap<String, Object> resultMap = null;  
        try  
        {  
            appName=(String)map.get("appName");  
            if(appName!=null&&"".equals(appName.trim()))  
            {  
                return null;  
            }  
            resultMap = pusher.push(map);  
            // 生成一个标识该命令行线程集的key  
            String pushId = UUID.randomUUID().toString();  
            hd.set(pushId, resultMap);  
            pard.set(appName, pushId);  
        }  
        catch (IOException e)  
        {  
            // 暂时先写这样，后期加日志  
            System.err.println("发生一个异常" + e.getMessage());  
        }  
        return appName;  
    }  
  
    @Override  
    public void closePush(String appName)  
    {  
        String pushId=null;  
        if(pard.isHave(appName))  
        {  
            pushId= pard.getPushId(appName);  
        }  
        if (pushId!=null&&hd.isHave(pushId))  
        {  
            ConcurrentMap<String, Object> map = hd.get(pushId);  
            //关闭两个线程  
            ((OutHandler)map.get("error")).destroy();  
            ((OutHandler)map.get("info")).destroy();  
            //暂时先这样写，后期加日志  
            System.out.println("停止命令-----end commond");  
            //关闭命令主进程  
            ((Process)map.get("process")).destroy();  
            //删除处理器与线程对应关系表  
            hd.delete(pushId);  
            //删除应用名对应关系表  
            pard.delete(appName);  
        }  
    }  
  
    @Override  
    public List<String> viewAppName()  
    {  
        return pard.getAll();  
    } 
}