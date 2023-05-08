<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
   //POST방식
   request.setCharacterEncoding("UTF-8");

	int userNum = (Integer)session.getAttribute("user_num_member");
	int novelNum = Integer.parseInt(request.getParameter("num_novel"));
	System.out.print("insert episode "+novelNum);
   %> 

<script type="text/javascript">
	if("<%=request.getMethod()%>" == "GET") {
		alert("정상적인 방식으로 요청하지 않았어요");
		location.href = "http://localhost/novelWebProject/episode/episode_read.jsp?num_novel="+<%= novelNum %>;
	}
</script>

<jsp:useBean id="ceVO" class="EpisodeVO.My.CreateEpisodeVO" scope="page"/>
<jsp:setProperty property="*" name="ceVO"/>

<%
	EpisodeMyDAO emDAO = new EpisodeMyDAO();
	ceVO.setNovelNum(novelNum);
	
	try{
		emDAO.insertEpisode(ceVO);
		response.sendRedirect("/novelWebProject/novel/novel_list.jsp?num_novel="+novelNum);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
