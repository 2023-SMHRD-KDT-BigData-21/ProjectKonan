package com.konan.model;

import java.math.BigDecimal;

import lombok.Getter;


@Getter
public class UserReaction {
	BigDecimal reaction_id;
	BigDecimal post_id;
	String user_id;
	String type;
	
	public UserReaction(BigDecimal post_id,	String user_id, String type) {
		this.post_id = post_id;
		this.user_id = user_id;
 		this.type = type;
	}
}