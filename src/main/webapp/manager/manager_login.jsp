<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 // 각 페이지 상단에 다음 코드 추가
 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
 		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
 		response.setDateHeader("Expires", 0); // Proxies.
 		
 		session.removeAttribute("sesId");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설조아 | 관리</title>
<meta property="description" content="소설조아 | 관리" />
<meta property="og:url" content="/free" />
<meta property="og:site_name" content="소설조아" />
<meta property="og:title" content="소설조아 | 관리" />
<meta property="og:image" content="/static/images/logo.png" onclick="location.href='manage_home.html'"/>
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="http://localhost/novelWebProject/_next/static/css/font.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">


 
/* 아이디, 비밀번호 입력여부, 길이제한 유효성검사 */
$(function(){

	
	$("#id").keydown(function( evt ){
		if( evt.which == 13 ){
			chkNull();
		}//end if
	});//keydown
	
	$("#password").keydown(function( evt ){
		if( evt.which == 13 ){
			chkNull();
		}//end if
	});//keydown
	
	
	$("#btn").click(function( ){
			chkNull();
	});//click

	
});//ready


function chkNull(){
	if( $("#id").val()=="" ){
		alert("아이디는 필수 입력");
		$("#id").focus();
		return;
	}//end if
	
	if( $("#password").val()=="" ){
		alert("비밀번호는 필수 입력");
		
		$("#password").focus();
		return;
		
	}//end if
	
	chkLeng();

}//chkNull


function chkLeng(){
	
	if( $("#id").val().length > 19 ){
		   alert("아이디는 20자까지만 입력가능");
		   return;
	}//end if
	 
	if( $("#password").val().length > 19 ){
		   alert("비밀번호는 20자까지만 입력가능");
		   return;
	}//end if

	$("#frm").submit();
	
	
}//chkLeng





</script>
<noscript data-n-css=""></noscript>
<script defer="" nomodule="" src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/polyfills-5cd94c89d3acac5f.js"></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/webpack-408221525e66f571.js" defer=""></script>
<!-- <script src="https://pagestage-cdn.kakaoent.com/web/_next/chunks/framework-e4fe6a4fc9298e74.js" defer=""></script> -->
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/main-7f851a34143e697f.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/pages/_app-a477bbe86975eefc.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/29107295-52f938a4089e4ea4.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/3634-0557494e84489fee.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/7649-e139321f6ea15526.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/277-f6cfaa8242044e66.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/5826-c7b021092ab2dffe.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/chunks/pages/%5Bgenre%5D-4bca35c73faba311.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/DTTq-pEjkraM1eJOqnaey/_buildManifest.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/DTTq-pEjkraM1eJOqnaey/_ssgManifest.js" defer=""></script>
<script src="https://pagestage-cdn.kakaoent.com/web/_next/static/DTTq-pEjkraM1eJOqnaey/_middlewareManifest.js" defer=""></script>

<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">
	h1{
		margin-top: 15px;
		margin-left: 0px;
		margin-right: 0px;		
		text-align: center; 
		font-size: 20px;
	}
	h2{
		margin-top: 15px;
		margin-left: 0px;
		margin-right: 0px;
		text-align: center; 
		font-size: 30px;
		font-weight: bold;
		padding-bottom: 30px;
	}
	#btn{
		border: 1px solid #FFFFFF;
		background-color: #E6E6E6;
		padding: 10px;
		margin: 0px auto;
	}
	#id {
	margin: 0px auto;
	  width: 250px;
	  height: 40px;
	  border: 1px solid #E6E6E6;
	}
	#password {
	margin: 0px auto;
	  width: 250px;
	  height: 40px;
	  border: 1px solid #E6E6E6;
	}
	#div {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
</style>
</head>

<body>
<%--  <%= session.getAttribute("sesId") %>  --%>
<div id="__next" data-reactroot="">
<div style="display: none; background-color: canvas; color-scheme: light"></div>
<div class="lightMode h-full">

<div class="flex flex-col h-full">

	<header class="relative bg-white border-b-1 border-grey20">
		<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 flex-wrap items-center desktop:min-h-[72px] desktop:flex-nowrap desktop:py-12">
			<a class="ml-15 mr-16 max-w-[145px] flex-shrink flex-grow basis-0 py-[13.5px] desktop:ml-0 desktop:mr-32 desktop:max-w-[174px] desktop:py-0" href="http://localhost/novelWebProject/home/main.jsp">
			<img class="object-contain" width="157" height="27" src="http://localhost/novelWebProject/_next/static/images/logo.png" alt="소설조아 logo" /></a>
			<div class="flex items-center ml-auto mr-15 desktop:mr-0">
				<input type="button" onclick="location.href='http://localhost/novelWebProject/manager/manager_login.jsp'" class="typo-md3 ml-auto flex cursor-pointer items-center rounded-50 bg-transparent text-black desktop:border-1 desktop:desktop:bg-black desktop:px-13 desktop:py-7 desktop:text-white"  value="로그인" />
			</div>
		</div>
	</header>
	
	<!-- https://studiomeal.com/archives/197 -->
	<!-- mx-auto:left&right margin auto  w-full: width 100%-->
	<!-- flex-row:아이템들이 행방향으로 배치 flex-wrap:줄넘김 -->
	<main class="flex-1 mx-auto w-full max-w-default flex-row flex-wrap">
	
	<form name="form" method="post" action="http://localhost/novelWebProject/manager/manager_login_process.jsp" id="frm">
		<div>
			<h1>&nbsp;</h1><br>
			<h2>관리자 로그인</h2><br>
		</div>
		
		<div id="div">
			<input type="text" name="id" id="id" placeholder="아이디"><br>
			<input type="password" name="password" id="password" placeholder="비밀번호"><br>
			<input type="button" id = "btn" value="로그인">
		</div>
	</form>
	
	</main>
	
	<footer	class="typo-sm1 border-t-1 border-grey20 bg-grey10 text-grey60 desktop:typo-sm2 mt-48 desktop:mt-116">
	<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18 flex-col items-start py-32 desktop:flex-row desktop:items-center desktop:py-40">
		<div class="flex mb-20 w-full items-center justify-between desktop:mb-0 desktop:w-auto"></div>
		<div style="font-size: 40px">소설조아&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="flex flex-col" style="position: relative; top: 10px;">
			<ul	class="flex flex-wrap mb-20 list-none p-0 text-grey60 desktop:mb-5">
				<li class="mr-8"><a href="#void">회사소개</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">이용약관</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void"> <strong>개인정보처리방침</strong></a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">청소년보호정책</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">권리침해신고센터</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">공지사항</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">고객센터</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">도움말</a></li>
			</ul>
			<ul class="flex flex-wrap mb-20 list-none p-0 font-medium text-grey60 desktop:mb-10">
				<li class="mr-8">
				<div class="flex cursor-pointer items-center font-bold">(주)소설조아 사업자 정보
						<svg width="16" height="16" viewBox="0 0 16 16" fill="none"	xmlns="" role="img" class="">
                         <path fill-rule="evenodd" clip-rule="evenodd" d="M7.99966 11.0002L2.99902 6.06302L4.05289 4.99561L7.99966 8.89229L11.9464 4.99561L13.0003 6.06302L7.99966 11.0002Z" fill="currentColor"></path>
                        </svg>
				</div>
			</li>
			</ul>
		</div>
	</div>
	</footer>
	
</div>
</div>
</div>
</body>
</html>