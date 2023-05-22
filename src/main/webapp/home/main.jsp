<%@page import="java.sql.SQLException"%>
<%@page import="novel.RankingVO"%>
<%@page import="java.util.List"%>
<%@page import="novel.RankingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>홈 | 소설조아</title>
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet"	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="/project2/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>

</head>
<body>
	<div id="__next" data-reactroot="">
		<div style="display: none; background-color: canvas; color-scheme: light"></div>
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
                        <div>
                            <div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
                                <div class="grid grid-cols-12 grid-rows-[auto] gap-x-12  w-full mt-56 mb-62 gap-y-64 gap-x-0">
                                    <div class="flex flex-col col-[1/9] pr-26">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center pb-16">
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">일간 랭킹</h2>
                                            </div>
                                            <%
                                            	RankingDAO rDAO=new RankingDAO();
                                            	try{
                                            		List<RankingVO> list=rDAO.selectRanking(0);
   
                                            		if(list.isEmpty()){
                                            		%>
                                            		작성된 에피소드가 없습니다.
                                            		<%
                                            		}else{
                                            %>
                                            <div class="grid grid-cols-1 gap-y-16 px-0 desktop:grid-cols-2 desktop:gap-x-34 desktop:gap-y-24 desktop:pl-30">
                                                <div class="col-span-2">
                                                    <a class="flex flex-col bg-grey10 py-20 px-18 desktop:-ml-30 desktop:py-30 desktop:px-30" href="../episode/novel.jsp?num_novel=<%=list.get(0).getNum_novel()%>">
                                                        <article class="flex items-center items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden ml-15 h-125 w-80 desktop:ml-0 desktop:h-[233px] desktop:w-149 order-1" style="height:233px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:149px;height:233px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="썸네일 이미지" src="/project2/_next/static/images/novel_thumb/<%=list.get(0).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="스트리밍 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=250&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(0).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(0).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center !typo-g-lg1 mr-16 w-16 desktop:ml-24 desktop:w-26">
                                                                        <span>1</span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-lg3 mb-2 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(0).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 mb-16 text-grey70 desktop:typo-md3 desktop:mb-8">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(0).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60 desktop:mb-20">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60" style="-webkit-line-clamp:4"><%=list.get(0).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%for(int i=1;i<5;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="col-start-1 desktop:col-[span_1/auto]">
                                                    <a class="flex items-center" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <article class="flex items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden h-98 w-64 desktop:h-125 desktop:w-80 order-1" style="height:125px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span><%=j+1 %></span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2"><%=list.get(j).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%} %>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="flex flex-col col-[9/-1] ml-30">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center border-b-1 border-black pb-16">
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp </h2>
                                                <a class="typo-md3 ml-auto flex items-center text-black desktop:text-grey60" href="/project2/home/ranking.jsp?type=0">
                                                    <span class="mr-4 hidden desktop:inline">더보기</span>
                                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11 8.00064L6.06282 13.0013L4.99541 11.9474L8.8921 8.00064L4.99541 4.05387L6.06282 3L11 8.00064Z" fill="currentColor"></path>
                                                    </svg>
                                                </a>
                                                <div class="flex ml-auto border-1 border-grey20">
                                                </div>
                                            </div>
                                            <div class="flex flex-col">
                                            <%for(int i=5;i<10;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="flex flex-col border-b-0 desktop:border-b-1 border-black/10 py-8 desktop:py-16 desktop:px-0  desktop:last-of-type:border-b-0 desktop:last-of-type:pb-0">
                                                    <a class="flex items-center flex-row" data-testid="skeleton" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <div class="relative overflow-hidden rounded-3 bg-grey10 w-64 desktop:w-56 h-98 desktop:h-88 mr-14">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                        </div>
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span style="transform: translateY(-100%);"><%=j+1%></span>
                                                                    </div>
                                                        <div class="flex flex-col w-full flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            <%} %>
                                            </div>
                                            <%
                                            		}//else
                                            	}catch(SQLException se){
                                            		se.printStackTrace();
                                            	}
                                            %>
                                        </section>
                                    </div>
<!--																				-->
                                    <div class="flex flex-col col-[1/9] pr-26">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center pb-16">
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">주간 랭킹</h2>
                                            </div>
                                            <%
                                            	try{
                                            		List<RankingVO> list=rDAO.selectRanking(1);
                                            		if(list.isEmpty()){
                                                		%>
                                                		작성된 에피소드가 없습니다.
                                                		<%
                                                		}else{
                                            %>
                                            <div class="grid grid-cols-1 gap-y-16 px-0 desktop:grid-cols-2 desktop:gap-x-34 desktop:gap-y-24 desktop:pl-30">
                                                <div class="col-span-2">
                                                    <a class="flex flex-col bg-grey10 py-20 px-18 desktop:-ml-30 desktop:py-30 desktop:px-30" href="../episode/novel.jsp?num_novel=<%=list.get(0).getNum_novel()%>">
                                                        <article class="flex items-center items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden ml-15 h-125 w-80 desktop:ml-0 desktop:h-[233px] desktop:w-149 order-1" style="height:233px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:149px;height:233px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="썸네일 이미지" src="/project2/_next/static/images/novel_thumb/<%=list.get(0).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="스트리밍 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=250&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(0).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center !typo-g-lg1 mr-16 w-16 desktop:ml-24 desktop:w-26">
                                                                        <span>1</span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-lg3 mb-2 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(0).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 mb-16 text-grey70 desktop:typo-md3 desktop:mb-8">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(0).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60 desktop:mb-20">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60" style="-webkit-line-clamp:4"><%=list.get(0).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%for(int i=1;i<5;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="col-start-1 desktop:col-[span_1/auto]">
                                                    <a class="flex items-center" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <article class="flex items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden h-98 w-64 desktop:h-125 desktop:w-80 order-1" style="height:125px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                            
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span><%=j+1 %></span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2"><%=list.get(j).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%} %>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="flex flex-col col-[9/-1] ml-30">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center border-b-1 border-black pb-16">
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp </h2>
                                                <a class="typo-md3 ml-auto flex items-center text-black desktop:text-grey60" href="/project2/home/ranking.jsp?type=1">
                                                    <span class="mr-4 hidden desktop:inline">더보기</span>
                                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11 8.00064L6.06282 13.0013L4.99541 11.9474L8.8921 8.00064L4.99541 4.05387L6.06282 3L11 8.00064Z" fill="currentColor"></path>
                                                    </svg>
                                                </a>
                                                <div class="flex ml-auto border-1 border-grey20">
                                                </div>
                                            </div>
                                            <div class="flex flex-col">
                                            <%for(int i=5;i<10;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="flex flex-col border-b-0 desktop:border-b-1 border-black/10 py-8 desktop:py-16 desktop:px-0  desktop:last-of-type:border-b-0 desktop:last-of-type:pb-0">
                                                    <a class="flex items-center flex-row" data-testid="skeleton" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <div class="relative overflow-hidden rounded-3 bg-grey10 w-64 desktop:w-56 h-98 desktop:h-88 mr-14">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                        </div>
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span style="transform: translateY(-100%);"><%=j+1%></span>
                                                                    </div>
                                                        <div class="flex flex-col w-full flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            <%} %>
                                            </div>
                                            <%}
                                            	}catch(SQLException se){
                                            		se.printStackTrace();
                                            	}
                                            %>
                                        </section>
                                    </div>
<!--																				-->
                                    <div class="flex flex-col col-[1/9] pr-26">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center pb-16" >
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">월간 랭킹</h2>
                                            </div>
                                            <%
                                            	try{
                                            		List<RankingVO> list=rDAO.selectRanking(2);
                                            		if(list.isEmpty()){
                                                		%>
                                                		작성된 에피소드가 없습니다.
                                                		<%
                                                		}else{
                                            %>
                                            <div class="grid grid-cols-1 gap-y-16 px-0 desktop:grid-cols-2 desktop:gap-x-34 desktop:gap-y-24 desktop:pl-30">
                                                <div class="col-span-2">
                                                    <a class="flex flex-col bg-grey10 py-20 px-18 desktop:-ml-30 desktop:py-30 desktop:px-30" href="../episode/novel.jsp?num_novel=<%=list.get(0).getNum_novel()%>">
                                                        <article class="flex items-center items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden ml-15 h-125 w-80 desktop:ml-0 desktop:h-[233px] desktop:w-149 order-1" style="height:233px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:149px;height:233px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="썸네일 이미지" src="/project2/_next/static/images/novel_thumb/<%=list.get(0).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="스트리밍 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=250&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FrdsqY%2FbtrXVRY8hQm%2F2v5pbDaqEgWlFV6HlrnK00%2Foriginal.jpeg&amp;w=350&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(0).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center !typo-g-lg1 mr-16 w-16 desktop:ml-24 desktop:w-26">
                                                                        <span>1</span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-lg3 mb-2 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(0).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 mb-16 text-grey70 desktop:typo-md3 desktop:mb-8">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(0).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60 desktop:mb-20">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(0).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60" style="-webkit-line-clamp:4"><%=list.get(0).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%for(int i=1;i<5;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="col-start-1 desktop:col-[span_1/auto]">
                                                    <a class="flex items-center" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <article class="flex items-center">
                                                            <div class="flex relative shrink-0 items-start overflow-hidden h-98 w-64 desktop:h-125 desktop:w-80 order-1" style="height:125px">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                            
                                                            </div>
                                                            <div class="flex flex-col order-2 flex-1">
                                                                <div class="flex">
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span><%=j+1 %></span>
                                                                    </div>
                                                                    <div class="flex flex-col flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2"><%=list.get(j).getStory()%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </article>
                                                    </a>
                                                </div>
                                                <%} %>
                                            </div>
                                        </section>
                                    </div>
                                    <div class="flex flex-col col-[9/-1] ml-30">
                                        <section>
                                            <div class="flex flex-wrap w-full items-start desktop:items-center border-b-1 border-black pb-16">
                                                <h2 class="typo-lg3-b flex-1 break-normal desktop:typo-lg1 desktop:flex-initial">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp </h2>
                                                <a class="typo-md3 ml-auto flex items-center text-black desktop:text-grey60" href="/project2/home/ranking.jsp?type=2">
                                                    <span class="mr-4 hidden desktop:inline">더보기</span>
                                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11 8.00064L6.06282 13.0013L4.99541 11.9474L8.8921 8.00064L4.99541 4.05387L6.06282 3L11 8.00064Z" fill="currentColor"></path>
                                                    </svg>
                                                </a>
                                                <div class="flex ml-auto border-1 border-grey20">
                                                </div>
                                            </div>
                                            <div class="flex flex-col">
                                            <%for(int i=5;i<10;i++){int j=i;if(i>list.size()-1){j=list.size()-1;} %>
                                                <div class="flex flex-col border-b-0 desktop:border-b-1 border-black/10 py-8 desktop:py-16 desktop:px-0  desktop:last-of-type:border-b-0 desktop:last-of-type:pb-0">
                                                    <a class="flex items-center flex-row" data-testid="skeleton" href="../episode/novel.jsp?num_novel=<%=list.get(j).getNum_novel()%>">
                                                        <div class="relative overflow-hidden rounded-3 bg-grey10 w-64 desktop:w-56 h-98 desktop:h-88 mr-14">
                                                                <span style="box-sizing:border-box;display:inline-block;overflow:hidden;width:80px;height:125px;background:none;opacity:1;border:0;margin:0;padding:0;position:relative">
                                                                    <img alt="" src="/project2/_next/static/images/novel_thumb/<%=list.get(j).getPhoto() %>" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover"/>
                                                                    <noscript>
                                                                        <img alt="서림동 편지 가게 : 유난히 긴 밤을 걷는 자들을 위해 열립니다. 썸네일 이미지" srcSet="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=80&amp;q=75 1x, /_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75 2x" src="/_next/image?url=https%3A%2F%2Fdn-api1-kage.kakao.com%2Fdn%2FsWOwd%2FbtrZclrilZ3%2FJr5jLK8U4HCSDRSK47nsK1%2Foriginal.jpeg&amp;w=250&amp;q=75" decoding="async" data-nimg="fixed" style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%;object-fit:cover" loading="lazy"/>
                                                                    </noscript>
                                                                </span>
                                                                <%=list.get(j).getAge()==1?"<img class='absolute top-4 right-4' src='/project2/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""%>
                                                                <%=list.get(j).getEnd()==1?"<img class='absolute top-4 left-4' src='/project2/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""%>
                                                        </div>
                                                                    <div class="flex flex-col typo-g-md1 items-center ml-16 mr-12 w-11 desktop:mx-8 desktop:w-26">
                                                                        <span style="transform: translateY(-100%);"><%=j+1%></span>
                                                                    </div>
                                                        <div class="flex flex-col w-full flex-1">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate"><%=list.get(j).getTitle()%></span>
                                                                        </div>
                                                                        <div class="typo-sm2 flex text-grey70 typo-sm2 mb-8 text-grey70">
                                                                            <div class="truncate after:inline-block after:w-0"><%=list.get(j).getId()%></div>
                                                                        </div>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                조회<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getVisit()%></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                좋아요<span class="typo-g-sm2 -mb-[0.2em] ml-4"><%=list.get(j).getLike()%></span>
                                                                            </span>
                                                                        </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            <%} %>
                                            </div>
                                            <%
                                                		}
                                            	}catch(SQLException se){
                                            		se.printStackTrace();
                                            	}
                                            %>
                                        </section>
                                    </div>
<!-- 																	 -->
                                </div>
                               </div>
                              </div>
                             </main>
<!-- footer -->
	<div>
		<jsp:include page="../_next/footer.jsp"/>
	</div> 
			</div>
		</div>
	</div>
	
</body>
</html>