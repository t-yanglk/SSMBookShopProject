package com.ssm.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.CommodityDao;
import com.ssm.modle.Commodity;
import com.ssm.service.CommodityService;
@Service
public class CommodityServiceImpl implements CommodityService{
	
	@Autowired
	private CommodityDao dao;

	@Override
	public List<Commodity> findAll(Commodity comm) {
		return dao.findAll(comm);
	}

	@Override
	public List<Commodity> findByPreid(String catalogueid) {
		return dao.findByPreid(catalogueid);
	}

	@Override
	public List<Commodity> findCommsByPreid(String preid) {
		return dao.findCommsByPreid(preid);
	}

	@Override
	public List<Commodity> findCommsByRootid(String rootid) {
		return dao.findCommsByRootid(rootid);
	}

	@Override
	public Commodity findById(String commid) {
		return dao.findById(commid);
	}

	@Override
	public int delByCheckid(String id) {
		int a=dao.delByCheckid(id);
		if(a==1) {
			return 1;
		}
		return 0;
	}

	@Override
	public int insertcomm(Commodity comm) {
		int a=dao.insertcomm(comm);
		return a;
	}

	@Override
	public int updateComm(Commodity comm) {
		return dao.updateComm(comm);
	}

	@Override
	public int updateSales(String commid, int sales) {
		return dao.updateSales(commid,sales);
	}

	@Override
	public List<Commodity> selectDescPrice() {
		return dao.selectDescPrice();
	}

	@Override
	public int updateCommCount(String commid, int bookcount) {
		return dao.updateCommCount(commid,bookcount);
	}




}
