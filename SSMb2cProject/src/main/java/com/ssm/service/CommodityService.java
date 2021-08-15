package com.ssm.service;

import java.util.List;

import com.ssm.modle.Commodity;

public interface CommodityService {
	//查询所有手机类别
	public List<Commodity> findAll(Commodity comm);
	//根据父类ID查询祖先根分类
	public List<Commodity> findByPreid(String catalogueid);
	//查询相应类别下的所有商品
	public List<Commodity> findCommsByPreid(String preid);
	//查询根分类下的所有商品
	public List<Commodity> findCommsByRootid(String rootid);
	//根据商品编号查询商品
	public Commodity findById(String commid);
	//根据编号删除商品信息
	public int delByCheckid(String id); 
	//对商品进行添加
	public int insertcomm(Commodity comm);
	//对商品进行修改
	public int updateComm(Commodity comm);
	//对商品的销售量进行统计
	public int updateSales(String commid, int sales); 
	//根据销售量进行排名
	public List<Commodity> selectDescPrice();
	//修改图书库存
	public int updateCommCount(String commid, int bookcount);
}
