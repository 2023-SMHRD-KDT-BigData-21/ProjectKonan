package com.konan.model;

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
	
}
