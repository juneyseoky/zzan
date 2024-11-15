<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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