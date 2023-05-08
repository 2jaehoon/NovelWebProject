<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="ManagerVO.MemberManageInfoVO"%>
<%@page import="ManagerDAO.ManagerDAO"%>
<%@page import="ManagerDAO.ManagerLoginDAO"%>
<%@page import="ManagerVO.LoginVO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력값을 받아 암호화를 수행한 후 검색 결과를 받아서 복호화를 한 후 세션에 저장"
    %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/common/main_v20230217.css"/> 
<style type="text/css">

#wrap{
width:1000px; height:1200px; margin:0px auto; /* background-color:#FF0000; */
}

#header{
height:200px; /* background-color:#00FF00; */
position:relative;
background:#FFF url(http://localhost/jsp_prj/common/images/header_bg.png) repeat-x;
}

#logo{
position:absolute; top:40px; left:100px; 
width:150px; font-weight:bold; font-size:40px; font-family:고딕; 
}

#naviBar{
position:absolute; top:140px; left:0px;
height:60px;
}

#container{
height:900px; /* background-color:#23A9FF; */
position:relative;
}

#footer{
height:100px; position:relative; /* background-color:#0766E6; */
}

#flogo{
position:absolute; left:600px; 
height:60px; font-weight:bold; font-size:20px; font-family:"맑은 고딕";
color:#d7d7d7;
} 


</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">

</script>
</head>
<body>


<div id="wrap"> <!-- wrap(w:1000 h:1200) -->


<div id="header"><!-- header(w:1000 h:200) -->
	<div id="logo">Class 4</div>
	<div id="naviBar">naviBar(w:1000 h:60)</div>
</div>


<div id="container">
<jsp:useBean id="lVO" class="ManagerVO.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>
<%
//System.out.println("============"+lVO);
//웹 파라메터의 아이디와 비밀번호가 존재하는 경우 비밀번호를
if( lVO.getId()==null || "".equals( lVO.getId() ) || lVO.getPassword()==null||"".equals( lVO.getPassword() ) ){
	response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
	return;
}
//MD5 알고리즘을 사용하여 일방향 해시로 암호화 수행한다.
//아이디와 비밀번호는 LoginVO를 만들어서 사용할 것.
lVO.setPassword( DataEncrypt.messageDigest("MD5", lVO.getPassword() ) );
//System.out.println("============"+lVO);
//DAO를 사용하여 로그인 작업 수행
ManagerLoginDAO lDAO = new ManagerLoginDAO();
try{
String id = lVO.getId();
String password = lVO.getPassword();

LoginVO lChkVO = lDAO.selectLogin(id, password);
String idChk = lChkVO.getId();
String pwChk = lChkVO.getPassword();

 /* ManagerDAO mDAO = new ManagerDAO();
	MemberManageInfoVO mVO = mDAO.selectMemberInfoAll("1ary");
Date date = new java.util.Date(mVO.getSusPeriod().getTime());//db값안에 있는 날짜
LocalDate currentDate = LocalDate.now();
Date curDate = Date.from(currentDate.atStartOfDay().atZone(java.time.ZoneId.systemDefault()).toInstant());//현재 날짜
if( date.before(curDate)==true ){
session.setAttribute("sesId", idChk);

//db값에 들어가는 중지값이 null이 들어가면 안되기에 nvl로 오늘자를 기준으로 하루전으로 기본값을 설정했기에
//정지를 당하지 않은 사람
}
 */

session.setAttribute("sesId", idChk);
session.setAttribute("user_num_member", 0);
//session.setMaxInactiveInterval(60*60);

if(id.equals(idChk) && password.equals(pwChk) ){
	response.sendRedirect("http://localhost/novelWebProject/manager/manager_home.jsp");
}//end if
}catch(NullPointerException ne){
		response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
}
%>


</div>


<div id="footer">footer(w:1000 h:100)
	<div id="flogo">Copyright &copy; Class 4. All rights reserved.</div>
</div>


</div>

</body>
</html>