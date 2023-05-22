<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    info="아이디의 중복확인 기능 추가"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="http://localhost/jsp_prj/common/main_v20230217.css"/>
<style type="text/css">
#wrap{ width: 1000px; height: 1200px;margin: 0px auto; }
#header{  height: 200px; position: relative;
	background: #FFFFFF url(http://localhost/jsp_prj/common/images/header_bg.png)  repeat-x;}

#logo{ position:absolute;top: 40px;left:100px; width: 150px; font-weight: bold; font-size: 40px;
	font-family: 고딕 ;}	
#naviBar{ position:absolute;top:140px;left:0px;height: 60px }	 
#container{ height: 900px;position: relative; }	 

#footer{ height: 100px;position: relative;  }	 
#flogo{ position:absolute;top:20px;left:100px;height: 60px;font-weight: bold; font-size: 20px;
	font-family: 고딕 ; color:#d7d7d7; text-align: right; width:100%;  }	 

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
$(function() {
	$("#btn").click(function(){
	    if ($("#id").val() == "") {
	        alert("아이디 필수 입력!!");
	        return;
	    }//end if
	    
	    if ($("#password").val() == "") {
	        alert("비밀번호 필수 입력!!");
	        return;
	    }//end if
	   
	   
	    
	   if( $("#id").val().length > 19 ){
		   alert("아이디는 20자까지만 입력가능");
		   return;
	   }//end if
	    
	   if( $("#password").val().length > 19 ){
		   alert("비밀번호는 20자까지만 입력가능");
		   return;
	   }//end if
	    
	    
	    $("#frm").submit();
	    
	});//click
	

	
	});//ready


</script>

</head>
<body>
<div id="wrap"> 
<div id="header">  
	<div id="logo">Class 4.</div>
	<div id="naviBar">navi ( 1000 x 60)</div>
</div>
<div id="container">
<form action="http://localhost/project2/crud/insert_frm_process.jsp" method="post" id="frm" name="frm"><!--  ///////////////////////////////////////////// -->
<table>
<tr>
<th>암호화를 사용한 데이터 입력 폼</th>
</tr>
<tr>
<td style="width: 80px"><label>아이디</label></td>
<td style="width: 300px">
	<input type="text" name="id"  id ="id" class="inputBox" style="width: 240px"/> 
</td> 
</tr>
<tr>
<td style="width: 80px"><label>비밀번호</label></td>
<td style="width: 300px">
	<input type="password" name="password" id ="password" class="inputBox" style="width: 240px"/> 
</td> 
</tr>

<tr>
<td colspan="2">
	<input type="button" value="입력" class="btnBorder" style="width: 100px" id="btn"/> 
</td> 
</tr>
</table> 

</form>
</div>
<div id="footer">footer ( 1000 x 100)
	<div id="flogo"> Copyright &copy; Class 4. All rights reserved.</div>
</div>
</div>
</body>
</html>



    