<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" style="height: 800px;">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>

<style type="text/css">
#wrap{ width: 600px;height: 800px;margin: 0px auto;border: 1px solid; }
#title{position: absolute;width:100%;height: 200px;background:#FFFFFF url(\\211.63.89.130\sharing\07.프로젝트\2차\3조\_next\static\images\1/header.PNG);background-size : 100% 100%;}

#container{width:600px; height: 400px; position: relative;display: flex;justify-content: center;align-items: center;top:300px;left:0px}
#frame{width: 500px;height: 450px;display: flex;justify-content: center;position: absolute; top: -50px; left: 50px;border-radius: 30px;background-color: #E0E0E0;}
#text_pass{width: 400px;height: 50px;position: absolute; bottom: 550px;text-align: center;}
#text1{width: 70%;position: absolute; top: 50px;font-size: 20px;font-weight: bold;line-height: 1.3;}
#text2{width: 70%;position: absolute;top: 130px;font-size: 15px;line-height: 1.3;}
#idtext{width: 70%;position: absolute;top: 210px; font-size: 13px;font-weight: bold; left: 80px}
#input_id{width: 70%;position: absolute;top: 230px; left: 80px}
#phonetext{width: 70%;position: absolute;top: 270px; font-size: 13px;font-weight: bold; left: 80px}
#input_phone{width: 70%;position: absolute;top: 290px; left: 80px}
#emailtext{width: 70%;position: absolute;top: 330px; font-size: 13px;font-weight: bold; left: 80px}
#input_email{width: 70%;position: absolute;top: 350px; left: 80px}

#buttonId{width: 300px; height: 40px;position: absolute; top: 350px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 10px;margin-right: 10px;}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			
			var id = $("#id").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			
			if(id==""||phone==""||email==""){
				alert("빈칸을 모두 채워주세요.");
			} else{
				$("#frm").submit();
			}  
		});
	});
	
</script>
</head>
<body style="height: 700px">
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
    <div id="wrap" style="border: 0px">

       <div id="container">
           <div id="frame">
            <div id="text_pass" style="font-size: 50px; font-weight: bold;">비밀번호 분실</div>
            <div id="text1">소설조아 계정의<br>
                비밀번호를 재설정합니다</div>
            <div id="text2">본인확인을 위해<br>
                아이디와 전화번호, 이메일을 입력해주세요</div>
                <form action="password_issued_dao.jsp" method="post" id="frm" name="frm">
                <div id="idtext">아이디</div>
                <div id="input_id">
                <input type="text"style="width:340px;height:20px;" id="id" name="id"></div>
                <div id="phonetext">전화번호(-없이 입력)</div>
                <div id="input_phone">
                <input type="text"style="width:340px;height:20px;" id="phone" name="phone"></div>
                <div id="emailtext">계정 이메일</div>
                <div id="input_email">
                <input type="text"style="width:340px;height:20px;" id="email" name="email"></div>
                </form>
                </div>
            <div id="buttonId">
                <input type="button"class="button" value="확인" id="btn" style='cursor:pointer'>
                <input type="button"class="button" value="취소" onclick="window.close()" style='cursor:pointer'>
            </div>
           </div>
       </div>
    </div>

			</div>
		</div>
		<div id="modal-normal"></div>
	</div>
</body>
</html>