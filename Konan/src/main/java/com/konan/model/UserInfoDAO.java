package com.konan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.konan.database.SqlSessionManager;

public class UserInfoDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String userInfoMapper= "com.konan.database.UserInfoMapper.";
	
	public int join(UserInfo userInfo){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		int rownum = sqlsession.insert(userInfoMapper+"join",userInfo);
		sqlsession.close();
		
		return rownum;
	}
	
	public UserInfo login(UserInfo userInfo){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		UserInfo user = sqlsession.selectOne(userInfoMapper+"login", userInfo);
		sqlsession.close();
		
		return user;
		}
	public Integer delete(String id){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		Integer user = sqlsession.delete(userInfoMapper+"delete", id);
		sqlsession.close();
		
		return user;
	}
	
	public int update(UserInfo userInfo) {
		SqlSession sqlSession = sqlsessionFactory.openSession(true);
		int res = sqlSession.update(userInfoMapper+"update", userInfo);
		sqlSession.close();
		return res;
	}
	
	public List<UserInfo> getAllMember(){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		List<UserInfo> user = sqlsession.selectList(userInfoMapper+"selectAll");
		
		sqlsession.close();
		
		return user;
	}
	
	public boolean idCheck(String userId) {
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		boolean isExist = false;
		UserInfo user = sqlsession.selectOne(userInfoMapper+"idCheck", userId);//error
		if (user != null) {
			isExist = true;
			System.out.println("사용할 수 없는 아이디");
		}else {
			System.out.println("사용가능한 아이디");			
		}
		sqlsession.close();
		return isExist;
	}
}
