package com.konan.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class Board {
	private BigDecimal idx;
	private String title;
	private String content;
	private String writer;
	private String img;
	private String indate;
	
	public Board(String title, String writer, String content, String img){
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.img = img;
	}
}
