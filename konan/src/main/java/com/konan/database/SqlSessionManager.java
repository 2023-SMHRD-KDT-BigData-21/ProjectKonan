package com.konan.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//db.properties에 작성되어있는 DB로 연결하고 
//SQL문 호출할 수 있는 세션을 생성할 factory 만들어주는 객체, 마이바티스에서 핵심적 역힐
//1.데이터베이스 연결 정보 및 설정을 읽어들임 (mybatis-config.xml을 읽는다는 뜻)
//2.SQL 쿼리를 실행할 수 있는 SqlSession 객체 생성
//3.매퍼 인터페이스에 대한 바인딩 정보 관리

public class  SqlSessionManager{
	//static: 다른 파일에서 객체를 만들지 않아도 접근 가능
	//SqlSession을 만드는 객체
	static SqlSessionFactory sqlSessionFactory; //DAO class에서 사용
	
	//클래스 초기화 블록 : 클래스 로딩시 딱 한 번만 수행되는 블럭
	static {
		
		//DB 설정정보 가져오기 -> mybatis-config.xml 파일 가져와서 읽기
		String resource = "com/konan/database/mybatis-config.xml";
		
		try {
			//mybatis-config.xml 파일 읽어오기
			Reader reader = Resources.getResourceAsReader(resource);
			//mybatis-config.xml의 DB 정보를 가지고 실제 DB연결을 도와줄 SessionFactory 만들기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//SqlSessionFactory를 반환해주는 메소드
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}

