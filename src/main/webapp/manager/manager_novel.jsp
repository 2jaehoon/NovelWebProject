<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
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
<title>소설조아 | 소설관리</title>
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/font.css"/>
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
	
/* 	#myTable{
		width:800px;
		text-align: center;
		border: 1px solid #E6E6E6;
		margin: 0px auto;
	} */
	
	tr, td{
		padding: 7px;
	}
	
	#seqence{
		padding: 10px;
		margin: 0px auto;
	}
	
	#container{
		min-height: 900px; position: relative; 
	}
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 시작 -->
<!-- 페이지네이션 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<!-- 페이지네이션 끝 -->

<script type="text/javascript" >
$(function(){
		$.ajax({
			url : "manager_novel_data_jsonarr.jsp",
			dataType : "JSON",
			error : function(xhr){
				alert("서버에서 문제가 발생했습니다. 다시 시도해주세요.");
				console.log(xhr.status);
			},
			success : function(jsonArr){
				var tbody="";
				let cnt=0;
				
				$.each(jsonArr,function(idx,jsonObj){
					cnt++;
					tbody += "<tr><td>" +
		                jsonObj.novelNum + "</td><td><a href='manager_report.jsp?title=" +
		                jsonObj.novelTitle + "'>" + jsonObj.novelTitle + "</a></td><td>" +
		                jsonObj.id + "</td><td>" +
		                jsonObj.likeCnt + "</td><td>" +
		                jsonObj.reportCnt + "</td><td>" + 
		                jsonObj.createCnt + "</td></tr>";

				});//each
				
				if(cnt == 0){
					tbody="<tr><td colspan='6'>모든 회원이 탈퇴하였습니다.</td></tr>";
				}//end if
				
				$("#myTable tbody").html(tbody);
				
			    $("#myTable").DataTable({
			      paging: true, // 페이지네이션 기능 활성화
			      lengthChange: true, // 페이지당 보여질 데이터 수 조정 기능 활성화
			      searching: true // 검색 기능 활성화
			    });
			}
		});//ajax
});//ready
</script>

</head>

<body>
<div id="__next">
<div style="display: none; background-color: canvas; color-scheme: light"></div>
<div class="lightMode h-full">
<div class="flex flex-col h-full">

	<!-- header -->
	<div>
		<jsp:include page="../_next/header_manager_in.jsp"/>
	</div>
	
	<main class="flex-1 mx-auto w-full max-w-default flex-row flex-wrap">
	
	<div>
		<h1>소설 관리</h1>
	</div>
    
    <div style="margin-top: 15px;">
    
    <table id="myTable">
	<thead>
	<tr>
	<th style="width: 80px ">번호</th>
	<th style="width: 150px ">제목</th>
	<th style="width: 150px ">작가 아이디</th>
	<th style="width: 120px ">좋아요 수</th>
	<th style="width: 150px ">신고 누적 수</th>
	<th style="width: 160px ">작성일</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
	</table>
    </div>
    
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