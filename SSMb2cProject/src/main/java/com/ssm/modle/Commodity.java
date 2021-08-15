package com.ssm.modle;
/**
 * 商品模型
 * @author ASUS
 *
 */
public class Commodity {
	private String commid;
	private String commname;
	private Integer commprice;
	private String commimg;
	private String rootid;
	private String preid;
	private String description;//商品描述
	private Integer count;//库存数量
	private String commdetails;//商品详情
	private int salesvolume;//销售量
	
	public String getCommid() {
		return commid;
	}
	public void setCommid(String commid) {
		this.commid = commid;
	}
	public String getCommname() {
		return commname;
	}
	public void setCommname(String commname) {
		this.commname = commname;
	}
	public Integer getCommprice() {
		return commprice;
	}
	public void setCommprice(Integer commprice) {
		this.commprice = commprice;
	}
	public String getCommimg() {
		return commimg;
	}
	public void setCommimg(String commimg) {
		this.commimg = commimg;
	}
	public String getPreid() {
		return preid;
	}
	public void setPreid(String preid) {
		this.preid = preid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRootid() {
		return rootid;
	}
	public void setRootid(String rootid) {
		this.rootid = rootid;
	}
	public String getCommdetails() {
		return commdetails;
	}
	public void setCommdetails(String commdetails) {
		this.commdetails = commdetails;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public int getSelasvolume() {
		return salesvolume;
	}
	public void setSalesvolume(int salesvolume) {
		this.salesvolume = salesvolume;
	}
	
}
