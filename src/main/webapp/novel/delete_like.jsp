<%@page import="java.sql.SQLException"%>
<%@page import="novel.MyLikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%
MyLikeDAO mDAO=new MyLikeDAO();
try{
mDAO.deleteNovel(request.getParameter("num_novel"), session.getAttribute("user_num_member").toString());
}catch(SQLException se){
	se.printStackTrace();
}
response.sendRedirect("/novelWebProject/login/like.jsp?search=&order_novel=0");
%>