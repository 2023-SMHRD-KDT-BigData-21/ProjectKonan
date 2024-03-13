package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Article {
	private BigDecimal article_id;
	private String title;
	private String article_content;
	private String reporter;
	private String reported_date;
	private String url;
	private String img;
}
