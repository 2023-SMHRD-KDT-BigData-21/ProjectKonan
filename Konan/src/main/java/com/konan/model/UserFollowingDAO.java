package com.konan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class UserFollowingDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String UserFollowingMapper= "com.konan.database.UserFollowingMapper.";
	
	//팔로잉
	public int following(UserFollowing userFollowing){
		System.out.println("UserFollowingDAO > Following");
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
	
		int rownum = sqlsession.insert(UserFollowingMapper+"following", userFollowing);
		sqlsession.close();
		return rownum;	
	}
	
	//언팔로잉
	public int unfollow(UserFollowing userFollowing){
		System.out.println("UserFollowingDAO > unfollow");
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
	
		int rownum = sqlsession.delete(UserFollowingMapper+"unfollow", userFollowing);
		sqlsession.close();
		return rownum;	
	}	
	
	//내가 팔로잉하고 있는 사람 목록
	public List<UserFollowing> getFollowings(String userId){
		System.out.println(userId);
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		String user_id = userId;
		List<UserFollowing> followings = sqlsession.selectList(UserFollowingMapper+"selectFollowings", user_id);
		sqlsession.close();
		return followings;	
	}
	//나를 팔로잉하고 있는 사람 목록
	public List<UserFollowing> getFollowers(String userId){
		System.out.println(userId);
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		String user_id = userId;
		List<UserFollowing> followers = sqlsession.selectList(UserFollowingMapper+"selectFollowers", user_id);
		sqlsession.close();
		return followers;	
	}
	
	//내가 팔로잉하고있는지 확인
	public int isFollowing(UserFollowing userFollowing) {
		System.out.println("UserFollowingDAO > isFollowing");
		System.out.println(userFollowing.getUser_id());
		System.out.println(userFollowing.getTarget_id());
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		int cnt = sqlsession.selectOne(UserFollowingMapper+"isFollowing", userFollowing);
		return cnt;
	}
}
