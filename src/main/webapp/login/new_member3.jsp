<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" style="height: 750px;">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
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
	<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>
<style
	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">

</style>
<style type="text/css">
#wrap{ width: 1300px;height: 1200px;margin: 0px auto;}

#container{width:1300px; height: 800px; position: relative;display: flex;justify-content: center;align-items: center;top: 100px;}
#frame{width: 1300px;height: 400px;display: flex;justify-content: center;position: absolute; bottom: 200px;}
#text_new{width: 200px;height: 50px;position: absolute; bottom: 550px;text-align: center;}
#img{width: 400px; height: 150px; position: absolute;bottom: 550px ;background: url(\\211.63.89.130\sharing\07.프로젝트\2차\3조\_next\static\images\1/complete.PNG);background-size : 100% 100%;}
#square{width: 400px; height: 250px; background-color: #E0E0E0; position: absolute;bottom: 200px; display: flex;justify-content: center;align-items: center;
font-size: 25px; font-weight: bold; text-align: center;line-height: 2;}


#buttonId{width: 300px; height: 40px;position: absolute; top: 300px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 20px;  background-color: #808080;}


</style>
</head>
<body>
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
			
<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_logout_key.jsp"/> 
	</div>
	
    <div id="wrap">

       <div id="container">
           <div id="frame">
            <div id="text_new" style="font-size: 50px; font-weight: bold;">회원가입</div>
            <div id="img"></div>
            <div id="square">정말 반갑습니다<br>
                이 세상에 모든<br>
                재미와 감동을 담은<br>
                소설조아에 오신 것을 <br>
                진심으로 환영합니다<br>
                </div>

            <div id="buttonId">
                <input type="button"class="button" value="확인" onclick="window.location.href='loginpage.jsp'" style='cursor:pointer'>
            </div>
           </div>
       </div>


    </div>
</div>
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>
			</div>
		</div>
		<div id="modal-normal"></div>
</body>
</html>