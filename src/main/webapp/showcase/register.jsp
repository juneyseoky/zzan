<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title> 상품 등록 페이지 </title>
    <link rel="stylesheet" href="style/style_showcase.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
    <div id="wrap">
        <h1>상품 등록</h1>
        <form action="uploadProduct.jsp" method="post" enctype="multipart/form-data">
            <label>
                <span>상품이미지</span>
                <input type="file" name="image">
            </label>
            <label>
                <span>상품명</span>
                <input type="text" name="productName">
            </label>
            <label>
                <span>가격</span>
                <input type="text" name="price">
            </label>
            <label>
                <span>상품설명</span>
                <textarea name="description"></textarea>
            </label>
            <hr>
            <div id="btnArea">
                <button type="submit">등록</button>
                <button type="reset">초기화</button>
                <button type="button" onclick="location.href='Whiskey_productList.jsp'">위스키 목록</button>
                <button type="button" onclick="location.href='Wine_productList.jsp'">와인 목록</button>
                <button type="button" onclick="location.href='Vodka_productList.jsp'">보드카 목록</button>
                <button type="button" onclick="location.href='traditional_productList.jsp'">전통주 목록</button>
            </div>
        </form>
    </div>
    <script src="script/jquery-3.7.1.min.js"></script>
    <script src="script/script.js"></script>
</body>
</html>
