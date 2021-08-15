package com.ssm.service;

import java.util.List;

import com.ssm.modle.UserOrder;

/**
 * 用户订单业务
 * @author ASUS
 *
 */
public interface UserOrderService {
	
	//查询所有订单
	public List<UserOrder> findAllOrders(UserOrder uo);
	//保存用户订单
	public int saveOrder(UserOrder order);
	//根据订单编号查询订单
	public UserOrder findByOrderid(String orderid);
	//根据编号删除订单
	public int delByOrderid(String orderid); 
	//根据某个用户的id查询用户的所有订单
	public List<UserOrder> findByUserid(String userid);
	//根据商品的编号来查询订单
	public List<UserOrder> findByCommid(String commid);
	//更改订单状态
	public int updateOrder(String orderid);
	//更改归还状态
	public int updateOrderReturn(String orderid);
	//根据id查询订单并按照时间排序
	public List<UserOrder> orderByTime(String userid);
	
}
