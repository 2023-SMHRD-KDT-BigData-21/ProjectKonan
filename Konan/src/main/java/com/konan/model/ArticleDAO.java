package com.konan.model;

import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class ArticleDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postMapper = "com.konan.database.ArticleMapper.";
}
