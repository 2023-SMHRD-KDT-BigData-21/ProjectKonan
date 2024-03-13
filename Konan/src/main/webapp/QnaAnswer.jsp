<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="/Konan/css/Default2.css">
    <link rel="stylesheet" href="/Konan/css/JsikRplyAfterDet.css">
    
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
                        <span>좋아요 </span><span>1</span>
                    </div>
                    <div class="btn-replies">
                        <span>답변 </span><span>25</span>
                    </div>
                </div>
            </div>
        </div>





        <!-- 답변 박스 -->

        <div class="post-replies-container">
            <div class="post-replies-text">
                <span style="font-weight: 700; font-size: 30px;">답변</span>
                <span style="font-weight: 700; font-size: 30px;">&nbsp;&nbsp;</span>
                <span style="font-weight: 700; font-size: 30px;">2</span>
            </div>
            <div class="answer-title-container">
                <div class="hashtags"><span>#채택답변</span> <span>#인기답변</span></div>
                <div class="answer-title"><span>A. 질문 수듄 뭥미</span></div>
                <div class="post-author"><span>작성자</span><span>도일남</span></div>
                <div class="post-date"><span>작성일자</span><span>2024.01.02</span></div>
            </div>
            <div class="answer-content-container">
                <div class="answer-content"><span>거울한테 물어보세요</span></div>

                <div class="det-profile-containerr">
                    <div class="det-profile-img-container">
                        <div class="det-profile-imgg"></div>
                    </div>
                    <div class="det-info">
                        <div class="det-tier"><span>명탐정</span></div>
                        <div class="det-name"><span>남도일</span>&nbsp;&nbsp;<span>코난 탐정 사무소</span></div>
                    </div>
                    <div class="answer-accepted-container">
                        <div class="answer-accepted"><span>채택 답변수</span>&nbsp;&nbsp;<span>54</span></div>
                    </div>
                </div>

                <div class="btn-likess"><span>좋아요</span>&nbsp;&nbsp;<span>15</span></div>

            </div>
        </div>
    </div>


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