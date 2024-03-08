package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UserInfo {
	String userId;
	String userPw;
	String email;
	String name;
	String phoneNumber;
	String region;
	String gender;
	String indate;
	String propic;
	String outdate;
	
	public UserInfo(String userId, String userPw){
		this.userId = userId;
		this.userPw = userPw;
	}
	public UserInfo(String userId) {
		this.userId = userId;
	}
	public UserInfo(String userId,String userPw,String email,String name,String phoneNumber,String region,String gender,String propic) {
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		this.name= name;
		this.phoneNumber=phoneNumber;
		this.region = region;
		this.gender = gender;
		this.propic=propic;
	}
	public UserInfo(String userId,String userPw,String phoneNumber,String region) {
		this.userId=userId;
		this.userPw=userPw;
		this.phoneNumber=phoneNumber;
		this.region=region;
	}
	
}
