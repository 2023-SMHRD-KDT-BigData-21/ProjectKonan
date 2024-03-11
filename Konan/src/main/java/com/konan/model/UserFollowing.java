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
	String user_id;
	String target_id;
	public UserFollowing(String userId) {
		this.user_id=userId;
	}
	
}
