package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssm.modle.Admin;

@Mapper
public interface AdminDao {
	
	public List<Admin> findAll(Admin admin);
	public Admin findByAdminid(String adminid);
	public int updateAdmin(@Param("adminid")String adminid, @Param("password")String password);
	public int delById(String adminid);
	public int insertAdmin(Admin admin);

}
