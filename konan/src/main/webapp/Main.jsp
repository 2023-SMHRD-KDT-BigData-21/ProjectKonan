<%@page import="java.util.List"%>
<%@page import="com.konan.model.MemberDAO"%>
<%@page import="com.konan.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

<div class="container">
	<% try{ 
		boolean isSuccess = (boolean)session.getAttribute("isSuccess");
	    if(isSuccess==true){
		    Member user = (Member)session.getAttribute("user");%>
		    <h3><%=user.getId()%>님 환영합니다!</h3>
	<%    }
	  }catch (Exception e){
		  e.printStackTrace();
	  }%>
	<div class="upper">
		<%
		MemberDAO dao = new MemberDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		List<Member> userList = dao.getAllMember();
				
		try {
			HttpSession ContentsSession = request.getSession();
			if(userList.size() != 0) {
				for(Member user: userList){
					try {
						%>
						<p><span><%= user.getId()%></span>|<span><%= user.getTel()%></span>|<span><%= user.getAddress()%></span>|<a href="DeleteController?id=<%=user.getId()%>">삭제</a></p>
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
</div>

</body>
</html>