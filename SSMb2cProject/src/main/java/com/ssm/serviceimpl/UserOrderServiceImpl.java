package com.ssm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.UserOrderDao;
import com.ssm.modle.UserOrder;
import com.ssm.service.UserOrderService;
/**
 * 用户订单实现类
 * @author ASUS
 *
 */
@Service
public class UserOrderServiceImpl implements UserOrderService {
	@Autowired
	private UserOrderDao dao;
	
	
	@Override
	public List<UserOrder> findAllOrders(UserOrder order) {
		return dao.findAllOrders(order);
	}

	@Override
	public int saveOrder(UserOrder order) {
		return dao.saveOrder(order);
	}

	@Override
	public UserOrder findByOrderid(String orderid) {
		return dao.findByOrderid(orderid);
	}

	@Override
	public int delByOrderid(String orderid) {
		return dao.delByOrderid(orderid);
	}

	@Override
	public List<UserOrder> findByUserid(String userid) {
		return dao.findByUserid(userid);
	}

	@Override
	public int updateOrder(String orderid) {
		return dao.updateorder(orderid);
	}

	@Override
	public List<UserOrder> findByCommid(String commid) {
		return dao.findByCommid(commid);
	}

	@Override
	public int updateOrderReturn(String orderid) {
		return dao.updateOrderReturn(orderid);
	}

	@Override
	public List<UserOrder> orderByTime(String userid) {
		return dao.orderByTime(userid);
	}





	

	

}
