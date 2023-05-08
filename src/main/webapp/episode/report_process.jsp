<%@page import="EpisodeDAO.EpisodeDAO"%>
<%@page import="EpisodeVO.My.EditEpisodeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rVO" class="EpisodeVO.User.ReportVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>

<%
	int userNum = (Integer)session.getAttribute("user_num_member");
	int num_novel = Integer.parseInt(request.getParameter("num_novel"));
	String report = request.getParameter("report");
	String id = request.getParameter("id");
	
	 EpisodeDAO epDAO = new EpisodeDAO();
	 rVO.setNovelNum(num_novel);
	 
	 try{
		int reportCnt=epDAO.insertReport(rVO);
		 
		System.out.println(userNum+","+num_novel+","+report+","+id);
		
		if(reportCnt > 0){
			System.out.println(reportCnt + ", 신고 완료 ");
			System.out.println(userNum+", "+num_novel+", "+report+", "+id);
			
			%>
			<script type="text/javascript">

				window.close();
			</script>
		<%
			
		}else{
			System.out.println(rVO.getNovelNum()+", "+reportCnt + ", 신고 실패");
			response.sendRedirect("/novelWebProject/episode/novel.jsp?num_novel=" + num_novel);
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
