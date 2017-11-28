package com.integration.dao.redis.dao.impl;
import java.util.ArrayList;  
import java.util.List;  
  









import org.springframework.dao.DataAccessException;  
import org.springframework.data.redis.connection.RedisConnection;  
import org.springframework.data.redis.core.RedisCallback;  
import org.springframework.data.redis.serializer.RedisSerializer;  
import org.springframework.util.Assert;  

import com.integration.dao.redis.AbstractBaseRedisDao;
import com.integration.dao.redis.dao.AdminRedisDao;
import com.integration.entity.Admin;
import com.integration.entity.User;
import com.integration.util.SerializeUtil;
/**  
 * Dao 
 * @author http://blog.csdn.net/java2000_wl  
 * @version <b>1.0</b>  
 */   
public class AdminRedisDaoImpl extends AbstractBaseRedisDao<String, Admin> implements AdminRedisDao {  
  
    /**  
     * ���� 
     *<br>------------------------------<br> 
     * @param user 
     * @return 
     */  
    public boolean add(final Admin admin) {  
        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {  
            public Boolean doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                byte[] key  = serializer.serialize(admin.getUsername());  
                byte[] name = serializer.serialize(admin.getUsername());  
                return connection.setNX(key, name);  
            }  
        });  
        return result;  
    }  
      
    /** 
     * �������� ʹ��pipeline��ʽ   
     *<br>------------------------------<br> 
     *@param list 
     *@return 
     */  
    public boolean add(final List<Admin> list) {  
        Assert.notEmpty(list);  
        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {  
            public Boolean doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                for (Admin admin : list) {  
                    byte[] key  = serializer.serialize(admin.getUsername());  
                    byte[] name = serializer.serialize(admin.getUsername());  
                    connection.setNX(key, name);  
                }  
                return true;  
            }  
        }, false, true);  
        return result;  
    }  
      
//    /**  
//     * ɾ�� 
//     * <br>------------------------------<br> 
//     * @param key 
//     */  
//    public void delete(String key) {  
//        List<String> list = new ArrayList<String>();  
//        list.add(key);  
//        delete(list);  
//    }  
//  
//    /** 
//     * ɾ����� 
//     * <br>------------------------------<br> 
//     * @param keys 
//     */  
//    public void delete(List<String> keys) {  
//        redisTemplate.delete(keys);  
//    }  
//  
//    /** 
//     * �޸�  
//     * <br>------------------------------<br> 
//     * @param user 
//     * @return  
//     */  
//    public boolean update(final User user) {  
//        Integer key = user.getUserid();  
//        if (get(key) == null) {  
//            throw new NullPointerException("�����в�����, key = " + key);  
//        }  
//        boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {  
//            public Boolean doInRedis(RedisConnection connection)  
//                    throws DataAccessException {  
//                RedisSerializer<String> serializer = getRedisSerializer();  
//                byte[] key  = serializer.serialize(user.getUserid());  
//                byte[] name = serializer.serialize(user.getUsername());  
//                connection.set(key, name);  
//                return true;  
//            }  
//        });  
//        return result;  
//    }  
//  
    /**  
     * ͨ��key��ȡ 
     * <br>------------------------------<br> 
     * @param keyId 
     * @return 
     */  
    public Admin get(final String keyId) {
    	Admin result = redisTemplate.execute(new RedisCallback<Admin>() {  
            public Admin doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                byte[] key = serializer.serialize(keyId);  
                byte[] value = connection.get(key);  
                if (value == null) {  
                    return null;  
                }  
                String name = serializer.deserialize(value);  
                return new Admin();  
            }  
        });  
        return result;  
    }

	@Override
	public boolean setSessionByRedis(final String key, final Object object) {
		boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {  
            public Boolean doInRedis(RedisConnection connection)  
                    throws DataAccessException {
                byte[] value = SerializeUtil.serialize(object);
                connection.setNX(key.getBytes(), value);
                return true;
            }  
        });  
        return true;  
	}

	@Override
	public Object getSessionByRedis(final String key) {
		Object result = redisTemplate.execute(new RedisCallback<Object>() {  
            public Object doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
            	
                byte[] value = connection.get(key.getBytes());  
                if (value == null) {  
                    return null;  
                }  
                Object object = SerializeUtil.unserialize(value);  
                return object;  
            }  
        });  
        return result;  
	}
}  