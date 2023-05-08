<%@page import="EpisodeVO.My.LookMyEpisodeVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeDAO.EpisodeMyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
    request.setCharacterEncoding("UTF-8");
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<title>글 수정 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous">
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap">
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/0bde5e3867c0e9b2.css" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/fd0af5d18a01c194.css" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/44b5ac89a790a9aa.css" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/6e5d8ba319c77348.css" data-n-g="">
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/font.css" />
<!-- jQuery CDN설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<%
	if(session.getAttribute("user_num_member")==null){
		response.sendRedirect("../login/loginpage.jsp");
		return;
	}
	 
	int userNum = (Integer)session.getAttribute("user_num_member");
	int num_novel = Integer.parseInt(request.getParameter("num_novel"));
	int epNum = Integer.parseInt(request.getParameter("epNum")); 
	

	if(num_novel == 0){
%>
		<script type="text/javascript">
			alert("파라미터 novelNum의 값이 없음");
			location.href="http://localhost/novelWebProject/home/main.jsp";
		</script>
<%
}	

	if(epNum == 0){
%>
		<script type="text/javascript">
			alert("파라미터 epNum의 값이 없음");
			location.href="http://localhost/novelWebProject/novel/novel_list.jsp?num_novel=" + num_novel;
		</script>
<%
}	
	
	// 선택한 회차 화면에 출력
	EpisodeMyDAO mDAO = new EpisodeMyDAO();
	LookMyEpisodeVO selectVO = null;
	try{
		// 에피소드 화면 출력
		selectVO = mDAO.selectEpisode(userNum, num_novel, epNum);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

<script type="text/javascript">

$(function(){
	
	// 글자 수 제한
	$("#detail").keyup(function(){
		var detail = $(this).val().length;
		$("#epLength").text(detail);
			
		if(detail >= 2000){
			alert("2000자 까지만 입력할 수 있습니다.");
			return;
		}  
	});
	
	// 등록 이벤트
	$("#edit").click(function(){
		var epTitle = $("#epTitle").val();
		var detail = $("#detail").val();
		
		// 소설 제목수 검사
		if(epTitle.length == 0 || epTitle == ""){
			alert("에피소드 제목을 입력해주세요");
			$("#epTitle").focus();
			return;
		}else if(epTitle.length >= 20){
			alert("에피소드 제목은 20글자를 넘길 수 없습니다.");
			return;
		}
		
		if( epTitle.trim() == ""){
			alert("에피소드 제목은 빈칸이 될 수 없습니다.");
			$("#epTitle").focus();
			return;
		}
		
		// 소설 내용 수 검사
		if(detail.length == 0 || detail == ""){
			alert("에피소드 내용을 입력해주세요");
			$("#detail").focus();
			return;
		}
		
		if( detail.trim() == "" ){
			alert("에피소드 내용은 빈칸이 될 수 없습니다.");
			$("#detail").focus();
			return;
		}
		
		$("#editFrm").submit();
		alert("에피소드가 수정되었습니다.");
	});

	
	// 에피소드 공개
	$("#private").click(function(){
		if($(this).val() == "공개"){			// 버튼이 공개로 되어있으면 비공개로 전환
			$("#openStatus").val(0);
			$(this).val("비공개");
			alert("비공개 되었습니다!");
		}else if($(this).val() == "비공개"){	// 버튼이 비공개로 되어있으면 공개로 전환
			$("#openStatus").val(1);
			$(this).val("공개");
			alert("공개 되었습니다!");
		}
	}); //private 
	
	
	// 에피소드 삭제
	$("#delete").click(function(){
		window.open("episode_delete_popup.jsp?num_novel=<%=num_novel%>&epNum=<%=epNum%>","popup","width=400,height=300,resizable=no,top="
				+(window.screenY+100)	+",left="+(window.screenX+100)); 
		window.close();
	}); //delete 
	
}); // ready
	
	
</script>
</head>


					
<body>
	<div id="__next" data-reactroot="">
	<div style="display: none; background-color: canvas; color-scheme: light;"></div>
	<div class="lightMode h-full flex flex-col h-full">
	<main class="flex-1">
		
		<form id="editFrm" action="episode_edit_process.jsp" method="post" class="flex flex-col h-full">
			<header class="flex relative h-90 flex-wrap items-start justify-center border-b-1 border-black/10 bg-white px-20 desktop:h-74 desktop:items-center desktop:px-24">
				<div>
					<a href="http://localhost/novelWebProject/novel/novel_list.jsp?num_novel=<%= num_novel%>">
						<img width="20" height="20" src="/novelWebProject/_next/static/images/list.png" />
					</a>
				</div>
				<div class="flex absolute inset-x-0 bottom-10 mx-20 items-center justify-center text-12 font-bold desktop:bottom-auto desktop:mx-[220px] desktop:items-end desktop:text-16">
					<label style="font-size: 25px; height: 38px; color: rgb(0, 0, 0); font-weight: bold;"><%= selectVO.getNovelTitle() %></label>
				</div>
				
				<!-- 버튼들 -->
				<div class="mt-16 ml-auto desktop:mt-0">
					<div class="flex items-center justify-end">
						<input type="button" id="edit" value="수정" class="typo-sm1 shrink-0 appearance-none rounded-50 border-1 py-6 px-14 bg-black border-black text-white"/>&nbsp;
						<input type="button" id="private" value="<%= selectVO.getOpenStatus() == 1 ? "공개":"비공개" %>" class="typo-sm1 shrink-0 appearance-none rounded-50 border-1 py-6 px-14 bg-black border-black text-white"/>&nbsp;
						<input type="button" id="delete" value="삭제" class="typo-sm1 shrink-0 appearance-none rounded-50 border-1 py-6 px-14 bg-black border-black text-white"/>
					</div>
				</div>
			</header>
			
			
			<!-- 에피소드 작성 내용 -->
				<div class="h-0 flex-[1_1_auto] overflow-auto">
					<div class="flex flex-col mx-18 mt-30 max-w-[648px] desktop:mx-auto desktop:mt-64">
						
						<input type="hidden" id="num_novel" name="num_novel" value="<%= num_novel %>" />
						<input type="hidden" id="userNum" name="userNum" value="<%= userNum %>" />
						<input type="hidden" id="epNum" name="epNum" value="<%= epNum %>" />
						<input type="hidden" id="openStatus" name="openStatus" value="<%= selectVO.getOpenStatus() %>"/>
						
						<!-- 에피소드 제목 -->
						<input type="text" class="mb-24 border-0 border-b-1 border-black/10 px-0 pt-0 pb-16 text-24 outline-none desktop:pb-36 desktop:text-36"
							id="epTitle" name="epTitle" maxlength="50" value= "<%= selectVO.getEpTitle() %>">
						<textarea class="typo-md3 rounded-3 border-1 border-grey30 py-14 px-16 placeholder:text-grey60 flex-[1_1_100%] resize-none outline-none border-0 !p-0 text-15"
							id="detail" name="detail" rows="50" maxlength="2000" placeholder="내용을 입력하세요"><%= selectVO.getEpDetail() %> </textarea>
					</div>
				</div>
			
			<!-- 글자수 -->
			<div>
				<div class="flex mb-8 mr-0 justify-end desktop:mb-16 desktop:mr-22">
				<div class="flex py-4 px-8 text-12 text-grey40 desktop:text-14">
					<span class="mr-2 text-grey70"> 
						<span id="epLength" class="typo-g-sm2 -mb-[0.2em]"> 0</span>
					</span>
					<span class="mr-2 text-grey40">
						<span class="typo-g-sm2 -mb-[0.2em]">/ 2,000자</span>
					</span>
				</div>
				</div>
			</div>
			
			<div class="flex h-81 border-t-1 border-black/10 bg-white py-12 px-18 desktop:h-100 desktop:py-24 desktop:px-0">
			<label class="typo-md3 rounded-3 border-1 border-grey30 py-14 px-16 placeholder:text-grey60 flex-[1_1_100%] resize-none 
						outline-none my-0 mx-auto max-w-[648px] flex-[1_1_100%] border-0 !p-0 text-13 desktop:text-15">
			</label>
			</div>
				
		</form>
		
	</main>
		<div id="modal-normal"></div>
	</div>
	</div>
	</body>
</html>