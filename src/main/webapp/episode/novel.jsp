<%@page import="java.sql.SQLException"%>
<%@page import="EpisodeVO.User.LookNovelVO"%>
<%@page import="EpisodeDAO.EpisodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/project3/_next/static/css/font.css" />
<noscript data-n-css=""></noscript>
<!-- jQuery CDN설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap"></style>

<%
	if(session.getAttribute("user_num_member")==null){
		response.sendRedirect("../login/loginpage.jsp");
		return;
	}

	int userNum = (Integer)session.getAttribute("user_num_member");
	int novelNum = Integer.parseInt(request.getParameter("num_novel")); 
	if(novelNum == 0){
%>
		<script type="text/javascript">
			alert("파라미터 novelNum의 값이 없음");
			response.sendRedirect("http://localhost/novelWebProject/home/main.jsp");
		</script>
<%	}
	
	String good = "http://localhost/novelWebProject/_next/static/images/good_on.png";
	String cancelGood = "http://localhost/novelWebProject/_next/static/images/good_off.png";

	// 선택한 회차 화면에 출력
 	EpisodeDAO epDAO = new EpisodeDAO();
	LookNovelVO selectNovelVO = null;
	try{
		// 에피소드 화면 출력
		selectNovelVO = epDAO.selectNovel(novelNum);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

<script type="text/javascript">

$(function(){
	 $.ajax({
		url : "episode_jsonarr_data.jsp",
		data : "num_novel=<%=request.getParameter("num_novel")%>",
		dataType : "JSON",
		error : function(xhr){
			alert("서버에서 문제가 발생했습니다. 다시 시도해주세요.");
			console.log(xhr.status);
		},
		success : function(jsonArr){
			var len = jsonArr.length;
			var article="";
			let cnt=0;
			
			$.each(jsonArr,function(idx, jsonObj){
				cnt++;
			 	article += "<article class='flex items-start border-b-1 border-black/10 py-16 px-0 desktop:py-22 desktop:px-30'>"
						+ "<div class='flex typo-g-md2 mt-2 mr-12 desktop:mr-16 desktop:typo-g-lg2'>"+len-- +"</div>"
						+ "<div class='flex flex-1 flex-col desktop:flex-row'>"
						+ "<a class='flex w-full shrink' href='episode_read.jsp?num_novel="+jsonObj.novelNum+"&epNum="+jsonObj.epNum+"'>"
						+ "<div class='flex flex-1 flex-col justify-start overflow-hidden desktop:mr-80'>"
						+ "<h3 class='flex typo-md2 desktop:typo-lg2 mb-8 items-center desktop:mb-16'>"
						+ "<div class='truncate after:inline-block after:w-0 shrink'>"+ jsonObj.epTitle+"</div></h3>"
						+ "<div class='flex typo-sm2 whitespace-pre-line text-grey60 desktop:whitespace-normal mb-14 desktop:mb-0'>"
						+ "<div class='flex flex-wrap items-center text-grey60'>"
						+ "<span>"+ jsonObj.viewCnt+"</span>"
						+ "<span class='mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8'>|</span>"
						+ "<span class='typo-g-sm2 -mb-[0.2em]'>"+ jsonObj.createDate + "</span>"
						+ "</div></div></div></a></div></article><br>"; 
			});//each
			
			if(cnt == 0){
				article="<label>작성한 에피소드가 없습니다.</label>";
			}//end if
			
			$("#empTab").append(article);
		}
	});//ajax
	
	// 조아요 공개
	$("#goodImg").click(function(){
		var good = "http://localhost/novelWebProject/_next/static/images/good_on.png";
		var cancelGood = "http://localhost/novelWebProject/_next/static/images/good_off.png";
		
		if($(this).attr("src") == cancelGood){	
			alert("좋아요");
			$("#good").val(1); // 좋아요?
		}else if($(this).attr("src") == good){	
			alert("좋아요 취소");
			$("#good").val(0);  // 좋아요 취소
		} 
		$("#likeFrm").submit();
	}); //private
	
	// 신고하기
	$("#reportImg").click(function(){
		window.open("report_popup.jsp?num_novel=<%=novelNum%>&id=<%= selectNovelVO.getId() %>","popup","width=500,height=803,resizable=no,top="+(window.screenY+100) +",left="+(window.screenX+100));
		//window.close();
	});
	
	// 첫화 보기
	$("#firstEp").click(function(){
		if(<%=epDAO.selectFirstEp(novelNum)%> == 0){
			alert("작성한 에피소드가 없습니다.");
			return;
		}
		location.href='episode_read.jsp?num_novel=<%=novelNum%>&epNum=<%=epDAO.selectFirstEp(novelNum)%>';
	});
	
	
});//ready
</script>

</head>

<body>
	
	<div id="__next" data-reactroot="">
	<div style="display: none; background-color: canvas; color-scheme: light"></div>
	<div class="lightMode h-full">
	<div class="flex flex-col h-full">
	<div class="z-1">
					
	<!-- header -->
	<%if(!session.getAttribute("user_num_member").toString().equals("0")){ %>
	<div>
		<jsp:include page="../_next/header_user_login_search.jsp"/>
	</div>		
	<%} %>				
	</div>
	
	<main class="flex-1">
		<div class="relative -z-1"></div>
		<div class="flex-1">

		<main class="flex-1">
			<div class="flex flex-col min-h-[100vh]">
			<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
				
				<header class="relative overflow-hidden">
					<div class="flex my-48">
					<div class="flex flex-[0_0_auto]">
						<div class="flex relative shrink-0 items-start overflow-hidden h-181 w-116" style="height: 181px;">
							<span style="box-sizing: border-box; display: inline-block; overflow: hidden; width: 116px; height: 181px; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
							<img src="http://localhost/novelWebProject/_next/static/images/novel_thumb/<%= selectNovelVO.getThumbnail() %>" decoding="async"
								data-nimg="fixed" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;">
							</span>
						</div>
					</div>
					<div class="flex flex-col ml-28 flex-1 items-start">
						<h1 class="typo-dp1 mb-8 flex items-center break-all"><%= selectNovelVO.getNovelTitle() %></h1>
						<div class="flex typo-md3 items-center">
							<span><%= selectNovelVO.getId() %></span><br><br>
						</div>
						<div><%= selectNovelVO.getIntro() %></div>
						<div class="flex mt-30 flex-1 items-end">
						
						
							<div class="flex items-center">
								<button class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b mr-8"
									id="firstEp" type="button" >첫회 읽기</button>
									&nbsp;&nbsp;&nbsp;
									
								<!-- 좋아요 -->
								<label><%= epDAO.cntLike(novelNum) %></label>
 								<img id="goodImg" src=<%= epDAO.confirmLike(userNum, novelNum)== 1 ? "http://localhost/novelWebProject/_next/static/images/good_on.png":"http://localhost/novelWebProject/_next/static/images/good_off.png"%> alt="좋아요"/>

								<form action="like_process.jsp" id="likeFrm" method="post">
									<input type="hidden" id="userNum" name="userNum" value="<%= userNum %>"/>
									<input type="hidden" id="num_novel" name="num_novel" value="<%= novelNum %>" />
									<input type="hidden" id="id" name="id" value="<%= selectNovelVO.getId() %>"/>
									<input type="hidden" id="good" name="good" value=""/>
								</form>	
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								
								<!-- 신고 버튼 -->
								<img id="reportImg" src="http://localhost/novelWebProject/_next/static/images/report.png" style="width: 40px; height: 40px;" alt="신고"/>
								<label><%= epDAO.cntReport(novelNum) %></label>
								
								<form action="report_popup.jsp" id="reportFrm" method="post">
									<input type="hidden" id="userNum" name="userNum" value="<%= userNum %>"/>
									<input type="hidden" id="num_novel" name="num_novel" value="<%= novelNum %>" />
									<input type="hidden" id="id" name=id value="<%= selectNovelVO.getId() %>"/>
								</form>
								
							</div>
						
						</div>
					</div>
					</div>
				</header>
			</div>
			
			<!-- 회차 개수 -->
			<div class="border-b-1 border-black/10">
				<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
					<div class="flex overflow-x-auto scrollbar-hide desktop:overflow-x-hidden">
						<a class="typo-md1-b mr-24 min-w-[fit-content] px-4 py-14 desktop:typo-lg3 border-b-2 !font-bold text-black">회차목록</a>
					</div>
				</div>
			</div>
			
			<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
			<div class="grid grid-cols-12 grid-rows-[auto] gap-x-12  w-full mt-32 mb-80 flex-1 desktop:mt-48 desktop:mb-0">
			<div class="flex flex-col col-span-full">
			<div>
				<div class="flex items-center">
					<div class="typo-dp3 mr-6">회차</div>
					<span class="typo-g-sm2 -mb-[0.2em] !typo-g-lg1 text-grey60">(<%= epDAO.countEp(novelNum) %>)</span>
				</div>
				<div class="flex w-full items-center justify-between border-b-1 py-16">
					<div class="relative typo-sm1 rounded-full bg-grey20 py-6 pl-14 pr-8 desktop:bg-transparent desktop:px-0 ml-8">
						<path fill-rule="evenodd" clip-rule="evenodd"
							d="M7.99936 11L2.99872 6.06282L4.05259 4.99541L7.99936 8.8921L11.9461 4.99541L13 6.06282L7.99936 11Z"
							fill="currentColor"></path>
					</div>
				</div>
			</div>
				
			<!-- 회차 목록들 -->
			<div id="empTab">
			
			</div>
			
		</div>
		</div>
		</main>
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>
</body>
</html>
