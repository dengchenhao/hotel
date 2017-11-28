package com.integration.service;

import java.util.List;

import com.integration.entity.Admin;

public interface AdminService {
	public void saveAdmin(Admin admin);

	public List<Admin> findAllAdmin();

	public void removeAdmin(Admin admin);

	public void updateAdmin(Admin admin);

	public Admin findUserById(Integer id);

	public Admin loginAdmin(Admin admin);

	// 从redis获取Admin
	public Object getSessionByRedis(String key);

	// 向redis存Admin
	public boolean setSessionByRedis(String key, Admin adminLogin);
}
