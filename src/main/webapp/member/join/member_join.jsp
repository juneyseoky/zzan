<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/style/style.css?v">
<link rel="stylesheet" href="/style/join.css?v">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 템플릿 포함 -->
        <%@ include file="/ind/header.jsp" %>
        <div class="join_area">
		    <form name="form" action="/" method="post" onsubmit="return validateForm()">
		        <h1>회원가입</h1>
		        <h2><span style="color:#ff0000;">*</span>회원정보</h2>
		        
		        <table class="sample-table">
		            <tbody>
		                <tr>
		                    <td class="title">이름</td>
		                    <td>
		                    <input type="text" name="mName" required></td>
		                </tr>
		                <tr>
		                    <td class="title">아이디</td>
		                    <td>
		                    <div class="input-container">
		                        <input class="textArea" type="text" name="mId maxlength="20"
		                        placeholder="대,소문자와 숫자만">
		                       <button class="textbtn" type="button" onclick="idDuplChk()">중복확인</button>
		                       </div>
		                    </td>
		                               
		                </tr>
		                <tr>
		                    <td class="title">비밀번호</td>
		                    <td>
		                        <input type="password" name="mPw">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="title">비밀번호 확인</td>
		                    <td>
		                        <input type="password" name="mPw2" placeholder="비밀번호를 한번 더 입력하세요.">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="title">이메일</td>
		                    <td>
		                    <div class="email-container">
		                        <input type="text" name="mEmail" >
		                        <i>@</i>  
		                        <select name="mEmail2">
		                            <option value="">선택</option>
		                            <option value="naver.com">naver.com</option>
		                            <option value="gmail.com">gmail.com</option>
		                            <option value="hanmail.net">hanmail.net</option>
		                        </select>
		                    </div>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="title">생년월일</td>
		                    <td><input type="date" name="mBirthday" ></td>
		                </tr>
		                <tr>
		                    <td class="title">휴대전화</td>
		                    <td>
		                        <input type="text" name="mPhone"
		                               placeholder="010-1234-5678">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="title">주소</td>
		                    <td>
		                        <input type="text" name="mAddr" maxlength="100" size="50">
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		        <div id="btn">
		            <button class="btnArea" type="submit">확인</button>
		            <button class="btnArea" type="reset">취소</button>
		        </div>
		    </form>
	    </div>
    </div>
    <script>
    	
    </script>
</body>
</html>