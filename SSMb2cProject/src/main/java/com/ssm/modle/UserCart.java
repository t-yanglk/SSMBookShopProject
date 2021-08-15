package com.ssm.modle;
/**
 * 用户订单模型
 * @author ASUS
 *
 */
public class UserCart {

	private String userid;
	private String commid;
	private Integer commcount;
	private User user;//购物车对应的用户
	private Commodity comm;//用户的购物车订单
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getCommid() {
		return commid;
	}
	public void setCommid(String commid) {
		this.commid = commid;
	}
	
	public Integer getCommcount() {
		return commcount;
	}
	public void setCommcount(Integer commcount) {
		this.commcount = commcount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Commodity getComm() {
		return comm;
	}
	public void setComm(Commodity comm) {
		this.comm = comm;
	}
	
	
}
