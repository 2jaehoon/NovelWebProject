<%@page import="ManagerVO.MNovelLookVO"%>
<%@page import="ManagerDAO.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.

   if(session.getAttribute("sesId")==null){
     response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
  } 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet"	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<script type="text/javascript">
function deletePop(novelNum) {
    var popupUrlD = "manager_delete_popup.jsp?novelNum=" + novelNum;
    var popupD = window.open(popupUrlD, "popupD", "width=502,height=250,top="
        + (window.screenY + 100) + ",left=" + (window.screenX + 100));
}//deletePop
	
function publicPop(novelNum){
    var popupUrlPu = "manager_public_popup.jsp?novelNum=" + novelNum;
    var popupPu = window.open(popupUrlPu, "popupPu", "width=502,height=250,top="
        + (window.screenY + 100) + ",left=" + (window.screenX + 100));
}//publicPop

function privatePop(novelNum){
    var popupUrlPr = "manager_private_popup.jsp?novelNum=" + novelNum;
    var popupPr = window.open(popupUrlPr, "popupPr", "width=502,height=250,top="
        + (window.screenY + 100) + ",left=" + (window.screenX + 100));
}//privatePop
</script>
<style>
</style>
</head>
<body>

<%
	String title = request.getParameter("title");
	ManagerDAO mDAO = new ManagerDAO();
	MNovelLookVO nVO = mDAO.selectReportInfo(title);
	
	//신고 사유 코드 변환
	int reportReason = nVO.getReportReason(); 
	String reportReasonStr = String.valueOf(reportReason); 
	
	String reportValue = "";
	if (reportReason == 1) {
	    reportValue = "영리목적/홍보성";
	} else if (reportReason == 2) {
	    reportValue = "욕설/인신공격";
	} else if (reportReason == 3) {
	    reportValue = "불법정보";
	} else if (reportReason == 4) {
	    reportValue = "개인정보노출";
	} else if (reportReason == 5) {
	    reportValue = "음란성/선정성";
	} else if (reportReason == 6) {
	    reportValue = "같은 내용 도배";
	} else if (reportReason == 7) {
	    reportValue = "권리침해 신고";
	} else if (reportReason == 8) {
	    reportValue = "불법촬영물 유통 신고";
	} else if (reportReason == 9) {
	    reportValue = "기타 사유";
	}
%>	
<input type="hidden" name="novelNum" value="<%= nVO.getNovelNum() %>">

	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
				<div class="z-1">
					<header class="relative bg-white border-b-1 border-grey20">
					<div
						class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 flex-wrap items-center desktop:min-h-[72px] desktop:flex-nowrap desktop:py-12">
						<h1 class="sr-only">카카오페이지 스테이지</h1>
						<a
							class="ml-15 mr-16 max-w-[145px] flex-shrink flex-grow basis-0 py-[13.5px] desktop:ml-0 desktop:mr-32 desktop:max-w-[174px] desktop:py-0"
							href="/novelWebProject/manager/manager_home.jsp"><img class="object-contain" width="157" height="27"
							src="/novelWebProject/_next/static/images/logo.png"
							alt="소설조아 logo" /></a>
							<a
										class="typo-md1-b z-0 flex items-center py-[8.5px] ml-8 mr-8 px-16"
										href="/">
									</a> 
						<div
							class="flex order-1 basis-full desktop:order-none desktop:basis-auto">
							<div
								class="grid desktop:flex grid-flow-col flex-wrap max-w-full-view overflow-x-scroll overflow-y-hidden scrolling-touch desktop:overflow-x-visible desktop:overflow-y-visible before:grow-0 after:grow-0 before:content-[&quot;&quot;] after:content-[&quot;&quot;] before:flex-[0_1_0%] after:flex-[0_1_0%] desktop:after:hidden desktop:before:hidden auto-cols-max HorizontalScroll_horizontalScrollbar__5q9CM py-3">
							</div>
						</div>
						<div class="flex items-center ml-auto mr-15 desktop:mr-0">
								<a href="/novelWebProject/manager/manager_novel.jsp">
							<button
								class="typo-md3 ml-auto flex cursor-pointer items-center rounded-50 bg-transparent text-black desktop:border-1 desktop:desktop:bg-black desktop:px-13 desktop:py-7 desktop:text-white">돌아가기</button>
								</a>
								&nbsp;&nbsp;&nbsp;
								<a href="/novelWebProject/manager/manager_login.jsp">
							<button
								class="typo-md3 ml-auto flex cursor-pointer items-center rounded-50 bg-transparent text-black desktop:border-1 desktop:desktop:bg-black desktop:px-13 desktop:py-7 desktop:text-white">로그아웃</button>
								</a>
						</div>
					</div>
				</header>
				</div>

				<main class="flex-1">
					<section
						class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22">
						<div class="flex flex-col flex-1">
							<div class="mt-16 desktop:mb-48 desktop:mt-56">
								<div>
									<div class="flex mb-4 items-end" >
										<h1 class="typo-dp1 mr-40 flex-1 break-words"
											style="display: inline-flex;"><%=title%>
											&nbsp;
											<%
											if (nVO.getAgeAble() == 1) {//0 -> false(전체 이용가) //1 -> true(15세 이용가)
											%>
											<img alt="" src="/novelWebProject/_next/static/images/age.png"
												style="width: 45px; height: 42px">
											<% } %>
										</h1>
										<div
											class="flex w-full shrink-0 desktop:w-auto desktop:self-center">
											<div class="flex typo-g-sm2 flex-1 items-center text-grey60">
												<div
													class="relative overflow-visible mt-auto mb-0 desktop:my-auto">
													<button data-text-content="true"  id=""
														style="font-size: 16px; width: 69px; height: 38px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-radius: 4px; background-color: rgb(0, 0, 0); font-weight: bold;"
														 type="button" class="btn-delete" onclick="deletePop('<%= nVO.getNovelNum() %>')">삭제</button>
													<span style="display: inline-block; width: 10px;"></span>
													<button data-text-content="true"  id=""
														style="font-size: 16px; width: 69px; height: 38px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-radius: 4px; background-color: rgb(0, 0, 0); font-weight: bold;"
														type="button" class="btn-public" onclick="publicPop('<%= nVO.getNovelNum() %>')">공개</button>
													<span style="display: inline-block; width: 10px;"></span>
													<button data-text-content="true"  id=""
														style="font-size: 16px; width: 69px; height: 38px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-radius: 4px; background-color: rgb(0, 0, 0); font-weight: bold;"
														type="button" class="btn-private" onclick="privatePop('<%= nVO.getNovelNum() %>')">비공개</button>
												</div>
											</div>
										</div>

										<div class="flex shrink-0 items-center">
											<div class="relative overflow-visible"></div>
										</div>
									</div>
									<div class="flex typo-md3 items-center">
										<span><%= nVO.getId() %></span><span class="mx-4 text-10 mx-8 text-grey20"></span>
									</div>
									<div class="flex mt-30 items-center">
										<div
											class="flex relative shrink-0 items-start overflow-hidden mr-30 h-180 w-118 cursor-zoom-in"
											style="height: 180px;">
											<span
												style="box-sizing: border-box; display: inline-block; overflow: hidden; width: 118px; height: 180px; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><img
												src="/novelWebProject/_next/static/images/novel_thumb/<%= nVO.getThumbnail() %>"
												decoding="async"
												data-nimg="fixed"
												style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;"></span>
										</div>
										<div class="flex flex-col flex-1 self-stretch">
											<div
												class="typo-md3 text-14 text-grey70 desktop:max-w-[680px]">
												<span width="0"><span><span><%= nVO.getIntro() %></span><br>
														<span></span><br> <span></span></span><span
													style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><button
															class="font-bold">
															...<span class="ml-4 border-b-1 border-grey70">더보기</span>
														</button></span></span>
											</div>
											<div class="mt-auto"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="px-18 desktop:px-0"></div>
							<div class="border-b-1 py-9 desktop:border-b-2 desktop:py-12">
								<div class="flex typo-md3 items-center justify-between">
									<div class="flex typo-lg3-b items-center desktop:typo-lg1">
									<img alt="" src="/novelWebProject/_next/static/images/report.png" style="height: 50px; width: 50px">
										&nbsp; 신고
									</div>
								</div>
							</div>
							<section class="flex flex-col desktop:mb-96">

									 <%
									if (nVO.getReportCnt() != 0 ) {
									%> 
									<article>
									<a href="/novelWebProject/episode/novel.jsp?num_novel=<%=nVO.getNovelNum()%>" 
										class="flex border-black/10 bg-white px-18 visited:bg-grey10 desktop:border-b-1 desktop:px-30">
										<div
											class="border-b-1 border-black/10 desktop:border-0 flex flex-1 py-16 desktop:py-22">
											<div
												class="flex flex-col flex-1 justify-between desktop:mr-16 desktop:flex-row desktop:items-center">
												<div class="flex flex-col flex-1">
													<div
														class="flex mb-14 mt-0 flex-1 items-center desktop:mb-16 desktop:mt-2 typo-md2 text-black desktop:typo-lg2 max-h-[28px] overflow-hidden">
														<div class="truncate after:inline-block after:w-0 shrink"
															style="text-align: center;">
															신고 사유 : <%=reportValue%> | 신고 수 : <%=nVO.getReportCnt() %>회
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									</article>
								<%
								 } else { 
								%>
								<article>
									<a href="/novelWebProject/episode/novel.jsp?num_novel=<%=nVO.getNovelNum()%>" 
										class="flex border-black/10 bg-white px-18 visited:bg-grey10 desktop:border-b-1 desktop:px-30">
										<div
											class="border-b-1 border-black/10 desktop:border-0 flex flex-1 py-16 desktop:py-22">
											<div
												class="flex flex-col flex-1 justify-between desktop:mr-16 desktop:flex-row desktop:items-center">
												<div class="flex flex-col flex-1">
													<div
														class="flex mb-14 mt-0 flex-1 items-center desktop:mb-16 desktop:mt-2 typo-md2 text-black desktop:typo-lg2 max-h-[28px] overflow-hidden">
														<div class="truncate after:inline-block after:w-0 shrink"
															style="text-align: center;">
															신고된 정보가 없습니다.
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									</article>
								 <% } %> 

							</section>
						</div>
					</section>
				</main>
<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div>
</body>
</html>

