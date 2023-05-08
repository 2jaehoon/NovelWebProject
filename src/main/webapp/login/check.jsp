<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
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
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />	
<noscript data-n-css=""></noscript>
<style
	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

$(function(){
	$("#idBtn").click(function(){
		 $("[name='idChkFrm']").submit(); 
 	});
	
});
</script>



</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

if("".equals(id)||"".equals(pw)){
	%>
	<script type="text/javascript">
	alert("아이디/비번을 입력해주세요.")
	</script>
	
	<%
}
%>

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
<style type="text/css">
#wrap{ width: 1300px;height: 700px;margin: 0px auto;}


#container{width:1300px; height: 600px; position: relative;display: flex;justify-content: center;align-items: center;}
#frame{width: 500px;height: 400px;display: flex;justify-content: center;position: absolute; bottom: 0px; border-radius: 30px;background-color: #E0E0E0;}
#text_id{width: 400px;height: 50px;position: absolute; bottom: 450px;text-align: center;}
#text1{width: 70%;position: absolute; top: 50px;font-size: 20px;font-weight: bold;line-height: 1.3;}
#text2{width: 70%;position: absolute;top: 130px;font-size: 15px;line-height: 1.3;}
#nametext{width: 70%;position: absolute;top: 180px; font-size: 13px;font-weight: bold;}
#input_name{width: 70%;position: absolute;top: 200px;}
#phonetext{width: 70%;position: absolute;top: 250px; font-size: 13px;font-weight: bold;}
#input_phone{width: 70%;position: absolute;top: 270px;}

#buttonId{width: 1300px; height: 40px;position: absolute; bottom: 30px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 10px; margin-right: 10px;}

    </style>
    <div id="wrap">

        
        
<form action="/novelWebProject/login/check.jsp"  name="idChkFrm" method="get">
       <div id="container">
           <div id="frame">
            <div id="text_id" style="font-size: 50px; font-weight: bold;">본인 확인</div>
            <div id="text1">소설조아 계정의<br>
                개인정보를 수정합니다</div>
            <div id="text2">본인확인을 위해<br>
                아이디와 비밀번호를 입력해주세요</div>
                <div id="nametext">아이디</div>
                <div id="input_name"><input type="text"style="width:340px;height:20px;" name="id"></div>
                <div id="phonetext">비밀번호</div>
                <div id="input_phone"><input type="password"style="width:340px;height:20px;" name="pw"></div>
                <div id="buttonId">
                    <input type="button"class="button" value="확인" id="idBtn">
                    <input type="button"class="button" value="취소"  onclick="window.location.href='/novelWebProject/home/main(login).jsp'">
                </div>
            </div>
           </div>
    </form>
    </div>
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>

</body>
</html>