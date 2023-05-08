<%@page import="novel.NewNovelVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="novel.NewNovelDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
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
	
	
	
</script>

</head>
<body>
<div id="wrap"> 
<div id="header">  
	<div id="logo">Class 4.</div>
	<div id="naviBar">navi ( 1000 x 60)</div>
</div>

<div id="container">
	
<%
if("POST".equals(request.getMethod())){

	String resourceDir = request.getServletContext().getRealPath("/_next/static/images/novel_thumb");
	File saveDirectory=new File(resourceDir);
	int totalMaxSize=500*1024*1024;	//500mb제한
	
		MultipartRequest mr=new MultipartRequest(request,saveDirectory.getAbsolutePath(),totalMaxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String id=mr.getParameter("id");
		String age=mr.getParameter("age");
		String title=mr.getParameter("title");
		String story=mr.getParameter("story");
		String open=mr.getParameter("open");
		String end=mr.getParameter("end");
		String num_novel=mr.getParameter("num_novel");
		
		String hidden=mr.getParameter("filephoto");
		String photoName=mr.getFilesystemName("upphoto");
		
		if(photoName==null){	//update 이미지가 없다면 photoName을 기존과 같은 값으로 바꾼다
			photoName=hidden;
		}else{	//update 이미지가 있다면 기존에 저장된 이미지를 지운다
			File uploadFile=new File(saveDirectory.getAbsolutePath()+"/"+hidden);
			uploadFile.delete();
		}
		
		NewNovelDAO nDAO=new NewNovelDAO();
		try{
			NewNovelVO nVO=new NewNovelVO(id, title, photoName, story, Integer.parseInt(age) , Integer.parseInt(open), Integer.parseInt(end));
			nDAO.editNovel(nVO,num_novel);
		}catch(SQLException se){
			se.printStackTrace();
		}//end catch
		response.sendRedirect("/novelWebProject/novel/novel_list.jsp?num_novel="+num_novel);
		
}else{
response.sendRedirect("/novelWebProject/login/my_page.jsp");
}

%>

</div>

<div id="footer">footer ( 1000 x 100)
	<div id="flogo"> Copyright &copy; Class 4. All rights reserved.</div>
</div>
</div>
</body>
</html>