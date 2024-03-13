package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Paging {
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
		private Integer like_cnt = 0;
		private Integer comment_cnt = 0;
}
