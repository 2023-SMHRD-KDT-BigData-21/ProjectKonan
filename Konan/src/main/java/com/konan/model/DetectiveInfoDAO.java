package com.konan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class DetectiveInfoDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String userInfoMapper= "com.konan.database.DetectiveInfoMapper.";
	
	public int joinReq(DetectiveInfo user){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		int rownum = sqlsession.insert(userInfoMapper+"joinReq",user);
		sqlsession.close();
		
		return rownum;
	}
	public List<DetectiveInfo> acceptList(){
		SqlSession sqlSession = sqlsessionFactory.openSession(true);
		List<DetectiveInfo> list = sqlSession.selectList(userInfoMapper+"reportedPost");
		sqlSession.close();
		System.out.println(list);
		return list;
		
		
	}
	
}
