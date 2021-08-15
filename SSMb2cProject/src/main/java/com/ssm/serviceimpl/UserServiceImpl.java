package com.ssm.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.UserDao;
import com.ssm.modle.User;
import com.ssm.service.UserSevice;
@Service
public class UserServiceImpl implements UserSevice{
	@Autowired
	private UserDao dao;
	
	@Override
	public List<User> findAll(User user) {
		return dao.findAll(user);
	}

	@Override
	public User findByUser(String userid) {
		return dao.findByUser(userid);
	}

	@Override
	public int insertUser(Map<String, String> map) {
		return dao.insertUser(map);
	}

	@Override
	public int updatepassword(String userid, String password) {
		return dao.updatepassword(userid,password);
	}

	@Override
	public int updateMoney(User user) {
		return dao.updateMoney(user);
	}

	@Override
	public int delById(String userid) {
		return dao.delById(userid);
	}




}
