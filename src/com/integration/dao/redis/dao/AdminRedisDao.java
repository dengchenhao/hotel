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
     * ���� 
     * <br>------------------------------<br> 
     * @param user 
     * @return 
     */  
    boolean add(Admin admin);  
      
    /** 
     * �������� ʹ��pipeline��ʽ 
     * <br>------------------------------<br> 
     * @param list 
     * @return 
     */  
    boolean add(List<Admin> list);  
      
    /** 
     * ɾ�� 
     * <br>------------------------------<br> 
     * @param key 
     */  
//    void delete(String key);  
      
    /** 
     * ɾ����� 
     * <br>------------------------------<br> 
     * @param keys 
     */  
//    void delete(List<String> keys);  
      
    /** 
     * �޸� 
     * <br>------------------------------<br> 
     * @param user 
     * @return  
     */  
//    boolean update(User user);  
  
    /** 
     * ͨ��key��ȡ 
     * <br>------------------------------<br> 
     * @param keyId 
     * @return  
     */  
	Admin get(String keyId);

	/**
	 * redis�洢����
	 * @param adminLogin
	 * @return
	 */
	boolean setSessionByRedis(final String key, final Object object);

	/**
	 * redis��ö���
	 * @param key
	 * @return
	 */
	Object getSessionByRedis(final String key);
}  