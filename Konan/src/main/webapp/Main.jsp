<%@page import="com.konan.model.Post"%>
<%@page import="com.konan.model.PostDAO"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인페이지</title>
	
	<link rel="stylesheet" href="">
    <link rel="stylesheet" href="">
    
    <style>
        .js-load {
            display: none;
        }
        .js-load.active {
            display: block;
        }
        .js-load:after {
            display: none;
        }
        .btn-wrap {
            display: block;
        }
    </style>
    
</head>

<body>
<%@ include file="Header.jsp" %>
<%
	PostDAO dao = new PostDAO();
	
	int qCount = dao.qpostCount(); // 총 질문 개수
	int showNum = 15; // 한 페이지에 보여줄 글 개수(고정)
	
	int btnNum = qCount / showNum; // 더보기 버튼이 몇 번 나올지
	int first = btnNum==0?qCount:showNum; // 첫번째 페이지에서 보여줄 글 개수
	
	List<Post> list = dao.qpostList();
%>

<div class="container">
	<%if(user==null){%>
	
	<a href="Join.jsp"><button>회원가입</button></a>
	<a href="Login.jsp"><button>로그인</button></a>
	
	<%}else{%>
		<%=user.getName() %>
		<a href="LogoutController"><button>로그아웃</button></a>
		<a href="Profile.jsp"><button>프로필</button></a>
	<%} %>
</div>

<form action="#">
    <div class="container">
        <div class="search-container">
            <div class="search-icon"></div>
            <input type="text" class="search-input">
        </div>

        <div class="most-viewed-questions">
            인기 질문
            <div class="content-box"></div>

            <!-- 글쓰기 버튼 -->
            <div class="post-button">글쓰기</div>
        </div>

        <div class="waiting-questions-container">
            <div class="question-container-cover" style="border-bottom: 1px solid;">답변을 기다리는 질문</div>
            <%
            	for(int i=0; i<qCount; i++){
            		Post post=list.get(i);
            %>
          		<div class="question-container-inside js-load" >
          		    <div class="question-title">
          		    <a href="CommuContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle() %>
          		    </a></div>
          		    <div class="question-content">
          		    <%if(post.getPost_content().length()>30){ 
          		    	out.print(post.getPost_content().substring(0,30));
          		    	}else{
          		    	out.print(post.getPost_content());
          		    	}%>
                	</div>
                	<div class="response-container">
                		<span>답변 <!--dao.ansCount(post.getPost_id()) %> --></span>
                		<span>좋아요 </span>
                	</div>
                </div>
            <%}%>
        </div>
        <div>
         	<button id="js-btn-wrap" class="more">
                <span>더 보기</span>
            </button>
		</div>
    </div>
</form>

   	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
    
    <script> // (동기)더보기 이후 게시글을 보여줄 로직 구현
    	function moreList(){
    		$.ajax({
    			url : "/admin/jsonlist",
    			type : "POST",
    			cache : false,
    			dataType: 'json',
    			data : "conectType="+conectType +"&eDate="+eDate+"&sDate="+sDate+"&codeId="+codeId+"&limit="+limit,
    			success : function(data){
    				console.log(data);
    				var content="";
    				for(var i=0; i<data.hashMapList.length; i++){
    					content +=
    						"<tr>"+"<td>"+data.hashMapList[i].area+"</td>"+
    						"<td>"+data.hashMapList[i].name+"</td>"+
    						"<td>"+data.hashMapList[i].gubun+"</td>"+
    						"<td>"+data.hashMapList[i].cnt+"</td>"+
    						"</tr>";
    						}
    				content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
    				$('#addbtn').remove();//remove btn
    				$(content).appendTo("#table");
    			}, error:function(request,status,error){
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
    			});
    		};
    </script>
    }
    
    <script> // (비동기)더보기 이후 게시글을 보여줄 로직 구현
    
		var showNum = "<%=showNum%>"; // 한 페이지에 보여줄 글 개수(고정)
	
        function load(id, showNum, btn) {
            let remain = id + " .js-load:not(.active)"; // 아직 안 보여준 게시글
            let length = $(content).length; // 남은 게시글 개수
            let more; // 더보기 클릭 시 보여줄 게시글 개수
            if (length > showNum) {
                more = showNum;
            } else { // 남은 게시글 개수가 showNum보다 적을 경우
                more = length;
                $(btn).hide();
            }
            $(remain + ":lt(" + more + ")").addClass("active");
        }
		
        $(window).on('load', function () {
        	// 초기
            load('#js-load', showNum);
        
            // 더보기 버튼 클릭 시
            $("#js-btn-wrap").on("click", function () {
                load('#js-load', showNum, '#js-btn-wrap');
            })
        });
    </script>
    
    <!-- 
    <script> // 더보기 이후 게시글을 보여줄 로직 구현
		let qCount = "<%=qCount-15%>"; // 남은 질문 개수
		var showNum = "<%=showNum%>"; // 한 페이지에 보여줄 글 개수(고정)
		let btnNum = "<%=btnNum%>"; // 더보기 버튼이 몇 번 나올지
    	let now;
		
    	let more-btn = document.getElementById("more-btn");
    	let movieArea = document.getElementsByClassName("waiting-questions-container")[0];
    	
        const getPostList = function () {

            const render = function (pageList) {
                let resultHTML = `
      		        <div class="question-container-inside" >
  		            <div class="question-title">
  		            <a href="CommuContent.jsp?idx=post.getPost_id()%>">post.getTitle() %>
  		            </a></div>
  		            <div class="question-content">
                    `;

                // 게시글 수만큼 반복하면서 resultHTML에 정보를 담아줄 로직
                for (let i = 0; i < pageList.length; i++) {
                    let post = pageList[i];

                    if(post.getPost_content().length()>30){ 
          		    	out.print(post.getPost_content().substring(0,30));
          		    	}else{
          		    	out.print(post.getPost_content());
          		    	}
                    
                    resultHTML += `
                        </div>
                	    <div class="response-container">
            		    	<span>답변 dao.ansCount(post.getPost_id()) %></span>
            		    	<span>좋아요</span>
            	    	</div>
                        </div>
                    `
                }

                resultHTML += '</div>';
                container.innerHTML = resultHTML;
            }

            $.ajax({
                url: movieUrl,
                success: function (result) {
                    console.log("요청성공!");
                    console.log(result);
                    console.log(result.boxOfficeResult.dailyBoxOfficeList);
                    let pageList = result.boxOfficeResult.dailyBoxOfficeList;

                    // 한 페이지에 나올 게시글을 출력
                    render(pageList);
                },
                error: function () {
                    console.log("요청실패!");
                }
            })
        }
        moreBtn.addEventListener("click", getPostList);
	</script>
	 -->

</body>
</html>