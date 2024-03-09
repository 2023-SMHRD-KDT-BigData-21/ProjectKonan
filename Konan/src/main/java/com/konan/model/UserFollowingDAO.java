package com.konan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class UserFollowingDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String UserFollowingMapper= "com.konan.database.UserFollowingMapper.";
	
	public List<UserFollowing> getFollowings(String userId){
		System.out.println(userId);
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		String user_id = userId;
		List<UserFollowing> followings = sqlsession.selectList(UserFollowingMapper+"selectFollowings", user_id);
		sqlsession.close();
		return followings;	
	}
	
	public List<UserFollowing> getFollowers(String userId){
		System.out.println(userId);
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		String user_id = userId;
		List<UserFollowing> followers = sqlsession.selectList(UserFollowingMapper+"selectFollowers", user_id);
		sqlsession.close();
		return followers;	
	}
	
}
