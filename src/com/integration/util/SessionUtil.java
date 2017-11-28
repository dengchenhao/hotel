package com.integration.util;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.integration.dao.redis.dao.AdminRedisDao;
public class SessionUtil{
	public static final String USERORADMINCOOKIEID ="login";
	public static String getUserSession() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie[] cookieArray = request.getCookies();
		String cookieId = "";
		for(Cookie cookie : cookieArray){
			if (USERORADMINCOOKIEID.equals(cookie.toString())) {
				cookieId = cookie.toString();
				break;
			}
		}
		
		return cookieId;
	}

	
	public static String sessionLogin(Object userOrAdmin) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		// 生成token，用作session在redis存储中的key值
		String redisSessionKey = UUID.randomUUID().toString();
		Cookie loginCookie = new Cookie(USERORADMINCOOKIEID, redisSessionKey);
		loginCookie.setMaxAge(60000);
		loginCookie.setPath("/");
		response.addCookie(loginCookie);
		return redisSessionKey;
		//setObject(redisSessionKey, userOrAdmin);
	}

}
