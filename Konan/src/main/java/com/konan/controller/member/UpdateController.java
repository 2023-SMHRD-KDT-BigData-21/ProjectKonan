package com.konan.controller.member;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  private static final String SAVE_PATH = "/upload"; // 파일 저장 경로

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
    String user_id = userInfo.getUser_id();

    // 파일 업로드 처리
    MultipartRequest multi = new MultipartRequest(request, request.getServletContext().getRealPath(SAVE_PATH),
        5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

    // 폼(form)에서 전송된 사용자 정보 파라미터 가져오기
    String user_pw = multi.getParameter("user_pw");
    String email = multi.getParameter("email");
    String name = multi.getParameter("name");
    String phone_number = multi.getParameter("phone_number");
    String region = multi.getParameter("region");
    String gender = multi.getParameter("gender");


    // 프로필 이미지 파일명이 없으면 기존 이미지 유지
    

    // 사용자 정보 업데이트를 위한 UserInfo 객체 생성
    UserInfo updatedUserInfo = new UserInfo();
    updatedUserInfo.setUser_id(user_id);
    updatedUserInfo.setUser_pw(user_pw);
    if(email!=null) {
    updatedUserInfo.setEmail(email);
    }
    if(name!=null) {
    updatedUserInfo.setName(name);	
    }
    if(phone_number!=null) {
    updatedUserInfo.setPhone_number(phone_number);	
    }
    
    updatedUserInfo.setRegion(region);
    updatedUserInfo.setGender(gender);


    // 사용자 정보 업데이트
    UserInfoDAO dao = new UserInfoDAO();
    int res = dao.updateProfile(updatedUserInfo);

    // 업데이트 결과에 따라 리다이렉션
    if (res > 0) {
      // 업데이트 성공 시 세션과 프로필 페이지로 이동
      userInfo = dao.getUser(user_id);
      session.setAttribute("userInfo", userInfo);
      response.sendRedirect("Profile.jsp?targetId=" + user_id);
    } else {
      // 업데이트 실패 시 에러 메시지와 함께 프로필 페이지로 이동
      request.setAttribute("errorMessage", "정보 업데이트에 실패했습니다.");
      request.getRequestDispatcher("Profile.jsp?targetId=" + user_id).forward(request, response);
    }
  }
}