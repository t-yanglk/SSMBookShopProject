package com.ssm.service;

import java.util.List;

import com.ssm.modle.UserCart;

public interface UserCartService {
	//查询所购物车
	public List<UserCart> findAllCart(UserCart cart);
	//增加用户购物车
	public int insertCart(UserCart cart);
	//获取登入用户的购物车
	public List<UserCart> findByUid(String userid);
	//删除用户购物车信息
	public int delCartComm(String userid,String commid);
	//查询用户是否购买了此商品
	public UserCart findCommCart(UserCart cart);
	//修改用户购物车的商品数量
	public int updateCommCount(UserCart cart);
	//删除用户的所有商品
	public int delAllById(String userid);
	//根据商品ID查询购物车
	public List<UserCart> findByCommid(String commid);
}
