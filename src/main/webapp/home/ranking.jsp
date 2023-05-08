<%@page import="novel.RankingVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="novel.RankingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>랭킹 | 소설조아</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet"	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="html_prj/common/main_v20230217.css">
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>

</head>
<body>
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
<!-- header -->
	<div>
		<%if(session.getAttribute("user_id")!=null){ %>
		<jsp:include page="../_next/header_user_login_search.jsp"/>
		<%}else{ %>
		<jsp:include page="../_next/header_user_logout_key.jsp"/>
		<%}%>
	</div>
				<main class="flex-1">
					<section class="flex flex-col">
						<div class="bg-grey10">
							<div
								class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18 relative py-20">
								<div
									class="flex mt-16 w-full items-center border-none border-black/10 max-w-full-view first:mt-0">
									<div class="typo-md3 w-103 flex-[0_0_auto] px-0">랭킹종류</div>
									<div
										class="grid desktop:flex grid-flow-col flex-wrap max-w-full-view overflow-x-scroll overflow-y-hidden scrolling-touch desktop:overflow-x-visible desktop:overflow-y-visible before:grow-0 after:grow-0 before:content-[&quot;&quot;] after:content-[&quot;&quot;] before:flex-[0_1_0%] after:flex-[0_1_0%] desktop:after:hidden desktop:before:hidden auto-cols-max before:w-16 after:w-16 HorizontalScroll_horizontalScrollbar__5q9CM">
										<button onclick="location.href='/novelWebProject/home/ranking.jsp?type=0'"
											class="typo-sm1 mr-8 rounded-20 py-[3.5px] px-10 <%=request.getParameter("type").equals("0")?"bg-black text-white":"text-grey70" %>">일간</button>
										<button onclick="location.href='/novelWebProject/home/ranking.jsp?type=1'"
											class="typo-sm1 mr-8 rounded-20 py-[3.5px] px-10 <%=request.getParameter("type").equals("1")?"bg-black text-white":"text-grey70" %>">주간</button>
										<button onclick="location.href='/novelWebProject/home/ranking.jsp?type=2'"
											class="typo-sm1 mr-8 rounded-20 py-[3.5px] px-10 <%=request.getParameter("type").equals("2")?"bg-black text-white":"text-grey70" %>">월간</button>
									</div>
								</div>
							</div>
						</div>
						<div
							class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 my-0 h-full w-full desktop:my-24">
							<div class="flex flex-col flex-1">
								<div class="col-span-full grid gap-x-64 desktop:grid-cols-2">
                                  	<%
                                    RankingDAO rDAO=new RankingDAO();
                                    try{
                                    	List<RankingVO> list=rDAO.selectRanking(Integer.parseInt(request.getParameter("type")));
                                    	for(int i=0;i<30&&i<list.size();i++){
                                    %>
									<a class="px-18 py-12 desktop:px-0 desktop:py-24" href="../episode/novel.jsp?num_novel=<%=list.get(i).getNum_novel()%>">
										<div
											class="flex items-center flex-row w-full flex-row-reverse"
											data-testid="skeleton">
											<div class="relative overflow-hidden rounded-3 bg-grey10 w-80 h-122 desktop:h-125 ml-16">
												<img alt="썸네일 이미지" src="/novelWebProject/_next/static/images/novel_thumb/<%=list.get(i).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                <%=list.get(i).getAge()==1?"<img class='absolute top-4 right-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(i).getEnd()==1?"<img class='absolute top-4 left-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
											</div>
											<div class="flex flex-col w-full flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate" style="font-size: 18px"><%=list.get(i).getTitle()%></span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2"><%=list.get(i).getStory()%></p><br/>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <%-- <span class="typo-sm2 flex items-center">
                                                                                연재<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(i).getEpisode()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span> --%>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(i).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(i).getLike()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                <%=list.get(i).getId()%>
                                                                            </span>
                                                                        </div>
											</div>
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span style="transform: translateY(-150%);font-size: 25px"><%=i+1%></span>
                                                                    </div>
										</div>
									</a>
									
                                    <%
                                    	}//end for
                                    }catch(SQLException se){
                                     	se.printStackTrace();
                                    }//end catch
                                            %>
									
									
								</div>
							</div>
						</div>
					</section>
				</main>
<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div> 
			</div>
		</div>
		<div id="modal-normal"></div>
	</div>
</body>
</html>