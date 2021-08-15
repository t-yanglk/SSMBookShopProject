package com.ssm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.UserCartDao;
import com.ssm.modle.UserCart;
import com.ssm.service.UserCartService;
@Service
public class UserCartServiceImpl implements UserCartService {
	@Autowired
	private UserCartDao dao;

	@Override
	public int insertCart(UserCart cart) {
		return dao.insertCart(cart);
	}

	@Override
	public List<UserCart> findByUid(String userid) {
		return dao.findByUid(userid);
	}

	@Override
	public int delCartComm(String userid,String commid) {
		return dao.delCartComm(userid,commid);
	}

	@Override
	public UserCart findCommCart(UserCart cart) {
		return dao.findCommCart(cart);
	}

	@Override
	public int updateCommCount(UserCart uo) {
		return dao.updateCommCount(uo);
	}

	@Override
	public int delAllById(String userid) {
		return dao.delAllById(userid);
	}

	@Override
	public List<UserCart> findAllCart(UserCart cart) {
		return dao.findAllCart(cart);
	}

	@Override
	public List<UserCart> findByCommid(String commid) {
		return dao.findByCommid(commid);
	}


	


	

	
	
	
}
