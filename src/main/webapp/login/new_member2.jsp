<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko" style="height: 800px;">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 작품 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
<link rel="stylesheet"data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />

<style type="text/css">
#wrap{ width: 1300px;height: 900px;margin: 0px auto;}

#container{width:1300px; height: 900px; position: relative;display: flex;justify-content: center;align-items: center;}
#frame{width: 1300px;height: 400px;display: flex;justify-content: center;position: absolute; top: 300px;}
#text_new{width: 200px;height: 50px;position: absolute; bottom: 550px;text-align: center;}
#img{width: 400px; height: 150px; position: absolute;bottom: 550px ;background: url(\\211.63.89.130\sharing\07.프로젝트\2차\3조\_next\static\images\1/info.PNG);background-size : 100% 100%;}
table{border : 1px solid black;border-collapse : collapse;position: absolute; bottom: 200px;}
td,tr{border : 1px solid black;}
.td1{font-size: 15px;font-weight: bold;}
input{width: 150px;height: 20px;border-radius: 3px; background-color: #e8f0fe;border-left-width:0;
    border: none;border-bottom: 2px solid #CCC;}
select{width: 150px;height: 25px;border-radius: 3px; background-color: #e8f0fe;border-left-width:0;
    border: none;border-bottom: 2px solid #CCC;}

#buttonId{width: 300px; height: 40px;position: absolute; top: 300px;display: flex;justify-content: center;}
.button{width:100px;height: 100%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 10px;margin-right: 10px;  background-color: #808080;}
.button1{width:100px;height: 60%; background-color: rgb(95, 95, 255); border-radius: 10px;margin-left: 10px;margin-right: 10px;  background-color: #808080;}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
$(function(){
	
	
	$("#idChk").click(function(){
		window.open("id_chk_dup.jsp","subWin","width=310,height=310");
		 
 	});
	
	 	$("#phone").on("keyup", function() { // 전화번호에 숫자가 아닌 글자가 써졌을 때
	   if (!$.isNumeric($(this).val())) {
	alert("숫자만 써주세요.");
	    $(this).val("");
	  } 
	}); 
	 	
	 	
	
	
	$("#email_select").change(function(){
		if($("#email_select").val()=="self"){ //직접 입력시
			 $("#email2").removeAttr("readonly").focus(); // input text 활성화
			$("#email2").val(""); 
		}else{
			 $("#email2").attr("readonly",true);
			$("#email2").val($("#email_select").val());
		}
	});
	
	$("#idBtn").click(function(){
		 if($("#name").val()=="" || $("#id").val()=="" || $("#pw").val()=="" || $("#pw_chk").val()=="" || $("#birthDate").val()==""
			 || $("#phone").val()=="" || $("#email").val()=="" || $("#email2").val()==""){
			 alert("빈칸을 모두 채워주세요");
			return;
		 }else if($("#pw").val().length < 8){
			 alert("비밀번호는 8자 이상으로 작성해주세요.");
			 return;
		}else if($("#pw").val() != $("#pw_chk").val()){
			alert("비밀번호와 비밀번호 확인이 다릅니다");
			return;
		}else{
			$("#frm").submit();
			
		}
		
	});
	
}); 

</script>

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
   

<form action="signup.jsp" name="frm" method="post" id="frm">
       <div id="container">
           <div id="frame">
            <div id="text_new" style="font-size: 50px; font-weight: bold;">회원가입</div>
            <div id="img"></div>
            <table height="300px" border="1px solid" border-collapse = collapse;>
                <tr>
                    <td width="150px"align="center" class="td1">이름</td><td width="600px"><input type="text" placeholder="이름" name="name" id="name"></td>
                </tr>
                <tr>
                    <td align="center"class="td1">아이디</td><td><input type="text" placeholder="아이디" name="id" id="id" readonly="readonly">
                    <input type="button" class="button1" id = "idChk" value="중복 확인" style='cursor:pointer'></td>
                </tr>
                <tr>
                    <td align="center"class="td1">비밀번호</td><td><input type="password" placeholder="비밀번호" name="pw" id="pw"></td>
                </tr>
                <tr>
                    <td align="center"class="td1">비밀번호 확인</td><td><input type="password" placeholder="비밀번호 확인" name="pw_chk" id="pw_chk"></td>
                </tr> 
                <tr>
                    <td align="center"class="td1">생년월일</td><td><input type="date" name="birthDate" id="birthDate"></td>
                </tr>
                <tr>
                    <td align="center"class="td1">전화번호 (-없이)</td><td><input type="text" placeholder="전화번호" name="phone" id="phone"></td>
                </tr>
                <tr>
                    <td align="center"class="td1">이메일</td><td><input type="text" placeholder="이메일" name="email" id="email"> @ 
                    <input type="text" id="email2" name="email2">
                        <select id="email_select">
                        <option value="self">직접입력</option>
                        <option value="naver.com">naver</option>
                        <option value="daum.net">daum</option>
                        <option value="gmail.com">gmail</option>
                    </select></td>
                </tr>
            </table>
            <div id="buttonId">
                <input type="button"class="button" value="확인" id = "idBtn" name="idBtn" style='cursor:pointer'>
                <input type="button"class="button" value="취소" onclick="window.location.href='loginpage.jsp'" style='cursor:pointer'>
                
            </div>
           </div>
       </div>


            </form>
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
	</div>
	
</body>
</html>