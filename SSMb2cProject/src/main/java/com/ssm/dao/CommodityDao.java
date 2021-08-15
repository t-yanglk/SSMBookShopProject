package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssm.modle.Commodity;
@Mapper
public interface CommodityDao {
	//查询所有手机类别
	public List<Commodity> findAll(Commodity comm);
	//根据父类ID查询商品
	public List<Commodity> findByPreid(String preid);
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
	public int updateSales(@Param("commid") String commid,@Param("sales") int sales);
	//根据浏览量进行排名
	public List<Commodity> selectDescPrice();
	//修改图书库存
	public int updateCommCount(@Param("commid") String commid,@Param("bookcount") int bookcount);
	

}
