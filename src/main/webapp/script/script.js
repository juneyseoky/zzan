$(function() {
	$("ul#mainMenu>li").hover(
		function() {
			$(this).children(".subMenus").stop().slideDown("fast");
		},
		function() {
			$(this).children(".subMenus").stop().slideUp("fast");
		}
	);

	$("ul.subMenus>li").click(function() {
		let pageType = $(this).attr("id");
		let folderName =  $(this).parent().parent().attr("class");
		let path = "/"+folderName+"/"+folderName+".jsp?pageType="+pageType;
		location.href = path;
	});
	
	$("#loginBtn").click(function(){
		location.href = "/member/Login.jsp";
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