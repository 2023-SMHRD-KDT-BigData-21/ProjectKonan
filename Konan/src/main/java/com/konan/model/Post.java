package com.konan.model;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Post {
	private BigDecimal post_id;
	private BigDecimal question_id;
	private String post_type;
	private String user_id;
	private String title;
	private String post_content;
	private String is_rewrite;
	private Date write_date;
	private int report_cnt;
	private String is_adopted;
	private String is_anonymous;
}