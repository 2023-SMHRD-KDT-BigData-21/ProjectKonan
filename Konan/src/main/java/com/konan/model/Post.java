package com.konan.model;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Post {
	private BigDecimal post_id;
	private BigDecimal question_id = null; //답변 포스팅 작성시만
	private String post_type;
	private String user_id;
	private String title;
	private String post_content;
	private String is_rewrite = "F"; //포스팅 수정시만
	private java.sql.Timestamp write_date;
	private BigDecimal report_cnt = BigDecimal.valueOf(0); //신고시
	private String is_adopted = "F"; //채택 포스팅 채택시만
	private String is_anonymous = "F"; //질문 포스팅 작성시만
	

	
	// 질문 포스팅
	public Post(String postType, String userId, String title, String postContent, String isAnonymous) {
		this.post_type = postType;
		this.user_id = userId;
		this.title = title;
		this.post_content = postContent;
		this.is_anonymous = isAnonymous;
	}
	
	// 답변 포스팅
	public Post(String postType, BigDecimal questionId, String userId, String title, String postContent, BigDecimal reportCnt) {
		this.post_type = postType;
		this.question_id = questionId;
		this.user_id = userId;
		this.title = title;
		this.post_content = postContent;
		this.report_cnt = reportCnt; //질문 포스팅과 생성자 매개변수 개수가 같아서 추가, 생성자 사용시 무조건 0으로
	}
	
	// 커뮤니티 포스팅
	public Post(String postType, String userId, String title, String postContent) {
		this.post_type = postType;
		this.user_id = userId;
		this.title = title;
		this.post_content = postContent;
	}
}