<%@page import="com.konan.model.FollowerInfo"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	UserInfo userInfo = (UserInfo)session.getAttribute("loginId"); 
	System.out.print(userInfo);
	System.out.print(userInfo.getUserId());
	%>
	
	<div class="upper">
		<%
			UserInfoDAO dao = new UserInfoDAO();

			response.setContentType("text/html;charset=UTF-8");
				
			List<FollowerInfo> userList = dao.getFollower(userInfo.getUserId());
				
			try {
				HttpSession ContentsSession = request.getSession();
				if(userList.size() != 0) {
					for(FollowerInfo follower: userList){
						try {
		%>
						<p><a href="DeleteController?id=<%=follower.getUserId()%>">삭제</a></p>
						<%
					} catch (Exception e){
						System.out.println("삭제 반영 안됨");
						e.printStackTrace();
					}
				}
				
			}else {
				System.out.println("불러오기 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}%>
	</div>
</body>
</html>