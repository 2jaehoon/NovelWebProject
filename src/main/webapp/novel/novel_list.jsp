<%@page import="EpisodeVO.User.LookNovelVO"%>
<%@page import="EpisodeDAO.EpisodeDAO"%>
<%@page import="novel.NovelListVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="novel.NovelListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설-작가 | 소설조아</title>
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/font.css" />
<noscript data-n-css=""></noscript>
<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%
	//int novelNum = 44;
	int novelNum = Integer.parseInt(request.getParameter("num_novel")); 
	
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
function edit(){
	$("#edit_frm").submit();
}

$(function () {
	$("#del_novel").click(function () {
		$("#del_frm").submit();
	})
	 $.ajax({
			url : "novel_jsonarr_data.jsp",
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
							+ "<a class='flex w-full shrink' href='../episode/episodeMy/episode_edit.jsp?num_novel="+jsonObj.novelNum+"&epNum="+jsonObj.epNum+"'>"
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
})

</script>
</head>
<form action="/novelWebProject/novel/delete_novel_popup.jsp" id="del_frm" method="post" target="del_popup" onsubmit="window.open('/novelWebProject/novel/delete_novel_popup.jsp','del_popup','width= 504, height= 354, top = 100, left = 100');">
<input type="hidden" name="num_novel" value="<%=request.getParameter("num_novel")%>">
</form>
<%
NovelListDAO nDAO=new NovelListDAO();
String num_novel=request.getParameter("num_novel");
if(session.getAttribute("user_num_member").toString().equals(String.valueOf(nDAO.selectChk(num_novel)))){
	%>
<body>
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">

			<div class="flex flex-col h-full">
				<div class="z-1">
					
<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_login_search.jsp"/>
	</div>						
				</div>
				<main class="flex-1">
					<div class="relative -z-1"></div>
					<div class="flex-1">

						<main class="flex-1">
							<div class="flex flex-col min-h-[100vh]">
								<div
									class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
									<%
									try{
										NovelListVO nVO=nDAO.selectNovel(request.getParameter("num_novel"));
									%>
									<header class="relative overflow-hidden">
										<div class="flex my-48">
											<div class="flex flex-[0_0_auto]">
												<div
													class="flex relative shrink-0 items-start overflow-hidden h-181 w-116"
													style="height: 181px;">
													<span
														style="box-sizing: border-box; display: inline-block; overflow: hidden; width: 116px; height: 181px; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><img
														srcset="/novelWebProject/_next/static/images/novel_thumb/<%=nVO.getPhoto() %>" decoding="async"
														data-nimg="fixed"
														style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;">
													</span>
                                                    <%=nVO.getAge()==1?"<img class='absolute top-4 right-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                    <%=nVO.getEnd()==1?"<img class='absolute top-4 left-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
												</div>
											</div>
											<div class="flex flex-col ml-28 flex-1 items-start">
												<h1 class="typo-dp1 mb-8 flex items-center break-all"><%=nVO.getTitle() %>
														<span class="inline-flex flex-[0_0_auto] text-grey60 bg-grey20 border-grey20 !font-bold rounded-full typo-sm2 py-2 px-6 ml-8 align-middle align-[3px]">
															<%=nVO.getOpen()==1?"공개":"비공개" %>
														</span>
												</h1>
												<div class="flex typo-md3 items-center">
													<span><%=nVO.getId() %></span>
												</div>
												<div class="flex mt-30 flex-1 items-end">
													<div class="flex items-center">
														<a
															class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b mr-8"
															type="button"
															href="/novelWebProject/episode/episodeMy/episode_write.jsp?num_novel=<%=request.getParameter("num_novel")%>">연재 작품 쓰기</a>
														<a
															class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b mr-8"
															type="button" onclick="edit()">수정</a>
															<form action="/novelWebProject/novel/novel_edit.jsp" id="edit_frm" method="post">
															<input type="hidden" name="num_novel" value="<%=request.getParameter("num_novel")%>">
															</form>
														<button id="del_novel"
															class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b mr-8"
															>삭제</button>
													</div>
												</div>
											</div>
										</div>
									</header>
									<%
									}catch(SQLException se){
										se.printStackTrace();
									}
									%>
								</div>
								<div class="border-b-1 border-black/10">
									<div
										class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
										<div
											class="flex overflow-x-auto scrollbar-hide desktop:overflow-x-hidden">
											<a
												class="typo-md1-b mr-24 min-w-[fit-content] px-4 py-14 desktop:typo-lg3 border-b-2 !font-bold text-black">회차목록</a>
										</div>
									</div>
								</div>
								<div
									class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
									<div
										class="grid grid-cols-12 grid-rows-[auto] gap-x-12  w-full mt-32 mb-80 flex-1 desktop:mt-48 desktop:mb-0">
										<div class="flex flex-col col-span-full">
											<div>
												<div class="flex items-center">
													<div class="typo-dp3 mr-6">회차</div>
													<span
														class="typo-g-sm2 -mb-[0.2em] !typo-g-lg1 text-grey60">(<%= epDAO.countEp(novelNum) %>)</span>
												</div>
												<div
													class="flex w-full items-center justify-between border-b-1 py-16">
													<div
														class="relative typo-sm1 rounded-full bg-grey20 py-6 pl-14 pr-8 desktop:bg-transparent desktop:px-0 ml-8">
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
								</div>
							</div>
						</main>
	<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>
</body>

<%}else{
	%>
	<script type="text/javascript">
	alert("비정상적인 접근입니다");
	window.history.back();
	</script>
	<%
} %>
</html>
