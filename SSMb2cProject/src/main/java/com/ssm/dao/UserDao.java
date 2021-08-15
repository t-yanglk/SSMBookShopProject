package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssm.modle.User;

@Mapper
public interface UserDao {
	public List<User> findAll(User user);
	public User findByUser(String userid);
	public int insertUser(Map<String, String> map);
	public User findUser(String userid);
	public int updatepassword(@Param("userid") String userid,@Param("password") String password);
	public int updateMoney(User user);
	public int delById(String userid);
}
