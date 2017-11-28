package com.integration.service.impl;

import java.util.List;

import com.integration.entity.Admin;
import com.integration.dao.AdminDAO;
import com.integration.dao.redis.dao.AdminRedisDao;
import com.integration.service.AdminService;

public class AdminServiceImpl implements AdminService {
	private AdminDAO adminDao;

	private AdminRedisDao adminRedisDao;

	public AdminRedisDao getAdminRedisDao() {
		return adminRedisDao;
	}

	public void setAdminRedisDao(AdminRedisDao adminRedisDao) {
		this.adminRedisDao = adminRedisDao;
	}

	public AdminDAO getAdminDAO() {
		return adminDao;
	}

	public AdminDAO getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	public List<Admin> findAllAdmin() {
		return this.adminDao.findAllAdmin();
	}

	public Admin findUserById(Integer id) {
		return this.adminDao.findAdminById(id);
	}

	public void removeAdmin(Admin admin) {
		this.adminDao.removeAdmin(admin);
	}

	public void saveAdmin(Admin admin) {
		this.adminDao.saveAdmin(admin);
	}

	public void updateAdmin(Admin admin) {
		this.adminDao.updateAdmin(admin);
	}

	public Admin loginAdmin(Admin admin) {
		return this.adminDao.loginAdmin(admin);
	}
	
	public Object getSessionByRedis(String key){
		return adminRedisDao.getSessionByRedis(key);
	}

	@Override
	public boolean setSessionByRedis(String key, Admin adminLogin) {
		return adminRedisDao.setSessionByRedis(key, adminLogin);
	}
}
