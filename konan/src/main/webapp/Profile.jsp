<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>님의 프로필</title>
    <link rel="stylesheet" href="./css/Default.css">
    <link rel="stylesheet" href="./css/Profile.css">
</head>
<body>
    
    <div class = "container">
        <!-- 동현씨 -->
        <!-- 프로필 컨테이터 -->
        <div class = "profile-contain">
            <div class = "profile-background"></div>

            
            <div class = "user-container">
                <!-- 프사 -->
                <div class = "propic"></div>
                <!-- 프사수정 -->
                <button class = "update_btn"></button>                
                <div class = "user-info"></div>
                    <strong name="user_name">이지호</strong>
                    <br>
                    <span>@<span name="user_id">jihoddi</span></span>
                </div>
            </div>
            <!-- 만일 자신의 프로필이라면 visibility을 hidden에서 visible로 변경 -->
            
        
            <div class = "relation-container">
                <button>팔로잉&nbsp;<span name = "following"></span></button>
                <span>&nbsp;&nbsp;&nbsp;</span>
                <button>팔로워&nbsp;<span name = "follower"></span></button>
            </div>

            <br>


            <!-- 지호씨 -->
            <!-- 유저 게시글/유저 질문 전환 탭-->
            <div class="transition-container">
                <div class="btn-container">
                    <!-- onclick 삽입하기 -->
                    <button id="post_type" value="C" onclick="showPostsByType()">게시글</button> 
                    <button id="post_type" value="Q" onclick="showPostsByType()">질문</button>
                    <button id="post_type" value="A" onclick="showPostsByType()">답변</button>
                    <hr>
                </div>

                <!-- 커뮤니티 게시글 컨테이너  -->
                <div name = "post_container" class="post_container">

                </div>             
            </div>
    </div>
    <script>
		function showPostsByType(){
			
			let post_type = document.getElementById("post_type")//post 아이디로 가져옴
			console.log(post_type.value)//C/A/Q 중 하나
			
			$.ajax({    
			type : "", // 타입 (get, post, put 등등)    
			url : "", // 요청할 서버url    
			async : true,  // 비동기화 여부 (default : true)    
			dataType : "", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
			data : {"" : post_type.value},
			success : function(result) { 
				// 성공 콜백함수        
						
					},    
			error : function(request, status, error) { 
						//에러 콜백함수        
						console.log("중복체크 실패")    
						console.log(request.responseText)    
						console.log(error)    
					}
			})
		}
    </script>
</body>
</html>