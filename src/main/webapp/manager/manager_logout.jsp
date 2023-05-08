<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


// 세션에서 아이디 삭제
session.removeAttribute("sesId");
session.removeAttribute("user_num_member");

// 로그인 페이지로 이동
response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
%>