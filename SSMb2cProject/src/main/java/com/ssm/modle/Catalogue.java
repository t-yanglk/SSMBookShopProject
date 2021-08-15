package com.ssm.modle;

import java.util.List;

/**
 * 分类管理
 * @author ASUS
 *
 */
public class Catalogue {
	private String catalogueid;
	private String cataname;
	private String cataimg;
	private Integer depth;
	private Catalogue parentcata;
	private List<Catalogue> childrencata;
	/*
	 * 二层分类下的所有商品
	 */
	private List<Commodity> comms;
	/*
	 * 根分类下的所有商品
	 */
	private List<Commodity> rootcomms;
	//分类下的商品销量统计
	private int salecount;
	
	public String getCatalogueid() {
		return catalogueid;
	}
	public void setCatalogueid(String catalogueid) {
		this.catalogueid = catalogueid;
	}
	public String getCataname() {
		return cataname;
	}
	public void setCataname(String cataname) {
		this.cataname = cataname;
	}
	public String getCataimg() {
		return cataimg;
	}
	public void setCataimg(String cataimg) {
		this.cataimg = cataimg;
	}
	public Catalogue getParentcata() {
		return parentcata;
	}
	public void setParentcata(Catalogue parentcata) {
		this.parentcata = parentcata;
	}
	public List<Catalogue> getChildrencata() {
		return childrencata;
	}
	public void setChildrencata(List<Catalogue> childrencata) {
		this.childrencata = childrencata;
	}
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
	public List<Commodity> getComms() {
		return comms;
	}
	public void setComms(List<Commodity> comms) {
		this.comms = comms;
	}
	public List<Commodity> getRootcomms() {
		return rootcomms;
	}
	public void setRootcomms(List<Commodity> rootcomms) {
		this.rootcomms = rootcomms;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	
	
	
}
