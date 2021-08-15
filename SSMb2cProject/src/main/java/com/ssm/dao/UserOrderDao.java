package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssm.modle.UserOrder;

/**
 * 用户订单持久层
 * @author ASUS
 *
 */
@Mapper
public interface UserOrderDao {
	
	//查询所有订单
	public List<UserOrder> findAllOrders(UserOrder order);
	//保存用户订单
	public int saveOrder(UserOrder order);
	//根据订单编号查询订单
	public UserOrder findByOrderid(String orderid);
	//根据订单编号删除订单
	public int delByOrderid(String orderid);
	//查询某个用户的所有订单
	public List<UserOrder> findByUserid(String userid);
	//更改订单状态
	public int updateorder(String orderid);
	//根据商品编号查询订单
	public List<UserOrder> findByCommid(String commid);
	//更改归还状态
	public int updateOrderReturn(String orderid);
	//根据id查询订单并按照时间排序
	public List<UserOrder> orderByTime(String userid);

}
