package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Member {
	String id;
	String pw;
	String tel;
	String address;
	
	public Member(String id, String pw){
		this.id = id;
		this.pw = pw;
	}
}
