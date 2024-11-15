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
		let id = $(this).attr("id");
		let folderName =  $(this).parent().parent().attr("class");
		let path = "/"+folderName+"/"+id+"List.jsp";
		location.href = path;
	});
	
	$("#writeBtn").click(function(){
		location.href = "/bbs/write.jsp";
	});
	
	$("#regBtn").click(function(){
		loaction.href = "/bbs/writeProc.jsp"
	});
});


function goAdmin() {
	location.href = "/admin/adminLogin.jsp";
}