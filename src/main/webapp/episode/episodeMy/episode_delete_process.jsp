<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    request.setCharacterEncoding("UTF-8");	
    	
	int userNum = (Integer)session.getAttribute("user_num_member");
	int num_novel = Integer.parseInt(request.getParameter("num_novel"));
	int epNum = Integer.parseInt(request.getParameter("epNum")); 


	EpisodeMyDAO mDAO = new EpisodeMyDAO();
	try{
		int removeCnt = mDAO.deleteEpisode(userNum, num_novel, epNum);
		
		if(removeCnt <= 0){
			System.out.println(epNum+", "+removeCnt + ", 삭제 실패");
			response.sendRedirect("/novelWebProject/login/loginpage.jsp");
			
		}else{
			System.out.println(epNum+", "+removeCnt + ", 삭제 완료");
		%>
			<script type="text/javascript">
				window.close();
			</script>
		<%
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>