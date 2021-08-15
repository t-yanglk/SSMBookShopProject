package com.ssm.util;

import java.util.ArrayList;
import java.util.List;

import com.ssm.modle.User;

/**
 * 校验传入的id字段是否与数据库重复
 * @author ASUS
 *
 */
public class CheckId {
	public static boolean checkUserId(String userid,List<User> useres) {
		List<String> userids=new ArrayList<>();
		for(User u:useres) {
			userids.add(u.getUserid());
		}
		for(int i=0;i<userids.size();i++) {
			if(userid.contentEquals(userids.get(i))) {
				return false;
			}
		}
		return true;
	}
}
