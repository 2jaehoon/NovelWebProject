<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>메인-로그인 | 소설조아</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet"	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>

</head>
<body>
	<div id="__next" data-reactroot="">
		<div style="display: none; background-color: canvas; color-scheme: light"></div>
	<div class="lightMode h-full">
	<div class="flex flex-col h-full">
			
	<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_logout_key.jsp"/>
	</div>
	
	<main class="flex-1">
	<br><br><br><br><br><br>
		<div style="text-align: center;">
			<h1 style="font-size: 30px">에러가 발생했습니다. </h1><br>
			<a href="javascript:history.back();" ><font style="color: #0000FF">다시 시도해주세요</font></a>
		</div>
    </main>
     
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div> 
	
	</div>
	</div>
	</div>
	
</body>
</html>

