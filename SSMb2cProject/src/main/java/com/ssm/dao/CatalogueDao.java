package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssm.modle.Catalogue;

@Mapper
public interface CatalogueDao {
	public List<Catalogue> findAll(Catalogue cata);
	public Catalogue findByPreid(String cataid);
	public int delByCataid(String cataid);
	public List<Catalogue> findAllChildren(String preid);
	public List<Catalogue> findDepthItem(int level);
	public int delByPreid(String preid);
	public int insertCata(Map<String, Object> map);
	public int updateCata(Map<String, Object> map);
}
