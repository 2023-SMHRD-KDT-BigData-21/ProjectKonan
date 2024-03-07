package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Member {
	String user_id;
	String user_pw;
	String email;
	String name;
	String phone_number;
	String region;
	String gender;
	String propic;
	
	public Member(String user_id, String user_pw){
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
}
