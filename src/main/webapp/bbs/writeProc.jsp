<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<jsp:useBean id="dao" class="pkg.dao.bbsDAO"/>
<%
request.setCharacterEncoding("UTF-8");
boolean reChk = dao.insertBBS(request);
%>
<script>
<%
if(reChk){%>
 	alert("글 등록이 완료되었습니다.");
 	location.href="/bbs/bbs.jsp?pageType=bbs";
<%}else{%>
	alert("실패했습니다.");
	history.back();
<%}%>
</script>
=======
<%
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
>>>>>>> refs/remotes/origin/k-seon
