package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserInfo {
	String user_id = null;
	String user_pw = null;
	String email = null;
	String name = null;
	String phone_number = null;
	String region = null;
	String gender = null;
	String indate = null;
	String propic = null;
	String outdate = null;
	
	//로그인을 위한 메소드
	public UserInfo(String user_id, String user_pw){
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	
	//회원가입을 위한 메소드
	//필수 정보, 나머지 추가 인자는 set변수명을 통해 생성
	public UserInfo(String userId,String user_pw, String email, String name, String phone_number){
		this.user_id=userId;
		this.user_pw = user_pw;
		this.email = email;
		this.name = name;
		this.phone_number=phone_number;
		//this.region=region;
		//this.gender=gender;
		//this.indate = indate;
		//this.propic = propic;
	}
	
	//+ 지역
	public UserInfo(String userId, String user_pw, String email, String name, String phone_number, String region, String indate){
		this.user_id=userId;
		this.user_pw = user_pw;
		this.email = email;
		this.name = name;
		this.phone_number=phone_number;
		this.region = region;
		//this.gender=gender;
		this.indate = indate;
		//this.propic = propic;
	}
	
	
}
