package com.integration.dao.redis.dao;

import java.util.List;  

import com.integration.entity.Admin;
import com.integration.entity.User;
  
/**  
 * @author http://blog.csdn.net/java2000_wl  
 * @version <b>1.0</b>  
 */   
public interface AdminRedisDao {  
      
    /** 
     * 新增 
     * <br>------------------------------<br> 
     * @param user 
     * @return 
     */  
    boolean add(Admin admin);  
      
    /** 
     * 批量新增 使用pipeline方式 
     * <br>------------------------------<br> 
     * @param list 
     * @return 
     */  
    boolean add(List<Admin> list);  
      
    /** 
     * 删除 
     * <br>------------------------------<br> 
     * @param key 
     */  
//    void delete(String key);  
      
    /** 
     * 删除多个 
     * <br>------------------------------<br> 
     * @param keys 
     */  
//    void delete(List<String> keys);  
      
    /** 
     * 修改 
     * <br>------------------------------<br> 
     * @param user 
     * @return  
     */  
//    boolean update(User user);  
  
    /** 
     * 通过key获取 
     * <br>------------------------------<br> 
     * @param keyId 
     * @return  
     */  
	Admin get(String keyId);

	/**
	 * redis存储对象
	 * @param adminLogin
	 * @return
	 */
	boolean setSessionByRedis(final String key, final Object object);

	/**
	 * redis获得对象
	 * @param key
	 * @return
	 */
	Object getSessionByRedis(final String key);
}  