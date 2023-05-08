<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet"href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>
<style type="text/css">
#wrap{ width: 1000px;height: 650px;margin: 0px auto;}
#header{height: 150px;position: relative;}
#container{height: 500px;display: flex;justify-content: center;align-items: center;position: relative;}
#zoa{width: 200px; height: 70px; position: absolute;bottom: 420px;
    background:#FFFFFF url(\\211.63.89.130\sharing\07.프로젝트\2차\3조\_next\static\images\1/zoa.PNG);background-size : 100% 100%;}
#loginId{width: 50%;height: 70%;position: relative;display: flex;justify-content: center;border: 1px solid;}
#login_table{width: 70%; height: 100px;position: absolute; top: 60px;}
#chb{position: absolute; width: 100px;height: 30px;top:170px;right:325px;}
#loginButton{position: absolute;width:70%; top:230px;}
#newmember{position: absolute; top: 290px;right: 375px;}
#idpass{position: absolute; top: 290px;left: 280px;}
.input_id{width: 100%; height: 30px; border-radius: 3px; background-color: #e8f0fe;border-left-width:0;
    border: none;border-bottom: 1px solid #CCC;}
.input_pass{width: 100%; height: 30px; border-radius: 3px;background-color: #e8f0fe;
    border: none;border-bottom: 1px solid #CCC;}
.input_button{width:100%; height:50px; border-radius: 10px; background-color: #808080;}
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
function idsearch_pop(){ // 아이디 찾기 popup
	window.open("id_search.jsp","아이디 찾기","height=750px,width=650px,top= 300px, left=500px");
}
function password_pop(){//임시비밀번호 발급 popup
	window.open("password_issued.jsp","임시비밀번호 발급","height=750px,width=650px,top= 300px, left=500px");
}
$(function(){	
$("#loginBtn").click(function(){
	let id = $("#id").val();
	let pw = $("#pw").val();
	
	if(id=="" || pw ==""){
		alert("아이디/비밀번호를 적어주세요");
	}else{
		$("#frm").submit();
	}
});

$(document).keypress(function(event) { //엔터를 누르면 로그인 버튼이 눌려진다
    if (event.which == 13) {
        event.preventDefault();
        $("#loginBtn").click();
    }
});
});
</script>


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
	
    <div id="wrap">
        <div id="header">

        </div>
        <form action="login_dao.jsp" name="frm" id="frm" method="post" >
        <div id="container">
            <div id="zoa" style="font-size: 40px; font-weight: bold; text-align: center;">소설조아</div>
            <div id="loginId">
                <table id="login_table">
                    <tr height="10px">
              <td><input type="text" class="input_id"placeholder="아이디" id="id" name="id"></td>
              </tr>
              <tr height="10px">
               <td><input type="password" class="input_pass"placeholder="비밀번호" id="pw" name="pw" ></td>
               </tr>
               </table>
               
               <div id="loginButton">
                <input type="button" class="input_button" id="loginBtn" value="로그인" style='cursor:pointer'>
               </div>
               <div id="newmember">
                <a href="#void" onclick="window.location.href='new_member.jsp'">회원가입</a>
              
               </div>
               <div id="idpass">
               
                <a href="#void"onclick="idsearch_pop()">아이디찾기</a> / 
                <a href="#void"onclick="password_pop()">비밀번호찾기</a>
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
</body>
</html>