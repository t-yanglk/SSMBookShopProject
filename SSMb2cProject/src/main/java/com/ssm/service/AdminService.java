package com.ssm.service;

import java.util.List;

import com.ssm.modle.Admin;

public interface AdminService {
	
	public List<Admin> findAll(Admin admin);
	public Admin findByAdminid(String adminid);
	public int updateAdmin(String adminid, String password);
	public int delById(String adminid);
	public int insertAdmin(Admin admin);
}
