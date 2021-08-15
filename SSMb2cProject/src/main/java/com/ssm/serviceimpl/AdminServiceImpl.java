package com.ssm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.AdminDao;
import com.ssm.modle.Admin;
import com.ssm.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;

	@Override
	public List<Admin> findAll(Admin admin) {
		return dao.findAll(admin);
	}

	@Override
	public Admin findByAdminid(String adminid) {
		return dao.findByAdminid(adminid);
	}

	@Override
	public int updateAdmin(String adminid, String password) {
		return dao.updateAdmin(adminid,password);
	}

	@Override
	public int delById(String adminid) {
		return dao.delById(adminid);
	}

	@Override
	public int insertAdmin(Admin admin) {
		return dao.insertAdmin(admin);
	}

	


	
	

}
