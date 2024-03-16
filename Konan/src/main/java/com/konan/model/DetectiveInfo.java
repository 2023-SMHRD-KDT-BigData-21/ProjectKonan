package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class DetectiveInfo {
	
	private String user_id;
	private String accepted;
	private String proof_shot;
	private String reqdate;
	
	
	
	public DetectiveInfo(String user_id, String proof_shot){
		this.user_id = user_id;
		this.proof_shot = proof_shot;
	}
	
}
