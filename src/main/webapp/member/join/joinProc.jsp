<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDto" class="pkg.dto.MemberDTO"/>
<jsp:useBean id="dao" class="pkg.dao.MemberDAO"/>
<%
String id = request.getParameter("mId");
String pw = request.getParameter("mPw");
String name = request.getParameter("mName");
String email = request.getParameter("mEmail") +"@"+ request.getParameter("mEmail2");
String birthday = request.getParameter("mBirthday");
String phone = request.getParameter("mPhone");
String addr = request.getParameter("mAddr");
memberDto.setmId(id);
memberDto.setmPw(pw);
memberDto.setmName(name);
memberDto.setmEmail(email);
memberDto.setmBirthday(birthday);
memberDto.setmPhone(phone);
memberDto.setmAddr(addr);

boolean reChk = dao.insertMember(memberDto);
%>
<script>
if(<%=reChk%>){
	alert("가입되었습니다.");
	location.href = "/member/Login.jsp";
}else{
	alert("실패");
	history.back();
}
</script>