package com.konan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
public class FollowerInfo {
	String userId;
	String targetId;
	public FollowerInfo(String userId) {
		this.userId=userId;
	}
	
}
