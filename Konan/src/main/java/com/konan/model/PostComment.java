package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class PostComment {
	/* "COMMENT_ID" NUMBER(19,0) NOT NULL ENABLE, 
	 * "RECOMMENT_ID" NUMBER(19,0), 
	 * "POST_ID" NUMBER(19,0) NOT NULL ENABLE, 
	 * "USER_ID" VARCHAR2(32 BYTE), 
	 * "COMMENT_CONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	 * "WRITE_DATE" DATE NOT NULL ENABLE, 
	 * "IS_REWRITE" VARCHAR2(1 BYTE) DEFAULT 'F' NOT NULL ENABLE, 
	 * "REPORT_CNT" NUMBER(19,0) DEFAULT '0' NOT NULL ENABLE, 
	 */

	private BigDecimal comment_id = null;
	private BigDecimal recomment_id = null;
	private BigDecimal post_id = null;
	private String user_id = null;
	private String comment_content = null;
	private java.sql.Timestamp write_date = null;
	private String is_rewrite = "F"; //채택 포스팅 채택시만
	private BigDecimal report_cnt = BigDecimal.valueOf(0); //신고시
	
	//댓글 작성시
	public PostComment(BigDecimal post_id, String user_id, String comment_content){
		this.post_id = post_id;
		this.user_id = user_id;
		this.comment_content = comment_content;
	}
	
	//대댓글 작성시
}
