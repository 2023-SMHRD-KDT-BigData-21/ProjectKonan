package com.konan.controller.profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserFollowing;
import com.konan.model.UserFollowingDAO;
import com.konan.model.UserInfo;


public class FollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("FollowController");
		
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		
		String targetId = request.getParameter("targetId");
		System.out.println(targetId);
		
		UserFollowing userFollowing = new UserFollowing(userInfo.getUser_id(), targetId);
		UserFollowingDAO dao = new UserFollowingDAO();
		Integer result = (Integer)dao.isFollowing(userFollowing);
		System.out.println("result: " + result);
		if(result!= 0) { //사용할 수 없는 아이디 (NN)
			System.out.println("팔로잉 중");
		}else { //사용할 수 있는 아이디 (YY)
			System.out.println("팔로잉하지않음");
			int rownum = dao.following(userFollowing);
			if (rownum >0){
				System.out.println("row num: "+rownum);
				System.out.println("팔로잉 중");
			}else {
				System.out.println("팔로잉 실패");				
			}//else
		}//else
	}//service
}
