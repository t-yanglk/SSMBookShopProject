package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.modle.User;

public interface UserSevice {
	//查询所有的用户
	public List<User> findAll(User user);
	//根据账号查询用户
	public User findByUser(String userid);
	//向后台添加用户
	public int insertUser(Map<String, String> map); 
	//修改用户密码
	public int updatepassword(String userid, String password); 
	//对用户进行修改
	public int updateMoney(User user);
	//根据id删除相应的用户
	public int delById(String id);
}
