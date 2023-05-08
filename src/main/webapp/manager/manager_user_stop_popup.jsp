
<%@page import="java.time.LocalDate"%><%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
String stop = request.getParameter("stop");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
LocalDate currentDate = LocalDate.now();
Date date = sdf.parse(stop);//db값안에 있는 날짜
Date curDate = Date.from(currentDate.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant());//현재 날짜
//System.out.print(date);
//System.out.print(curDate);
//System.out.print(date.before(curDate)); //db값의 날짜가 현재날짜보다 전이냐? 이것으로 61일 정지 60일 정지를 나눌것
try{
int mcnt = 0;
if( date.before(curDate)==true ){
mcnt = mDAO.forcedStop(request.getParameter("id"));
// db값에 들어가는 중지값이 null이 들어가면 안되기에 nvl로 오늘자를 기준으로 하루전으로 기본값을 설정
}
else{
	mcnt = mDAO.forcedStop60(request.getParameter("id"));
	//out.print("60일 추가정지");
	
}

if(mcnt>0){
	//session.setAttribute("check", "1");
	%>
	<div class="bg-primary p-2 text-white bg-opacity-25" style="width: 200px; text-align: center;">정지 완료</div>
	<% 
}else{
	%>
	<div class="text-bg-danger p-3 text-white bg-opacity-25" style="width: 200px; text-align: center;">정지 실패</div>
	<%
}
	
}catch(SQLException se){
	se.printStackTrace();
}
%>


	
</body>
</html>