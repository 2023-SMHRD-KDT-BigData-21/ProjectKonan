package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
public class UserInfo {
	String user_id;
	String user_pw;
	String email;
	String name;
	String phone_number;
	String region;
	String gender;
	String indate;
	String propic;
	String outdate;
	
	public UserInfo(String user_id, String user_pw){
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	
	public UserInfo(String user_id) {
		this.user_id = user_id;
	}
	
	public UserInfo(String user_id,String user_pw,String email,String name,String phone_number,String region,String gender,String propic) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.email = email;
		this.name= name;
		this.phone_number=phone_number;
		this.region = region;
		this.gender = gender;
		this.propic=propic;
	}
	
	public UserInfo(String userId,String user_pw,String phone_number,String region) {
		this.user_id=userId;
		this.user_pw = user_pw;
		this.phone_number=phone_number;
		this.region=region;
	}
}
