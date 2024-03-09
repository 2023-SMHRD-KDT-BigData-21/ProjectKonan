package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
public class UserFollowing {
	String userId;
	String targetId;
	public UserFollowing(String userId) {
		this.userId=userId;
	}
	
}
