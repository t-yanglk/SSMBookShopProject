package com.ssm.util;
/**
 * 随机分配工具
 * @author ASUS
 *
 */
public class RandomClass {
	
	/**
	 * 随机分配颜色
	 * @return
	 */
	public static String randomColor() {
		int i=(int)(Math.random()*10);
		String[] colors= {"red","black","deepskyblue","	dimgray","green","blue","mauve","yellow","yellowgreen","purple","orange"};
		return colors[i];
	}
	
	/**
	 * 随机分配订单号
	 * @return
	 */
	public static String randomOrderId() {
		String dome="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		String[] domeid=dome.split("");
		String id="";
		for(int i=0;i<10;i++) {
			int a=(int)(Math.random()*36);
			id+=domeid[a];
		}
		return id;
	}

}
