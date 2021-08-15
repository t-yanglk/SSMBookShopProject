package com.ssm.modle;
/**
 * 用户订单模型
 * @author ASUS
 *
 */
public class UserOrder {
	private String orderid;//订单编号
	private String userid;//用户ID
	private String commid;//商品ID
	private String address;//订单地址
	private User user;//订单用户
	private Commodity comm;//订单商品
	private Integer count;//商品数量
	private Integer price;//订单总价格
	private String state;//订单支付状态
	private String subcribe="N";//是否进行订阅
	private String isreturn="N";//是否归还
	private String intime;//提交时间
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getCommid() {
		return commid;
	}
	public void setCommid(String commid) {
		this.commid = commid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getState() {
		return this.state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getSubcribe() {
		return subcribe;
	}
	public void setSubcribe(String subcribe) {
		this.subcribe = subcribe;
	}
	public String getIsreturn() {
		return isreturn;
	}
	public void setIsreturn(String isreturn) {
		this.isreturn = isreturn;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	
	
	
}
