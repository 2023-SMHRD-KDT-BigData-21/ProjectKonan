package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;
import com.smhrd.model.Board;

public class PostDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postMapper = "com.konan.database.PostMapper.";
	
	//insert into post values(post_id, question_id, post_type, user_id, title, post_content, is_rewrite, SYSDATE, reported_cnt, is_adopted, is_anonymous) 
	//update post set title=#{title}, post_content=#{post_content}, is_rewrite='T' where post_id=#{post_id}
	//delete from post where post_id=#{post_id}
	
	//공통
	// 특정 포스팅 조회
	//select * from post where post_id=#{post_id}
	public Post PostContent(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Post post = sqlSession.selectOne(postMapper+"select", post_id);
		sqlSession.close();
		return post;
	}
	
	// 최근 작성 포스팅 조회(작성,수정 후 보여줄 상세페이지)
	// select max(post_id) where user_id=#{user_id}
	public BigDecimal RecentPost(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		BigDecimal post_id = sqlSession.selectOne(postMapper+"selectRecent", user_id);
		sqlSession.close();
		return post_id;
	}
	
	//QnaList
	// 질문 포스팅 목록 조회
	public List<Post> QpostList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Post> resultList = sqlSession.selectList(postMapper+"selectQpost");
		sqlSession.close();
		return resultList;
	}
	
	// 질문 포스팅 개수 세기
	public int qpostCount() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countQpost = sqlSession.selectOne(postMapper+"qpostCount");
		sqlSession.close();
		return countQpost;
	}
	
	// 답변 포스팅 개수 세기
	public int ansCount(BigDecimal question_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countAns = sqlSession.selectOne(postMapper+"ansCount");
		sqlSession.close();
		return countAns;
	}
	
	
	
	//CommuList
	// 커뮤니티 포스팅 목록 조회
	public List<Post> postList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Post> resultList = sqlSession.selectList(postMapper+"selectPost");
		sqlSession.close();
		return resultList;
	}
	
	// 커뮤니티 포스팅 개수 세기
	public int postCount() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countPost = sqlSession.selectOne(postMapper+"postCount");
		sqlSession.close();
		return countPost;
	}
	
	

	//QnaForm,
	// 포스팅 작성
	public int insert(Post post) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rownum = sqlSession.insert(postMapper+"insert", post);
		sqlSession.close();
		return rownum;
	}
	
	// 포스팅 수정
	public int update(Post post) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rownum = sqlSession.update(postMapper+"update", post);
		sqlSession.close();
		return rownum;
	}
	
	// 포스팅 삭제
	public int update(Post post) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rownum = sqlSession.delete(postMapper+"delete", post);
		sqlSession.close();
		return rownum;
	}
}
