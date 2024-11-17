<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Only_showcase.pack.DBUtill" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Only_showcase.pack.Product" %>

<%
    List<Product> productList = new ArrayList<>();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DBUtill.getConnection(); // DB 연결
        String sql = "SELECT subject, price, content, stored_filename FROM uploaded_files WHERE category = 'vodka'"; // 보드카만 선택
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            Product product = new Product();
            product.setProductName(rs.getString("subject")); // 상품명
            product.setPrice(rs.getString("price")); // 가격
            product.setDescription(rs.getString("content")); // 설명
            product.setImagePath("../images/vodka/" + rs.getString("stored_filename")); // 이미지 경로 수정
            productList.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        DBUtill.closePreparedStatement(pstmt);
        DBUtill.closeConnection(conn);
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>보드카 목록</title>
    <link rel="stylesheet" href="style/style_showcase.css?v=<%= System.currentTimeMillis() %>"> <!-- 기존 스타일 -->
    <link rel="stylesheet" href="/style/style.css"> <!-- header 스타일 -->
</head>
<body>
    <div id="wrap">
        <jsp:include page="/ind/header.jsp" /> <!-- 헤더 추가 -->
        <div class="main-image-container">
            <img src="../images/bodca/main.jpg" alt="대문 이미지" class="main-image">
        </div>
        <h1>보드카 제품 목록</h1>
        <hr>
        <div id="productList">
            <%
            if (!productList.isEmpty()) {
                for (Product product : productList) {
            %>
            <div class="product">
                <div class="product-image">
                  <img src="<%= product.getImagePath() %>" alt="제품 이미지" class="product-image"> <!-- 이미지 경로 수정 -->
                </div>
                <div class="product-info">
                    <p class="product-name">상품명: <%= product.getProductName() %></p>
                    <p class="product-price">가격: <%= product.getPrice() %> 원</p>
                    <p class="product-description">설명: <%= product.getDescription() %></p>
                </div>
                <button type="button" class="delete-btn" onclick="deleteProduct('<%= product.getImagePath() %>', '<%= product.getProductName() %>')">삭제</button>
            </div>
            <% 
                }
            } else {
            %>
            <p class="no-products">등록된 상품이 없습니다.</p>
            <% 
            } 
            %>
        </div>
        <div id="btnArea">
            <button type="button" onclick="location.href='register.jsp'">상품 등록</button>
            <button type="button" class="home-btn" onclick="location.href='../index.jsp'">홈으로 돌아가기</button>
        </div>
        <!-- 푸터 추가 -->
        <footer id="footer" class="dFlex">
            <div id="LogoArea">
                <img src="/images/Logo.jpg" alt="Logo">
            </div>
            <div id="footerTxtArea">
                <span>lasdfasdfasdfasdfasdfasdfasdfasdfasdf</span>
            </div>
            <div id="adminArea">
                <a href="#"><img alt="" src="/images/goAdmin_200.jpg"></a>
            </div>
        </footer>
    </div>
    <script src="script/jquery-3.7.1.min.js"></script>
    <script>
        function deleteProduct(imagePath, productName) {
            if (confirm("정말로 이 제품을 삭제하시겠습니까?")) {
                location.href = 'deleteFile.jsp?fileName=' + encodeURIComponent(imagePath) + '&productName=' + encodeURIComponent(productName);
            }
        }
    </script>
</body>
</html>
