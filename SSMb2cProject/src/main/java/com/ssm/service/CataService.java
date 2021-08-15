package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.modle.Catalogue;

public interface CataService {
	//查询所有分类
	public List<Catalogue> findAll(Catalogue cata);
	//查询父元素
	public Catalogue findByCataid(String cataid);
	//根据分类id来删除分类信息
	public int delByCataid(String cataid);
	//查询父类元素的子元素
	public List<Catalogue> findAllChildren(String preid);
	//查询指定深度的分类
	public List<Catalogue> findDepthItem(int level);
	//根据父类ID进行删除多条记录
	public int delByPreid(String preid);
	//添加分类信息
	public int insertcata(Map<String, Object> map);
	//修改分类信息
	public int updateCata(Map<String, Object> map);
}
