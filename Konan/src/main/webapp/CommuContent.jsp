<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/Konan/css/Default2.css">
    <link rel="stylesheet" href="/Konan/css/CommuContent.css">
	
</head>
<body>
    <!-- body 전체 가운데로 -->
    <div class="container">

        <!-- 게시글 박스-->
        <div class="post-container">
            <div class="post-title-container">
                <form action="/hashtag_search.php" method="get">
                    <div class="hashtags-container">
                        <div class="hashtags">
                            <span>#호기심</span>
                            <span>#명탐정코난</span>
                        </div>
                        <div class="btn-bookmark"></div>
                    </div>
                </form>
                <div class="post-group">
                    <div class="post-title"><span>탐정 쉽게 되는 법</span></div>
                    <div class="post-author">
                        <span>작성자</span><span>유명한</span>
                    </div>
                    <div class="post-date">
                        <span>작성일자</span><span>2024.01.01</span>
                    </div>
                </div>
            </div>
            <div class="post-question-container">
                <div class="post-question">
                    <span>머리가 좋으면 됩니다</span>
                </div>
                <div class="likes-replies-container">
                    <div class="btn-likes">
                        <span>좋아요 </span>&nbsp;&nbsp;<span>1</span>
                    </div>
                    <div class="btn-replies">
                        <span>답변 </span>&nbsp;&nbsp;<span>25</span>
                    </div>
                </div>
            </div>
        </div>




        <!-- 댓글 박스 -->

        <div class="post-replies-container">
            <div class="post-replies-text">
                <span style="font-weight: 700; font-size: 30px;">댓글</span>
                <span style="font-weight: 700; font-size: 30px;">&nbsp;&nbsp;</span>
                <span style="font-weight: 700; font-size: 30px;">4</span>
            </div>

            <!-- 이미 쓰여 있는 댓글 박스 -->
            <div class="det-profile-containerr">
                <div class="det-profile-img-container">
                    <div class="det-profile-imgg"></div>
                </div>
                <div class="det-info">
                    <div class="det-name"><span>강아지</span>&nbsp;&nbsp;<span>2024.03.11</span></div>
                    <div class="det-rply-cntent"><span>댓글내용댓글내용댓글내용</span></div>
                    <div class="btn-repliess">
                        <div class="btn-likess"><span>좋아요</span></div>
                        <div class="btn-reply"><span>답글</span></div>
                        <div class="btn-edit"><span>수정</span></div>
                        <div class="btn-delete-container">
                            <div class="btn-delete"><span>삭제</span></div>
                        </div>
                    </div>
                </div>
            </div>
            
            

            <!-- 대댓글 박스 -->
            <div class="re-det-profile-containerr">
                <div class="re-det-profile-img-container">
                    <div class="re-det-profile-imgg"></div>
                </div>
                <div class="re-det-info">
                    <div class="re-det-name"><span>강아지</span>&nbsp;&nbsp;<span>2024.03.11</span></div>
                    <div class="re-det-rply-cntent"><span>댓글내용댓글내용댓글내용</span></div>
                    <div class="re-btn-repliess">
                        <div class="re-btn-likess"><span>좋아요</span></div>
                        <div class="re-btn-reply"><span>답글</span></div>
                        <div class="re-btn-edit"><span>수정</span></div>
                        <div class="re-btn-delete-container">
                            <div class="re-btn-delete"><span>삭제</span></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 댓글 쓰기 박스-->
            <div class="user-reply-container">
                <div class="profile-img"></div>
                <div class="content-container">
                    <div class="post-reply"><span>댓글 쓰기</span></div>
                    <input type="text" name="reply-comment" class="reply-comment" placeholder="남기고 싶은 이야기를 적으셈">
                </div>
            </div>
            <div class="reply-btn">
                <button type="submit">
                    <span>게시하기</span>
                </button>
            </div>

        </div>
    </div>


    </div>


    <!-- footer -->
    <div class="footer-container">
        <div class="footer-item">
            <p1>21기 빅데이터 개발자 과정</p1>
        </div>
        <div class="footer-item">
            <h3>@국민탐정</h3>
        </div>
        <div class="footer-item">
            <p2>project.konan@smhrd.com</p2>
        </div>
    </div>


</body>

</html>