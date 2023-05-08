<%@page import="LoginDAO.LoginDAO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />

<style type="text/css">
#wrap{ width: 600px;height: 500px;margin: 0px auto;}

#container{width:600px; height: 400px; position: relative;display: flex;justify-content: center;align-items: center;}
#frame{width: 600px;height: 400px;display: flex;justify-content: center;position: absolute;  border-radius: 30px;background-color: #E0E0E0;left:0px}
#text_id{width: 400px;height: 50px;position: absolute; bottom: 450px;text-align: center;}
#text1{width: 70%;position: absolute; top: 50px;font-size: 20px;font-weight: bold;line-height: 1.3;}
#text2{width: 70%;position: absolute;top: 130px;font-size: 15px;line-height: 1.3;}
#nametext{width: 70%;position: absolute;top: 180px; font-size: 13px;font-weight: bold;}
#input_name{width: 70%;position: absolute;top: 200px;}
#phonetext{width: 70%;position: absolute;top: 250px; font-size: 13px;font-weight: bold;}
#input_phone{width: 70%;position: absolute;top: 270px;}

#buttonId{width: 500pxpx; height: 40px;position: absolute; bottom: 30px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 10px; margin-right: 10px;}

#footer{height: 200px; background-color: bisque;}
#banner{position: absolute; width: 500px; height: 200px; background: url(\\211.63.89.130\sharing\07.프로젝트\2차\3조\_next\static\images\1/footer.PNG);background-size : 100% 100%;}}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
	$(function(){
		$("#next").click(function(){
			var phone = $("#phone").val();
			var call= /^[0-9]+$/.test(phone);
			if($("#name").val() == "" || phone == ""){
				alert("빈칸을 다 채워주세요");
				
			}else{
				$("#frm").submit();
			} 
		
		});
		
		$("#phone").on("keyup", function() {
			   if (!$.isNumeric($(this).val())) {
			alert("숫자만 써주세요.");
			    $(this).val("");
			  } 
			}); 
		
	});	
</script>
<jsp:useBean id="fiVO" class="LoginVO.FindIdVO" scope="page"/>
<jsp:setProperty property="*" name="fiVO"/>
<%
LoginDAO lDAO = new LoginDAO();
String id= lDAO.selectIdFind(fiVO);
//String resultId= lDAO.selectIdFind(fiVO);
if("POST".equals(request.getMethod())&& id != null && !id.isEmpty()){

//DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
//String id = dd.decryption(resultId);

request.setAttribute("id", id);
request.getRequestDispatcher("id.jsp").forward(request, response);


if(id == null || id==""){
	%>
	<script>alert("일치하는 정보가 없습니다");</script>
<%
}
}
%>


</head>
<body>
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
    <div id="wrap">

        
        

       <div id="container">
       <form id="frm" name="frm" method="post" action="id_search.jsp"> 
           <div id="frame">
            <div id="text_id" style="font-size: 50px; font-weight: bold;">아이디 찾기</div>
            <div id="text1">소설조아 계정의<br>
                아이디를 찾습니다</div>
            <div id="text2">본인확인을 위해<br>
                이름과 전화번호를 입력해주세요</div>
                <div id="nametext">이름</div>
                <div id="input_name"><input type="text"style="width:340px;height:20px;" id="name" name="name"/></div>
                <div id="phonetext">전화번호(-없이 입력)</div>
                <div id="input_phone"><input type="text"style="width:340px;height:20px;" id="phone" name="phone"/></div>
                <div id="buttonId">
                    <input type="button"class="button" value="확인"  id="next"/>
                    <input type="button"class="button" value="취소" onclick="loginpage()">
                </div>
            </div>
            </form>
           </div>
    </div>

</body>
</html>