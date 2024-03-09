package com.konan.model;

public class DetectiveInfo {
	
	String user_id;
	String accepted;
	String proof_shot;
	String reqdate;
	
	public DetectiveInfo(String user_id, String proof_shot){
		this.user_id = user_id;
		this.proof_shot = proof_shot;
	}
}
