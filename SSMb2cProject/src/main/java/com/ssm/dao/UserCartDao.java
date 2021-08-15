package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssm.modle.UserCart;

/**
 * 用户购物车dao层
 * @author ASUS
 *
 */
@Mapper
public interface UserCartDao {
	int insertCart(UserCart cart);
	//查询该用户的购物车
	List<UserCart> findByUid(String userid);
	//删除用户购物车信息
	int delCartComm(@Param("userid")String userid,@Param("commid")String commid);
	//查询用户是否购买了此商品
	UserCart findCommCart(UserCart cart);
	//修改用户购物车的商品数量
	int updateCommCount(UserCart uo);
	//删除用户的所有商品
	int delAllById(String userid);
	//查询所有购物车
	List<UserCart> findAllCart(UserCart cart);
	//根据商品ID来查询购物车
	List<UserCart> findByCommid(String commid);
	
}
