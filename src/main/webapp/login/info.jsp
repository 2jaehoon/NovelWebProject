<%@page import="LoginVO.InfoVO"%>
<%@page import="LoginDAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko"style="height: 750px;">
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

<style type="text/css">
#wrap{ width: 1300px;height: 1200px;margin: 0px auto;}

#container{width:1300px; height: 700px; position: relative;display: flex;justify-content: center;align-items: center;top: 150px;}
#frame{width: 1300px;height: 400px;display: flex;justify-content: center;position: absolute; bottom: 100px;}
#text_change{width: 400px;height: 50px;position: absolute; bottom: 600px;text-align: center;}
table{border : 1px solid black;border-collapse : collapse;position: absolute; bottom: 200px;}
td,tr{border : 1px solid black;}
.td1{font-size: 15px;font-weight: bold;}
input{width: 150px;height: 20px;border-radius: 3px; background-color: #e8f0fe;border-left-width:0;
    border: none;border-bottom: 2px solid #CCC;}

#buttonId{width: 300px; height: 40px;position: absolute; top: 300px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: #808080; border-radius: 10px;margin-left: 20px;}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
function popup(){
	window.open("sub.jsp","비밀번호변경","width=540, height=390, left=100, top=50");
}
function cancel(){
	location.href="my_page.jsp";
}

	$(function() {
		$("#email_select").change(function() {
			if ($(this).val() == "self") { //직접 입력시
				$("#email2").removeAttr("readonly").focus(); // input text 활성화
				$("#email2").val();

			} else {
				$("#email2").attr("readonly", true).val($(this).val());
			}
		});
		
		$("#phone").on("keyup", function() { // 전화번호에 숫자가 아닌 글자가 써졌을 때
			   if (!$.isNumeric($(this).val())) {
			alert("숫자만 써주세요.");
			    $(this).val($("#ogPhone").val());
			  } 
			}); 
		
		$("#change").click(function(){
			let phone = $("#phone").val();
			let email1 = $("#email1").val();
			let email2 = $("#email2").val();
			if(phone == null || email1 == "" || email2 == "" ){
				alert("정보를 모두 채워넣어 주세요.");
			}else{
				$("#frm").submit();
			}
		});
	});
</script>
<%
String id=(String)session.getAttribute("user_id");

LoginDAO lDAO = new LoginDAO();
InfoVO iVO = lDAO.selectInfo(id);
String phone = iVO.getPhone();

String[] email_part = iVO.getEmail().split("@");
String email1 = email_part[0];
String email2 = email_part[1];
%>
</head>
<body  style="height: 900px">
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_login_search.jsp"/> 
	</div>


       <form action="info_dao.jsp" method="post" id="frm">
    <div id="wrap">


       <div id="container">
           <div id="frame">
            <div id="text_change" style="font-size: 50px; font-weight: bold;">개인정보 변경</div>
            <table height="300px" border="1px solid" border-collapse : collapse;>
                <tr style="background-color: #E0E0E0;">
                    <td width="150px"align="center" class="td1">이름</td><td width="600px"><input type="text" placeholder="이름"readonly value="<%=iVO.getName()%>" id="id" readonly></td>
                </tr>
                <tr style="background-color: #E0E0E0;">
                    <td align="center"class="td1">아이디</td><td><input type="text" placeholder="아이디" value="<%=iVO.getId()%>" id="id" name="id" readonly></td>
                </tr>
                <tr style="background-color: #E0E0E0;">
                    <td align="center"class="td1">생년월일</td><td><input type="date" value="<%=iVO.getBirth()%>" readonly></td>
                </tr>
                <tr>
                    <td align="center"class="td1">전화번호</td><td><input type="text" value="<%=phone%>" id="phone" name="phone" placeholder="전화번호"><input type="hidden" value="<%=phone%>" id="ogPhone"></td>
                </tr>
                <tr>
                    <td align="center"class="td1">이메일</td><td><input type="text"  id="email1" name="email1" value="<%=email1%>" placeholder="이메일"> @ 
                        <input type="text" id="email2" name="email2" value="<%=email2%>">
                        <select id="email_select">
                        <option value="self">직접입력</option>
                        <option value="naver.com">naver</option>
                        <option value="daum.net">daum</option>
                        <option value="gmail.com">gmail</option>
                    </select></td>
                </tr>
            </table>
            <div id="buttonId">
                <input type="button"class="button" value="확인" id="change" style='cursor:pointer'>
                <input type="button"class="button" value="비밀번호변경" style="width: 150px" onclick="popup()" style='cursor:pointer'>
                <input type="button"class="button" value="취소" onclick="cancel()" style='cursor:pointer'>
            </div>
           </div>
       </div>


    </div>
           </form>
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