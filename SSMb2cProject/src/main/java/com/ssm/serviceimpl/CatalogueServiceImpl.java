package com.ssm.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.CatalogueDao;
import com.ssm.modle.Catalogue;
import com.ssm.service.CataService;
@Service
public class CatalogueServiceImpl implements CataService {
	@Autowired
	private CatalogueDao dao;
	@Override
	public List<Catalogue> findAll(Catalogue cata) {
		return dao.findAll(cata);
	}
	@Override
	public Catalogue findByCataid(String cataid) {
		return dao.findByPreid(cataid);
	}
	public int delByCataid(String cataid) {
		return dao.delByCataid(cataid);
	}
	@Override
	public List<Catalogue> findAllChildren(String preid) {
		return dao.findAllChildren(preid);
	}
	@Override
	public List<Catalogue> findDepthItem(int level) {
		return dao.findDepthItem(level);
	}
	@Override
	public int delByPreid(String preid) {
		return dao.delByPreid(preid);
	}
	@Override
	public int insertcata(Map<String, Object> map) {
		return dao.insertCata(map);
	}
	@Override
	public int updateCata(Map<String, Object> map) {
		return dao.updateCata(map);
	}
	
}
