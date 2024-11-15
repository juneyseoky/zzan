<%@page import="java.sql.Timestamp"%>
<%@page import="pkg.dto.bbsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="bbs" class="pkg.dao.bbsDAO" />
<!DOCTYPE  html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,  initial-scale=1.0">
<title>문의사항 목록</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_Template.css">
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_BBS.js"></script>
</head>
<body>
	<div id="wrap">
		<%@  include file="/ind/header.jsp"%>
		<main id="main" class="dFlex">
			<div id="contents" class="bbsList">
				<h1>공지사항</h1>
				<div id="pageInfo" class="dFlex">
					<span> 개</span> <span>페이지 : </span>
				</div>
				<table id="boardList">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>이름</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<tr>
							<td colspan="5" class="spaceTd"></td>
						</tr>
					</thead>
					<tbody>
<%
List<bbsBean> bbsList = bbs.selectBBS();

for (int i = 0; i < bbsList.size(); i++) {
	  bbsBean bean = bbsList.get(i);
	  int bNum = bean.getbNum();
	  String bTitle = bean.getbTitle();
	  String bMemId = bean.getbMemId();
	  Timestamp regTM = bean.getbRegTM();
%>
						<tr class="prnTr">
							<td><%=bNum%></td>
							<td class="subjectTd"><%=bTitle %></td>
							<td><%=bMemId %></td>
							<td><%=regTM %></td>
							<td>0</td>
						</tr>
<%
}
%>
						<tr id="listBtnArea">
							<td colspan="2">
								<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>
		<%@  include file="/ind/footer.jsp"%>
	</div>
</body>
</html>
