<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="pkg.dto.bbsBean"/>
<jsp:useBean id="dao" class="pkg.dao.bbsDAO"/>
<jsp:useBean id="memDao" class="pkg.dao.memberDAO"/>
<%
String uId_Session =(String) session.getAttribute("userId");
String idx = request.getParameter("idx");
dao.selectContent(idx);
String title = dto.getTitle();
String content = dto.getContent();
String id = dto.getId();
String name = memDao.getMemberName(id);
Timestamp date = dto.getRegTM();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글내용 보기</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_Template.css">
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_BBS.js"></script>
</head>
<body>
	<div id="wrap">
		<!--  헤더템플릿 시작 -->
		<jsp:include page="/ind/header.jsp"/>
		<!--  헤더템플릿 끝 -->
		<main id="main" class="dFlex">
			
			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsRead">
				<!--  게시글 상세보기 페이지 내용 출력 시작 -->
				<h2><%=title%></h2>
				<table id="readTbl">
					<tbody id="readTblBody">
						<tr>
							<td>작성자</td>
							<td><%=name%></td>
							<td>등록일</td>
							<td><%=date%></td>
						</tr>
						
						<tr>
							<td colspan="4" id="readContentTd"><pre><%=content%></pre></td>
						</tr>
					</tbody>
					<tfoot id="readTblFoot">
						<tr>
							<td colspan="4" id="footTopSpace"></td>
						</tr>
						<tr>
							<td colspan="4" id="hrTd"><hr></td>
						</tr>
						<tr>
							
							<td colspan="4" id="btnAreaTd" class="read">
								
								<%if (uId_Session.equals(id) && uId_Session != null) { %>
								<button type="button" id="modBtn">수 정</button>
								<button type="button" id="delBtn">삭 제</button> 
								<% } %>
							</td>
						</tr>
					</tfoot>
				</table>
				
			</div>
			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->

		<!-- 푸터템플릿 시작 -->
		<jsp:include page="/ind/footer.jsp"/>
		<!-- 푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->
</body>
</html></html>