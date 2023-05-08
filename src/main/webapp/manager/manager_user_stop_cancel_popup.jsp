<%@page import="java.sql.SQLException"%>
<%@page import="ManagerDAO.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>매니저</title>
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta name="next-head-count" content="2" />
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
<link rel="stylesheet" type="text/css"
	href="/novelWebProject/_next/static/css/login.css" />
<script type="text/javascript">
</script>

<!-- bootstrap 끝-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- bootstrap 끝-->

<style type="text/css">
#wrap {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
}
</style>	
</head>
<body>
<%
ManagerDAO mDAO = new ManagerDAO();
try{
int mcnt = mDAO.forcedStopClear(request.getParameter("id"));
System.out.print(mcnt);
if(mcnt>0){
	%>
		<div class="bg-primary p-2 text-white bg-opacity-25" style="width: 200px; text-align: center;">정지 해제 완료</div>
	<% 
}else{
	%>
	<div class="text-bg-danger p-3 text-white bg-opacity-25" style="width: 200px; text-align: center;">정지 해제 실패</div>
	<%
}
	
}catch(SQLException se){
	se.printStackTrace();
}
%>


	
</body>
</html>