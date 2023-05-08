<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>

<!DOCTYPE html>
<html lang="ko"style="height: 750px;">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet"	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/html_prj/common/main_v20230217.css">
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />

<title>Insert title here</title>
<style type="text/css">
#wrap{ width: 600px;height: 500px;margin: 0px auto;}

#container{width:600px; height: 500px; position: relative;display: flex;justify-content: center;align-items: center;top: 250px;}
#frame{width: 500px;height: 300px;display: flex;justify-content: center;position: absolute; bottom: 200px; border-radius: 30px;background-color: #E0E0E0;}
#text_pass{width: 500px;height: 50px;position: absolute; bottom: 350px;text-align: center;}
#text1{width: 70%;position: absolute;top: 90px; font-size: 17px;font-weight: bold;text-align: center;}
#input_pass{width: 70%;position: absolute;top: 120px;}
#text2{width: 70%;position: absolute;top: 160px; font-size: 17px;font-weight: bold;text-align: center;}

#buttonId{width: 1300px; height: 40px;position: absolute; top: 230px;display: flex;justify-content: center;}
.button{width:300px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;}

</style>

</script>
<%
String id=(String)request.getAttribute("id");
%>
</head>
<body>
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
<%-- 				<jsp:include page="../_next/header_logout.jsp"/> --%>
    <div id="wrap">


       <div id="container">
           <div id="frame">
            <div id="text_pass" style="font-size: 50px; font-weight: bold;">아이디 찾기</div>
                <div id="text1">고객님의 계정은</div>
                <div id="input_pass"><input type="text"style="width:340px;height:20px;" value="<%=id %>" disabled="disabled"></div>
                <div id="text2">입니다</div>
                </div>
            <div id="buttonId">
                <input type="button"class="button" value="로그인" onclick="window.close()" style='cursor:pointer'>
            </div>

       </div>

    </div>

		<div id="modal-normal"></div>
</body>
</html>