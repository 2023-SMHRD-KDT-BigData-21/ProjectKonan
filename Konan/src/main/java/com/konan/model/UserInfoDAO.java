package com.konan.model;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.converter.ImageToBase64;
import com.konan.database.SqlSessionManager;

public class UserInfoDAO {
	SqlSessionFactory sqlsessionFactory = SqlSessionManager.getSqlSessionFactory();
	String userInfoMapper= "com.konan.database.UserInfoMapper.";
	
	public int joinDefault(UserInfo userInfo){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		int rownum = sqlsession.insert(userInfoMapper+"joinDefault",userInfo);
		sqlsession.close();
		
		return rownum;
	}
	
	//로그인
	public UserInfo login(UserInfo userInfo){
		//반환되는 객체: 아이디, 비번만 담은 객체로 반환
		System.out.println("userInfoDAO");
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		UserInfo user = sqlsession.selectOne(userInfoMapper+"login", userInfo);
		System.out.println("로그인 시도 | 아이디: "+userInfo.getUser_id());
		System.out.println("로그인 db 반환 | 아이디: "+user.getUser_id());
		sqlsession.close();
		return user;
		}
	
	public Integer delete(UserInfo userInfo){
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		
		Integer user = sqlsession.delete(userInfoMapper+"delete", userInfo);
		sqlsession.close();
		
		return user;
	}
	
	public int update(UserInfo userInfo) {
		SqlSession sqlSession = sqlsessionFactory.openSession(true);
		int res = sqlSession.update(userInfoMapper+"update", userInfo);
		sqlSession.close();
		return res;
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
	
	
	//특정 회원 정보 가져오기
	public UserInfo getUser(String userId){
		//반환되는 객체: 아이디, 비번만 담은 객체로 반환
		System.out.println("userInfoDAO");
		SqlSession sqlsession = sqlsessionFactory.openSession(true);
		UserInfo user = sqlsession.selectOne(userInfoMapper+"selectUser", userId);
		System.out.println("db 반환 | 아이디: "+user.getUser_id());
		sqlsession.close();
		return user;
	}
	
	//프사 보여주기
	public UserInfo propicContent(String userId) {
		SqlSession sqlSession = sqlsessionFactory.openSession(true);
		UserInfo user = sqlSession.selectOne(userInfoMapper+"selectUser",userId);
		sqlSession.close();
		
		//img : 파일의 제목.확장자 -> 지정한 경로에서 해당 파일을 가져와야 함
		//		가지고 온 파일 -> 텍스트 형태로 변환(converter - base64 라이브러리 pom.xml에 추가)
		//경로 사람마다 다를 삘임 뭔가
		//찬우: C:\\workplace\\git\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\
		//지호: C:\\Users\\USER\\Desktop\\WebServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\

		String chanu = "C:\\workplace\\git\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		String jiho = "C:\\Users\\USER\\Desktop\\WebServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		try {
			if(user.getPropic()!=null) {				
				File file = new File(chanu + user.getPropic());
				ImageToBase64 converter = new ImageToBase64();
				String fileStringValue = converter.convert(file);
				
				user.setPropic(fileStringValue); //파일제목 -> 이미지 파일 문자열
				System.out.println(fileStringValue);
			}
		} catch (Exception e) {
			
		}
		
		return user;
	}
}
