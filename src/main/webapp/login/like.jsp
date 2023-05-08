<%@page import="java.util.List"%>
<%@page import="novel.MyLikeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="novel.MyLikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>좋아요 소설 | 소설조아</title>
<link rel="preconnect" href="https://fonts.gstatic.com"
	crossorigin="anonymous" />
<link rel="stylesheet"
	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"
	as="style" />
<link rel="stylesheet"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"
	data-n-g="" />
<link rel="preload"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"
	as="style" />
<link rel="stylesheet"
	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/593189bb3d3dd926.css"
	data-n-p="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />	
<noscript data-n-css=""></noscript>
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<script type="text/javascript">

$(function () {
	$("#order_novel").change(function() {
		$("#frm").submit();
	})
})
function selectNovel(num_novel){
	location.href="/novelWebProject/episode/novel.jsp?num_novel="+num_novel;
}
function findNovel(){
	frm.submit();
}
function deleteNovel(num_novel){
	location.href="/novelWebProject/novel/delete_like.jsp?num_novel="+num_novel;
}
</script>
</head>
	

<body>
	<div id="__next" data-reactroot="">
		<div
			style="display: none; background-color: canvas; color-scheme: light"></div>
		<div class="lightMode h-full">
			<div class="flex flex-col h-full">
			
<!-- header -->
	<div>
		<jsp:include page="../_next/header_user_login_search.jsp"/>
	</div>	
				
				<main class="flex-1">
					<section class="flex flex-col">
						<div style="border-bottom: 1px solid #eee;">
							<div
								class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18 relative py-20">
								<form id="frm" name="frm" action="/novelWebProject/login/like.jsp"
									class="flex mt-16 w-full items-center border-none border-black/10 max-w-full-view first:mt-0">
									<div class="typo-md3 w-103 flex-[0_0_auto] px-0" style="font-size: 20px">좋아요 소설</div>
									
												<select id="order_novel" name="order_novel" class="w-full typo-sm1 desktop:text-grey70" style="width: 50px; margin-left: 500px">
													<option value="0" <%=(request.getParameter("order_novel").equals("0"))?"selected":""%>>최신 순</option>
													<option value="1" <%=(request.getParameter("order_novel").equals("1"))?"selected":""%>>오래된 순</option>
												</select>
								<div class="flex w-full items-center" style="position: absolute;right: 10px;width: 300px;background-color: white;">
									<img onclick="findNovel()"
										src="/novelWebProject/_next/static/images/search.png"
										width="24" height="24" > &nbsp;
									<div style="width: 250px">
										<input onKeypress="javascript:if(event.keyCode==13){findNovel()}"
										class="flex-1 bg-transparent text-el-60 outline-none placeholder:text-el-40 disabled:text-el-35 font-small1"
										style="width: 250px"
										name="search" maxLength="50" placeholder=" 제목을 입력하세요." size="1" />
									</div>
								</div>
								</form>
							</div>
						</div>
						<div
							class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 my-0 h-full w-full desktop:my-24">
							<div class="flex flex-col flex-1">
								<div class="col-span-full grid gap-x-64 desktop:grid-cols-2">
								
								<%
																MyLikeDAO mDAO=new MyLikeDAO();
																						try{
																							List<MyLikeVO> selectList=mDAO.selectNovelAll(session.getAttribute("user_num_member").toString(),request.getParameter("search"),request.getParameter("order_novel"));
																							pageContext.setAttribute("selList", selectList);
																%>
								
								<c:forEach var="select" items="${selList}" >
									<div class="px-18 py-12 desktop:px-0 desktop:py-24">
										<div
											class="flex items-center flex-row w-full flex-row-reverse"
											data-testid="skeleton">
											<div
												class="relative overflow-hidden rounded-3 bg-grey10 w-80 h-122 desktop:h-125 ml-16" style="background-color: #fff"><button
											class="typo-sm1 mr-8 rounded-20 py-[3.5px] px-10 bg-black text-white" onclick="deleteNovel('${select.num_novel}')">삭제</button></div>
											<div class="flex flex-col w-full flex-1" onclick="selectNovel('${select.num_novel}')">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate" style="font-size: 18px">${select.subject}</span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2">${select.id}</p><br/>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                <span class="typo-g-sm2 -mb-[0.2em] ml-4"><fmt:formatDate value="${select.make}" pattern="yyyy-MM-dd HH:mm"/></span>
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                최신화 : ${select.episode}화
                                                                            </span>
                                                                        </div>
											</div>
											<div class="relative overflow-hidden rounded-3 bg-grey10 w-80 h-122 desktop:h-125 ml-16" onclick="selectNovel('${select.num_novel}')">
												<img
														alt="ㄴㄹㅇㄹ"
														srcset="/novelWebProject/_next/static/images/novel_thumb/${select.photo}"
														src="/novelWebProject/_next/static/images/novel_thumb/${select.photo}" decoding="async"
														data-nimg="fixed"
														style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;"
														>
                                          		${select.age==1?"<img class='absolute top-4 right-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_adult15_s.svg' alt='15세 관람가 아이콘'/>":""}
                                          		${select.end==1?"<img class='absolute top-4 left-4' src='/novelWebProject/_next/static/icons/badge_thumbnail_finish_s.svg' alt='완결'/>":""}
											</div>
										</div>
									</div>
								</c:forEach>
									
									<% 
								}catch(SQLException e){
									e.printStackTrace();
								}
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