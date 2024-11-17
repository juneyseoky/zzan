$(function() {
	setInterval(fnSlide, 2000);
  

	function fnSlide() {
		$("div#slideshow>img").eq(0).fadeOut(
		  1000, 
		  function() {
		    $("div#slideshow>img:first-child").insertAfter("div#slideshow>img:last-child");
			$("div#slideshow>img").eq(1).fadeIn(1200);
		  }
		);
	}

	$("ul#mainMenu>li").hover(
		function() {
			$(this).children(".subMenus").stop().slideDown("fast");
		},
		function() {
			$(this).children(".subMenus").stop().slideUp("fast");
		}
	);
	
	$("li").click(function(){
		let attrId = $(this).attr("class");
		location.href = "/showcase/productList.jsp?productType="+attrId;
	});
	

	$("ul.subMenus>li").click(function() {
		let pageType = $(this).attr("id");
		let folderName =  $(this).parent().parent().attr("class");
		let path = "/"+folderName+"/"+folderName+".jsp?pageType="+pageType;
		location.href = path;
	});
	$("#cart").click(function(){
		location.href = "/cart/shoppingBasket.jsp";
	});
	$("#loginBtn").click(function(){
		location.href = "/member/Login.jsp";
	});
	$("#memRegBtn").click(function(){
		location.href = "/member/join/member_join.jsp";
	});

	
	$("#regBtn").click(function(){
		let subject = $("#subject").val().trim();		
		
		 if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {
			$("#writeFrm").attr("action", "/bbs/writeProc.jsp");
			$("#writeFrm").submit();
		}
	
	});
	
	$("#logoutBtn").click(function(){
		location.href = "/member/LogoutProc.jsp";
	});
});


function goAdmin() {
	location.href = "/admin/adminLogin.jsp";
}

function read(idx){
	location.href = "/bbs/read.jsp?idx="+idx;

}