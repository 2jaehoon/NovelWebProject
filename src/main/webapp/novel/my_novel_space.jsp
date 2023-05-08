<%@page import="java.sql.SQLException"%>
<%@page import="novel.MyNovelDAO"%>
<%@page import="novel.MyNovelVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>창작공간 | 소설조아</title>
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />		
<noscript data-n-css=""></noscript>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">

$(function () {
	$("#order_novel").change(function() {
		$("#frm2").submit();
	})
})
function novel(num_novel) {
	$("#"+num_novel).submit();
}
function new_novel() {
	$("#new_novel").submit();
}

</script>

</head>
<%
if(session.getAttribute("user_id")!=null){
	String id=session.getAttribute("user_id").toString();
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
						<header>
							<div class="flex w-full justify-center">
								<div class="flex flex-col mx-18 w-full desktop:max-w-[840px]">
									<div
										class="flex flex-col items-start justify-center py-32 desktop:flex-row desktop:justify-between desktop:pt-63 desktop:pb-40">
										<div
											class="mb-24 px-6 py-8 desktop:mb-0 desktop:px-0 desktop:py-0">
											<h1 class="typo-dp2 mb-6 desktop:typo-dp1">
												<div><%=id%>님의</div>
												<div class="-mt-4 desktop:mt-0">창작공간</div>
											</h1>
										</div>
										<div
											class="flex w-full shrink-0 desktop:my-2 desktop:h-full desktop:w-auto desktop:items-center desktop:pb-26">
											<a class="flex-1 desktop:flex-none" onclick="new_novel()"><button
													class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b w-full border-1 !border-black"
													type="button">
													 <form action="/novelWebProject/novel/novel_regi.jsp" id="new_novel" method="post">
													 </form>
													<span class="">새 소설 등록</span>
												</button></a>
										</div>
									</div>
								</div>
							</div>
						</header>
						<div class="border-b-1 border-black/10">
							<div class="flex w-full justify-center">
								<div class="flex flex-col mx-18 w-full desktop:max-w-[840px]">
									<div class="flex">
										<a
											class="typo-md1-b mr-24 min-w-[fit-content] px-4 py-14 desktop:typo-lg3 border-b-2 !font-bold text-black">연재작</a>
									</div>
								</div>
							</div>
						</div>
						<div class="flex w-full justify-center">
							<div class="flex flex-col mx-18 w-full desktop:max-w-[840px]">
								<div
									class="grid desktop:flex grid-flow-col flex-wrap max-w-full-view overflow-x-scroll overflow-y-hidden scrolling-touch desktop:overflow-x-visible desktop:overflow-y-visible before:grow-0 after:grow-0 before:content-[&quot;&quot;] after:content-[&quot;&quot;] before:flex-[0_1_0%] after:flex-[0_1_0%] desktop:after:hidden desktop:before:hidden auto-cols-max before:w-18 after:w-18 HorizontalScroll_horizontalScrollbar__5q9CM -mx-18 desktop:mx-0">
									<div
										class="flex mt-8 items-center py-8 desktop:mt-24 desktop:mb-8 desktop:w-full desktop:py-0">
										<div class="flex ml-0 items-center desktop:ml-auto">
											<div
												class="relative typo-sm1 rounded-full bg-grey20 py-6 pl-14 pr-8 desktop:bg-transparent desktop:px-0">
												<form id="frm2" name="frm2" method="post" >
												<select id="order_novel" name="order_novel" class="w-full typo-sm1 desktop:text-grey70">
													<option value="0" <%=(request.getParameter("order_novel").equals("0"))?"selected":""%>>신작 순</option>
													<option value="1" <%=(request.getParameter("order_novel").equals("1"))?"selected":""%>>오래된 순</option>
												</select>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div>
								<%
								MyNovelDAO mDAO = new MyNovelDAO();
														try{
															List<MyNovelVO> selectList = mDAO.selectNovelAll(id.toString(), request.getParameter("order_novel"));
															
															pageContext.setAttribute("selList", selectList);
								%>
									<c:forEach var="select" items="${ selList  }" varStatus="sNum">
								
									<div
										class="border-black/10 desktop:border-b-1 desktop:pt-24 desktop:pb-24">
										<div class="flex items-center py-8 desktop:py-0">
											<a class="relative flex flex-1 items-center" onclick="novel(${select.num_novel })">
												<form action="/novelWebProject/novel/novel_list.jsp" id="${select.num_novel }" method="post">
													<input type="hidden" name="num_novel" value="${select.num_novel }">
												</form>
												<div
													class="flex relative shrink-0 items-start overflow-hidden mr-16 w-80 desktop:mr-24"
													style="height: 125px;">
													<span style="box-sizing: border-box; display: inline-block; overflow: hidden; width: 80px; height: 125px; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
														<img
														alt="ㄴㄹㅇㄹ"
														srcset="/novelWebProject/_next/static/images/novel_thumb/${select.thumbnail}"
														src="/novelWebProject/_next/static/images/novel_thumb/${select.thumbnail}" decoding="async"
														data-nimg="fixed"
														style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;"
														>
                                          		${select.ageAble?"<img class='absolute top-4 right-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""}
                                          		${select.end==1?"<img class='absolute top-4 left-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""}
														
													</span>
												</div>
												<div class="flex flex-col flex-1 justify-center">
													<div
														class="typo-md2 mb-2 flex w-full items-center desktop:typo-md1 desktop:mb-4"
														data-testid="novel-title">
														<div class="shrink truncate">${select.novelTitle }</div>
														<span class="inline-flex flex-[0_0_auto] text-grey60 bg-grey20 border-grey20 !font-bold rounded-full typo-sm2 py-2 px-6 ml-8 align-middle align-[3px]">
															<c:choose>
																<c:when test="${ select.openStatus }">
																공개
																</c:when>
																<c:otherwise>
																비공개
																</c:otherwise>
															</c:choose>
														</span>
													</div>
													<div
														class="flex flex-wrap items-center text-grey60 break-all">
														<div class="typo-sm2 inline-flex">
														</div>
													</div>
												</div></a>
										</div>
									</div>
								
									</c:forEach>
									<% 
								}catch(SQLException e){
									e.printStackTrace();
								}
								%>
									
									<div
										class="flex items-center justify-center py-8 mx-auto mt-40">
										<a
											class="flex h-34 w-34 items-center justify-center pointer-events-none mr-20 !w-24 opacity-40"
											href="/workshop?page=-1"><svg width="24" height="24"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg" role="img"
												class="rotate-180" title="prev">
											<path fill-rule="evenodd" clip-rule="evenodd"
													d="M18.0605 12.0001L8.99989 21.0608L7.93923 20.0001L15.9392 12.0001L7.93923 4.00011L8.99989 2.93945L18.0605 12.0001Z"
													fill="currentColor"></path></svg></a><a
											class="flex h-34 w-34 items-center justify-center mx-4"
											href="/workshop?page=0"><div
												class="flex typo-g-sm1 flex h-full w-full items-center justify-center rounded-full bg-black !font-bold text-white">1</div></a><a
											class="flex h-34 w-34 items-center justify-center pointer-events-none ml-20 !w-24 opacity-40"
											href="/workshop?page=1"><svg width="24" height="24"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg" role="img" title="next">
											<path fill-rule="evenodd" clip-rule="evenodd"
													d="M18.0605 12.0001L8.99989 21.0608L7.93923 20.0001L15.9392 12.0001L7.93923 4.00011L8.99989 2.93945L18.0605 12.0001Z"
													fill="currentColor"></path></svg></a>
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
