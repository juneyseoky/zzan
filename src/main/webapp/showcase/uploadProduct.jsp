<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.util.UUID"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="Only_showcase.pack.DBUtill"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파일 업로드 결과페이지</title>
<link rel="stylesheet"
	href="/showcase/style/style_showcase.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<div id="wrap">
		<h1>파일 처리 페이지</h1>
		<br>
		<hr>
		<br>
		<%
		String fileStorage = application.getRealPath("/") + "images/";
		int maxSize = 10 * 1024 * 1024; // 최대 파일 크기 10MB
		String encType = "UTF-8";
		MultipartRequest multiReq = null;
		String category = "";

		try {
			multiReq = new MultipartRequest(request, fileStorage, maxSize, encType, new DefaultFileRenamePolicy());

			String productName = multiReq.getParameter("productName");
			String price = multiReq.getParameter("price");
			String description = multiReq.getParameter("description");
			category = multiReq.getParameter("category"); // 추가된 필드
			String oriFileName = multiReq.getOriginalFileName("image");
			String upFileName = UUID.randomUUID().toString() + "_" + oriFileName; // 고유한 파일 이름 생성
			String filePath = fileStorage + upFileName;
			File objFile = new File(filePath);
			multiReq.getFile("image").renameTo(objFile);
			long fileSize = (objFile != null) ? objFile.length() : 0;

			// 디버깅을 위해 로그 출력
			System.out.println("Product Name: " + productName);
			System.out.println("Price: " + price);
			System.out.println("Description: " + description);
			System.out.println("Original File Name: " + oriFileName);
			System.out.println("Uploaded File Name: " + upFileName);
			System.out.println("File Size: " + fileSize);
			System.out.println("Category: " + category); // 추가된 필드

			// DB에 저장
			Connection conn = null;
			PreparedStatement pstmt = null;
			boolean isSaved = false;

			try {
				conn = DBUtill.getConnection();
				String sql = "INSERT INTO product ";
				sql += "(subject, original_filename, stored_filename, ";
				sql += "file_size, content, price, category) VALUES ";
				sql += "(?, ?, ?, ?, ?, ?, ?)"; // 테이블명을 'product'로 변경
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productName);
				pstmt.setString(2, oriFileName);
				pstmt.setString(3, upFileName);
				pstmt.setLong(4, fileSize);
				pstmt.setString(5, description);
				pstmt.setString(6, price); // 가격 필드 추가
				pstmt.setString(7, category); // 카테고리 필드 추가
				pstmt.executeUpdate();
				isSaved = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtill.closePreparedStatement(pstmt);
				DBUtill.closeConnection(conn);
			}

			//             if (isSaved) {
			//                 out.println("<p><strong>상품명:</strong> " + productName + "</p>");
			//                 out.println("<p><strong>가격:</strong> " + price + "</p>");
			//                 out.println("<p><strong>설명:</strong> " + description + "</p>");
			//                 out.println("<p><strong>원본 파일명:</strong> " + oriFileName + "</p>");
			//                 out.println("<p><strong>서버 저장 파일명:</strong> " + upFileName + "</p>");
			//                 out.println("<p><strong>파일 크기:</strong> " + fileSize + " Byte(s)</p>");
			//                 out.println("<p><strong>카테고리:</strong> " + category + "</p>"); // 카테고리 필드 추가
			//                 out.println("<p>파일 업로드 및 데이터 저장 성공!</p>");

			//                 // 다운로드, 목록 페이지로 이동, 입력 페이지로 이동 버튼 추가
			//                 out.println("<br><hr><br><button id='downloadBtn' type='button'>테스트용으로 둔 다운로드</button>");
			//                 out.println("<button type='button' onclick='location.href=\"Whiskey_productList.jsp\"'>위스키 목록 페이지로 이동</button>");
			//                 out.println("<button type='button' onclick='location.href=\"Wine_productList.jsp\"'>와인 목록 페이지로 이동</button>");
			//                 out.println("<button type='button' onclick='location.href=\"register.jsp\"'>입력 페이지로 이동</button>");
			//                 // 다운로드에 필요한 파일 이름 필드 추가
			//                 out.println("<input type='hidden' id='upFileName' value='" + upFileName + "'>");
			//             } else {
			//                 out.println("<p>파일 업로드는 성공했지만, 데이터베이스에 저장 중 오류가 발생했습니다.</p>");
			//             }

		} catch (Exception e) {
			out.println("<p>파일 업로드 중 오류 발생: " + e.getMessage() + "</p>");
			e.printStackTrace(); // 콘솔에 전체 스택 추적 출력
		}
		%>
		<br>
	</div>
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script>
		$(function() {
			$("#downloadBtn").click(function() {
				let fName = $("#upFileName").val();
				location.href = "images/wisky/" + fName; // 경로 수정
			});
			alert("등록되었습니다.");
			location.href = "productList.jsp?productType=" +"<%=category%>";
	<%=category%>
		;
		});
	</script>
</body>
</html>
