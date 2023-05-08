<%@page import="ManagerVO.MemberManageInfoVO"%>
<%@page import="ManagerDAO.ManagerDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.

   if(session.getAttribute("sesId")==null){
     response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
  } 
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설조아 | 회원정보</title>
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/font.css"/>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">
 window.onload=function(){
	document.getElementById("stopBtn").addEventListener("click",stopPop);
	document.getElementById("cancelStopBtn").addEventListener("click",cancelStopPop);
}

function stopPop(){
	if(confirm("정지기한은 2달입니다. 정지시키시겠습니까? \n이미 정지되었다면 기한이 늘어납니다.")){
	    // 확인 버튼을 누르면 실행될 코드
	window.open("manager_user_stop_popup.jsp?id="+$("#hid").val()+"&stop="+$("#hstop").val() ,"popup","width= 200; height= 30;,top="
			+(window.screenY+500)	+",left="+(window.screenX+700));
	} else {
	    // 취소 버튼을 누르면 실행될 코드
	}
}//stopPop

function cancelStopPop(){
	if(confirm("정지를 해지하시겠습니까?")){
	    // 확인 버튼을 누르면 실행될 코드
		window.open("manager_user_stop_cancel_popup.jsp?id="+$("#hid").val()+"&stop="+$("#hstop").val() ,"popup","width= 200; height= 30;,top="
				+(window.screenY+500)	+",left="+(window.screenX+700));
	} else {
	    // 취소 버튼을 누르면 실행될 코드
	    
	}
}//cancelStopPop
</script>
<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">
	
	h1{
		margin-top: 15px;
		margin-bottom: 30px;
		text-align: center; 
		font-size: 30px;
		font-weight: bold;
	}
	
	#btn{
		border: 1px solid #FFFFFF;
		background-color: #E6E6E6;
		padding: 10px;
	}
	
	#pic{
		width: 250px;
		margin-top: 50px; 
		margin-left: 200px;
	}
	
	#spc{
		font-size: 20px;
		margin-top: -170px;
		margin-left: 600px;
	}
	
	#prev{
		padding: 5px;
		background-color: #333;
		color: white;
		text-align: center;
		margin-top: 40px;
		margin-left: 10px;
	}
	
	#stopBtn{
		padding: 5px;
		background-color: #514E4E;
		color: white;
		text-align: center;
		margin-top: -70px;
		margin-left: 700px;
	}
	
	#cancelStopBtn{
		padding: 5px;
		background-color: #514E4E;
		color: white;
		text-align: center;
		margin-top: 0px;
		margin-left: 800px;
	}
</style>
</head>

<body>
<div id="__next">
<div style="display: none; background-color: canvas; color-scheme: light"></div>
<div class="lightMode h-full">
<div class="flex flex-col h-full">
	<!-- header -->
	<div>
		<jsp:include page="../_next/header_manager_in2.jsp"/>
	</div>
	
	<main class="flex-1 mx-auto w-full max-w-default flex-row flex-wrap">
	
	<div style="margin-top: 20px;">
		<button id="btn" onclick="location.href='manager_user.jsp'">회원관리</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id="btn" onclick="location.href='manager_novel.jsp'">소설관리</button>
	</div>

<%
    String id = request.getParameter("id"); 
    ManagerDAO mDAO = new ManagerDAO();
   	MemberManageInfoVO mVO = mDAO.selectMemberInfoAll(id);
   	
    //전화번호
	String phoneNumber = mVO.getPhone();
	String formattedPhoneNumber = "";
	if (phoneNumber != null && phoneNumber.length() >= 10) {
	    formattedPhoneNumber = phoneNumber.substring(0,3) + "-" + phoneNumber.substring(3,7) + "-" + phoneNumber.substring(7);
	}
	
	Date date = new java.util.Date(mVO.getSusPeriod().getTime());//db값안에 있는 날짜
	LocalDate currentDate = LocalDate.now();
	Date curDate = Date.from(currentDate.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant());//현재 날짜
	String str = "";
	if( date.before(curDate)==true ){
	str = "정상 회원";
	}else{
	str = mVO.getSusPeriod().toString()+"까지";	
	}
	
	
%>	
	<div>
		<h1>"<%= id%>" 회원 정보</h1>
	</div>
	
	<div>
		<div id="pic" style="text-align: center;">
			<img src="<%= (mVO.getThumbnail() != null) ? "/novelWebProject/_next/static/images/profile_images/" 
				+ mVO.getThumbnail() : "/novelWebProject/_next/static/images/profile_home.png" %>" style="width: 170px; height: 170px; right:300px" alt="회원사진" >
		</div>
		<input type = "hidden" value="<%= mVO.getId() %>"  id="hid"/>
		<input type = "hidden" value="<%= mVO.getSusPeriod() %>"  id="hstop"/>
		<div id="spc">
			<ul>
				<li>아이디 : <%= mVO.getId() %></li>
				<li>이름 : <%= mVO.getName() %></li>
				<li>생년월일 : <%= mVO.getBirthDate() %></li>
				<li>이메일 : <%= mVO.getEmail() %></li>
				<li>전화번호 : <%= formattedPhoneNumber %></li>
				<li>소설 수 : <%= mVO.getNovelCnt() %></li>										
				<li>방문 날짜 : <%= mVO.getVisitDate() %></li>					
				<li>가입 날짜 : <%= mVO.getJoinDate() %></li>				
				<li>중지 기한 : <%= str %></li>

			</ul>
		</div>
	</div>
	<br>
	
	<div>
		<button id="prev" onclick="location.href='manager_user.jsp'">< prev</button><br>
	</div>
	<div>
		<button id="stopBtn">강제 중지</button> &nbsp;
		<button id="cancelStopBtn">강제 중지 해제</button>
	</div>
    <br>
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