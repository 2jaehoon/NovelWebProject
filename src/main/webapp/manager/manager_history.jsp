<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설조아 | 회원관리</title>
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="http://localhost/novelWebProject/_next/static/css/font.css"/>


<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">




	h1{
		margin-top: 15px;
		margin-bottom: 30px;
		text-align: center; 
		font-size: 30px;
		font-weight: bold;
	}
	
	#searchBox{
		width: 380px; 
		margin-top:40px;
		margin: 0px auto;
	}
	
	#btn{
		border: 1px solid #FFFFFF;
		background-color: #E6E6E6;
		padding: 10px;
	}
	
	#tableSrc{
		width:800px;
		text-align: center;
		border: 1px solid #E6E6E6;
		margin-left: 150px;
	}
	
	
	
	#seqence{
		padding: 10px;
	}
	

	

	
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
  <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
  
  <script type="text/javascript">
  $(function(){ 
	  
	  

    $.ajax({
		url : "manager_history_jsonarr.jsp",
		dataType: "json",
		error : function( xhr ){
		alert("서버에서 전송 실패");
		console.log( xhr.status + " / " + xhr.statusText );
		},
		success : function( jsonArr ){
		
			var tbody="";
			
			let cnt = 0;
			//tr이 하나 이상이면 넣지 않는다.
			

			
			$.each( jsonArr, function(idx, jsonObj) {

				cnt++;
			tbody+="<tr><td>"+
			jsonObj.id+"</td><td>"+
			jsonObj.DeviceOS+"</td><td>"+
			jsonObj.ip+"</td><td>"+
			jsonObj.loginDate+"</td></tr>";
			});//each
//date는 무조건 심플로 바꿔야함			
			
			if( cnt==0 ){
				tbody="<tr><td colspan='4'>모든 사원이 퇴사하였습니다.</td></tr>";
			}//end if
	
			 $("#myTable tbody").html( tbody ); 	
			

				$("#myTable").DataTable({
				    paging: true, // 페이지네이션 기능 활성화
				    lengthChange: true, // 페이지당 보여질 데이터 수 조정 기능 비활성화
				    searching: true // 검색 기능 비활성화
				  });//dataTable
				  
				  $("#logoutBtn").click(function(){
				 		 location.href="http://localhost/novelWebProject/manager/manager_logout.jsp"; 
				 	});//click
				
	
		}//success

	})//ajax
	

  });//ready
</script>


</head>

<body>
<%-- <%= session.getAttribute("sesId") %> --%>
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
   	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
   	response.setDateHeader("Expires", 0); // Proxies.
    
if(session.getAttribute("sesId")==null){
	response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
}
%>
<div id="__next">
<div style="display: none; background-color: canvas; color-scheme: light"></div>
<div class="lightMode h-full">
<div class="flex flex-col h-full">
		<header class="relative bg-white border-b-1 border-grey20">
		<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 flex-wrap items-center desktop:min-h-[72px] desktop:flex-nowrap desktop:py-12">
			<a class="ml-15 mr-16 max-w-[145px] flex-shrink flex-grow basis-0 py-[13.5px] desktop:ml-0 desktop:mr-32 desktop:max-w-[174px] desktop:py-0" href="http://localhost/novelWebProject/manager/manager_home.jsp">
			<img class="" width="157" height="27" src="http://localhost/novelWebProject/_next/static/images/logo.png" alt="소설조아 logo" /></a>
			<div class="flex items-center ml-auto mr-15 desktop:mr-0">
			<button  id="logoutBtn" class="typo-md3 ml-auto flex cursor-pointer items-center rounded-50 bg-transparent text-black desktop:border-1 desktop:desktop:bg-black desktop:px-13 desktop:py-7 desktop:text-white">로그아웃</button>
			</div>
		</div>
	</header>
	
	
	<main class="flex-1 mx-auto w-full max-w-default flex-row flex-wrap">
	

	
	<div>
		<h1>히스토리</h1>
		

	</div>

   	
    <br>
    
    <div style="margin-top: 15px;">
    <table id="myTable">
  <thead>
    <tr>
      <th>아이디</th>
      <th>기기 / OS</th>
      <th>로그인 IP</th>
      <th>로그인 일시</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
     
</table>




    </div>
    
  
    
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