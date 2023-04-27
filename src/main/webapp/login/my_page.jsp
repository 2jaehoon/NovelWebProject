<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=session.getAttribute("user_id").toString();
%>
<!DOCTYPE html>
<html lang="ko" style="height: 1000px;">
<head>
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com"
	crossorigin="anonymous" />
<link rel="stylesheet"
	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"
	as="style" />
<link rel="stylesheet"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"
	data-n-g="" />
<link rel="preload"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"
	as="style" />
<link rel="stylesheet"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"
	data-n-p="" />
<link rel="stylesheet" type="text/css" href="/project2/_next/static/css/login.css" />
</head>
<body>
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
			
<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_login_search.jsp"/> 
	</div>
	
</style>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href=/html_prj/common/main_v20230217.css">
<style type="text/css">
#wrap{ width: 1300px;height: 1200px;margin: 0px auto;}

#container{width:1300px; height: 800px; position: relative;display: flex;justify-content: center;align-items: center; top: 100px;}
#frame{width: 1100px;height: 700px;display: flex;position: absolute;justify-content: center;position: absolute;background-color: #E0E0E0;border-radius: 200px;}
#text_mypage{position: absolute;left: 100px;top: 60px;font-size: 30px; font-weight: bold;}
#img_change{position: absolute;top:55px;left:355px}
#text_logout{position: absolute;left: 100px;top: 90px;font-size: 15px;}
#img_profile{position: absolute;top: 170px}
#input_name{position: absolute; top: 320px}
.name{width: 200px; height: 30px;text-align: center; font-size: 20px;font-weight: bold;}
#input_button1{position: absolute; top:420px;left: 100px;}
#input_button2{position: absolute; top:420px;right: 100px;}
.button{width: 400px; height: 170px;text-align: left; font-size: 20px; font-weight: bold;background-color: #C0FAF8; border-radius: 30px;}


</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");
%>
$(function(){
	$("#logout").click(function(){
		 $.ajax({
		      url: "logout.jsp",
		      success: function(){
		        alert("로그아웃 되었습니다.");
		        window.location.href = "loginpage.jsp";
		      }
		    });
	});	
	$("#profile").click(function(){
		window.location.href="info.jsp";
	});
	$("#myNovel").click(function(){
		$("#frm_myNovel").submit();
		//window.location.href="../novel/my_novel_space.jsp?order_novel=0";
	});
	$("#like").click(function(){
		$("#frm_like").submit();
		//window.location.href="like.jsp?search=";
	});
	
	$("#imgpf").click(function(){
		$("#file").click();
	});
	
	$("#file").change(function(event){
		let blockExt = ["git","png","jpg","bmp"];
		let blockFlag = false;
		let fileName = $("#file").val();
		let ext = fileName.substring(file.lastIndexOf(".")+1);
		
		for(let i=0; i < blockExt.length; i++){
			if(blockExt[i]==ext){
				blockFlag = false;
				break;
			}
		}
		
		if(!blockFlag){
			alert("이미지파일만 업로드 가능합니다");
			return;
		}else{
			let file = event.target.file[0];
			
			let reader = new FileReader();
			reader.onload = function(e){
				$("imgpf").attr("src",e.target.result);
			}
			
			reader.readAsDataURL(file);
			$("#frm").submit();
		}
	});
	
});


</script>
           <form action = "my_page_profile.jsp" method="post" enctype="multipart/form-data" id="frm" name="frm">
    <div id="wrap">


       <div id="container">
           <div id="frame">
            <div id="text_mypage"><%=session.getAttribute("user_id") %>님의 마이페이지</div>
            <div id="img_change"><img src="../_next/static/images/mypage.PNG" id="profile"></div>
            <div id="text_logout"><a href="#void" id="logout">로그아웃</a></div>
            <div id="img_profile"><img src="../_next/static/images/profile_images/profile.PNG" class="profile"  id="imgpf" name="imgpf"/>
            <input type="file" id="file" name="file" style="display:none" /></div>
            
            <div id="input_name"><input type="text" readonly value="<%=session.getAttribute("user_name") %>님" class="name"></div>
            <div id="input_button1"><input type="button"class="button" id="myNovel" value=" 내 소설"></div>
            <div id="input_button2"><input type="button"class="button" id="like" value=" 좋아요"></div>
            
			<form action="../novel/my_novel_space.jsp" id="frm_myNovel" method="post"><input type="hidden" name="order_novel" value="0"></form>
			<form action="like.jsp" id="frm_like" method="post"><input type="hidden" name="search"></form>
			
           </div>
       </div>

        </div>
		</form>
    </div>
</div>
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>
			</div>
		</div>
		<div id="modal-normal"></div>
	</div>
</body>
</html>