package com.integration.dao.redis.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.integration.entity.Admin;

public class testRedis {
	public static void main(String[] args) {
        ApplicationContext ac =  new ClassPathXmlApplicationContext("classpath:/applicationContext.xml");
        AdminRedisDao adminDao = (AdminRedisDao)ac.getBean("adminRedisDao");
        adminDao.get("");
    }
}
