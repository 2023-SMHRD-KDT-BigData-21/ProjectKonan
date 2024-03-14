package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Keyword {
	private BigDecimal article_id;
	private String key_word;
	public Keyword() {
		
	}
	public Keyword(String key_word) {
		this.key_word = key_word;
	}
}
