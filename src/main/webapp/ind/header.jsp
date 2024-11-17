<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String uId_Session = (String) session.getAttribute("userId");
%>
<header id="header">
	<div id="h_top" class="dFlex">
		<div id="searchArea">
			<input type="text" id="searchKey" name="search">
			<button>검색</button>
		</div>
		<a href="/index.jsp"><img alt="Logo"
			src="/images/Logo-removebg.png"></a>
		<div id="btnArea">
			<button>장바구니</button>
			<%if(uId_Session != null){ %>
			<button id="myPageBtn">마이페이지</button>
			<button id="logoutBtn">로그아웃</button>
			<%}else{ %>
			<button id="memRegBtn">회원가입</button>
			<button id="loginBtn">로그인</button>
			<%}%>
		</div>
	</div>
	<div id="h_bottom" class="dFlex">
		<div id="mainMenus">
			<ul id="mainMenu" class="dFlex">
				 <!-- 기존의 '위스키' 메뉴 항목 -->
                <li><a href="../showcase/Whiskey_productList.jsp">위스키</a>
                    <ul class="subMenus">
                        <li>임페리얼</li>
                        <li>패스포트</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '와인' 메뉴 항목 -->
                <li><a href="../showcase/Wine_productList.jsp">와인</a>
                    <ul class="subMenus">
                        <li>무똥까네</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '보드카' 메뉴 항목 -->
                <li><a href="../showcase/Vodka_productList.jsp">보드카</a>
                    <ul class="subMenus">
                        <li>앱솔루트</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '전통주' 메뉴 항목 -->
                <li><a href="../showcase/traditional_productList.jsp">전통주</a>
                    <ul class="subMenus">
                        <li>고운달</li>
                        <li>문배</li>
                    </ul>
                </li>
				<li id="board" class="bbs">게시판
					<ul class="subMenus">
						<li id="notice">공지사항</li>
						<li id="bbs">문의사항</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</header>
