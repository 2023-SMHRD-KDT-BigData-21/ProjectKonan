<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/Konan/css/Default2.css">
    <link rel="stylesheet" href="/Konan/css/QnaForm.css">
</head>
<body>
    <div class="container">
        <!-- 게시글 작성 -->
        <div class="post-container">
            <form action="#" method="post" enctype="multipart/form-data">
                <div class="post-pre-title"><span>글 작성</span></div>
                <div class="post-title-container">
                    <input type="text" class="post-title" placeholder="제목입력" name="title" required>
                    <textarea class="post-content" placeholder="본문입력" name="content" required></textarea>
                </div>
                <div class="add-photo-container">
                    <div class="add-photo-text"><span>사진추가</span></div>
                    <div class="add-photo-img-container">
                        <label for="photo">
                            <div class="add-photo-img"></div>
                        </label>
                        <label for="photo">
                            <div class="add-photo-img"></div>
                        </label>
                        <label for="photo">
                            <div class="add-photo-img"></div>
                        </label>
                        <label for="photo">
                            <div class="add-photo-img"></div>
                        </label>
                        <label for="photo">
                            <div class="add-photo-img"></div>
                        </label>
                    </div>
                    <input type="file" id="photo" name="photo" accept="image/*" multiple style="display: none;">
                </div>
                <div class="btn-delete">
                    <button type="submit">
                        <span>삭제하기</span>
                    </button>
                </div>
                <div class="btn-post">
                    <button type="submit">
                        <span>게시하기</span>
                    </button>
                </div>
                
            </form>
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