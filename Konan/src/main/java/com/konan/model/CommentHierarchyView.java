package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CommentHierarchyView {
	
	/* java.math.BigDecimal, 
	 * java.lang.String, 
	 * java.math.BigDecimal, 
	 * java.math.BigDecimal, 
	 * java.math.BigDecimal, 
	 * java.lang.String, 
	 * java.lang.String, 
	 * java.sql.Timestamp, 
	 * java.lang.String, 
	 * java.math.BigDecimal, 
	 * java.math.BigDecimal
	 */
	
	BigDecimal lv;
	String lv_show;
	BigDecimal comment_id;
	BigDecimal recomment_id;
	BigDecimal post_id;
	String user_id;
	String comment_content;
	java.sql.Timestamp write_date;
	String is_rewrite;
	BigDecimal report_cnt;
	BigDecimal root_data;
}
