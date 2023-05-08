<%@page import="EpisodeVO.My.EditEpisodeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">

</script>
</head>
<%
	request.setCharacterEncoding("UTF-8");

	int userNum = (Integer)session.getAttribute("user_num_member");
	int novelNum = Integer.parseInt(request.getParameter("num_novel"));
	int epNum = Integer.parseInt(request.getParameter("epNum")); 
%>

<script type="text/javascript">
	if("<%=request.getMethod()%>" == "GET") {
		alert("정상적인 방식으로 요청하지 않았어요");
		location.href = "http://localhost/novelWebProject/episode/episode_read.jsp?num_novel="+<%= novelNum %>;
	}
</script>

<jsp:useBean id="edVO" class="EpisodeVO.My.EditEpisodeVO" scope="page"/>
<jsp:setProperty property="*" name="edVO"/>

<%
	edVO.setNovelNum(Integer.parseInt( request.getParameter("num_novel")) );
	// 공개여부 전환
	String open=request.getParameter("openStatus");

	EpisodeMyDAO emDAO = new EpisodeMyDAO();
	edVO.setEpNum(epNum);

	try{
		int editCnt = emDAO.updateEpisode(edVO);
		
		if(editCnt > 0){
			System.out.println(editCnt + ", 수정 완료 ");
			response.sendRedirect("../../novel/novel_list.jsp?num_novel="+ novelNum);		
		}else{
			System.out.println(edVO.getEpNum()+", "+editCnt + ", 수정 실패");
			response.sendRedirect("../../novel/novel_list.jsp?num_novel="+ novelNum);
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>


<body>

</body>
</html>