<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #images_container{
            width: 200px;
        }
    </style>
</head>

<body>
    <div class="form-group"> <!-- 이미지 한 개 등록 -->
        <input class="form-control form-control-user" type="file" name="product_image" id="product_image"
            onchange="setThumbnail(event);">
    </div>
    <div id="image_container"></div>

    <div class="form-group"> <!-- 이미지 여러 개 등록 -->
        <input class="form-control form-control-user" type="file" multiple="multiple" name="product_detail_image"
            id="product_detail_image" onchange="setDetailImage(event);">
    </div>
    <div id="images_container"></div>




    <script>
        /* 이미지  한개 미리보기 */
        function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function (event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                document.querySelector("div#image_container").appendChild(img);
            };

            reader.readAsDataURL(event.target.files[0]);
        }

        /* 이미지  여러개 미리보기 */
        function setDetailImage(event) {
            for (var image of event.target.files) {
                var reader = new FileReader();

                reader.onload = function (event) {
                    var img = document.createElement("img");
                    img.setAttribute("src", event.target.result);
                    img.setAttribute("class", "col-lg-6");
                    document.querySelector("div#images_container").appendChild(img);
                };

                console.log(image);
                reader.readAsDataURL(image);
            }
        }
    </script>
</body>

</html>