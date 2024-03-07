package com.konan.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.konan.database.SqlSessionManager;
import com.konan.model.Member;

public class MemberDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String memberMapper= "com.konan.database.MemberMapper.";
	
	public int join(Member member){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		int rownum = sqlsession.insert("com.konan.database.MemberMapper.join",member);
		sqlsession.close();
		
		return rownum;
	}
	
	public Member login(Member member){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		Member user = sqlsession.selectOne(memberMapper+"login", member);
		sqlsession.close();
		
		return user;
	}
	
	public Integer delete(String id){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		Integer user = sqlsession.delete(memberMapper+"delete", id);
		sqlsession.close();
		
		return user;
	}
	
	public int update(Member member) {
		SqlSession sqlSession = sqlsessionFactory.openSession(true);
		int res = sqlSession.update("com.smhrd.database.MemberMapper.update", member);
		sqlSession.close();
		return res;
	}
	
	public List<Member> getAllMember(){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		List<Member> user = sqlsession.selectList(memberMapper+"selectAll");
		sqlsession.close();
		
		return user;
	}
	
	public boolean idCheck(String user_id) {
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		boolean isExist = false;
		Member user = sqlsession.selectOne("com.konan.database.MemberMapper.idCheck", user_id);
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
