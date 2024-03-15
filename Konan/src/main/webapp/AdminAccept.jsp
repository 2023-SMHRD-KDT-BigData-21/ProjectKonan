<%@page import="com.konan.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="upper">
		<%
		PostDAO dao = new PostDAO();

				response.setContentType("text/html;charset=UTF-8");
				
				List<Post> userList = dao();
				
				try {
				HttpSession ContentsSession = request.getSession();
				if(userList.size() != 0) {
				for(UserInfo user: userList){
					try {
		%>
						<p><span><%= user.getUserId()%></span>|<span><%= user.getPhoneNumber()%></span>|<span><%= user.getRegion()%></span>|<a href="DeleteController?id=<%=user.getUserId()%>">삭제</a></p>
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