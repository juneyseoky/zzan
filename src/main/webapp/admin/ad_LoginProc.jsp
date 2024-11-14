<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="admin" class="pkg.dto.adminBean"/>
<jsp:useBean id="dao" class="pkg.dao.adminDAO"/>
<script>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
boolean chk = dao.selectAdmin(id, pw);

%>

<%
if(chk){%>
	location.href = "/admin/adminPage.jsp";
<%}else{%>
	alert("비밀번호가 틀렸습니다.");
	history.back();
<%}%>
</script>