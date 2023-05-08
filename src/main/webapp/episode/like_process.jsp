<%@page import="EpisodeDAO.EpisodeDAO"%>
<%@page import="EpisodeVO.My.EditEpisodeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<jsp:useBean id="lVO" class="EpisodeVO.User.LikeVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	int userNum = (Integer)session.getAttribute("user_num_member");
	int novelNum = Integer.parseInt(request.getParameter("num_novel"));
	String id = request.getParameter("id");
	String good = request.getParameter("good");
		
	System.out.println("좋아요할 소설번호: "+ novelNum);
	
	EpisodeDAO episodeDAO = new EpisodeDAO();

	lVO.setNovelNum(novelNum);
	System.out.println("novelNum: " + novelNum);
	System.out.println("userNum: " + userNum);
	System.out.println("id: " + id);
	System.out.println("good: " + good);

	try{
		if("1".equals(good)){
			int insertLike = episodeDAO.insertLike(lVO);
			
			System.out.println(novelNum + ", " +userNum + ", 좋아요 완료 ");
			response.sendRedirect("/novelWebProject/episode/novel.jsp?num_novel=" + novelNum);
			
			return;
		}
		
		int deleteLike = episodeDAO.deleteLike(userNum, novelNum);
		System.out.println(novelNum + ", " +userNum + ", 좋아요 취소 완료 ");
		response.sendRedirect("/novelWebProject/episode/novel.jsp?num_novel=" + novelNum);
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<script type="text/javascript">
	if("<%=request.getMethod()%>" == "GET") {
		alert("정상적인 방식으로 요청하지 않았어요");
		location.href = "http://localhost/novelWebProject/episode/novel_.jsp?num_novel="+novelNum;
	}
</script>

