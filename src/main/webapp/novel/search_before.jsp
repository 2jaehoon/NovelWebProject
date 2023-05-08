<%@page import="novel.SearchVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="novel.SearchDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>검색 | 카카오페이지 스테이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com"   crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/project/_next/static/css/login.css" />
<noscript data-n-css=""></noscript>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
function findNovel(){
     $("#frm").submit();
}
function selectNovel(num_novel){
   location.href="/novelWebProject/episode/novel.jsp?num_novel="+num_novel;
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
               <div
                  class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 max-w-[848px]">
                  <div class="flex flex-col flex-1">
                     <div
                        class="mt-40 mb-32 px-18 desktop:mt-50 desktop:mb-42 desktop:px-0">
                        <div class="w-full">
                           <form id="frm">
                              <div
                                 class="flex items-center rounded-4 border-1 border-grey30 py-4 px-16">
                                 <div id="searchimg" class="flex h-16 w-16 items-center text-grey60" onclick="findNovel()">
                                    <img width="20" height="20" viewBox="0 0 20 20" src="/novelWebProject/_next/static/images/search.png"/>
                                 </div>
                                 <input type="search" onKeypress="javascript:if(event.keyCode==13){findNovel()}"
                                    class="typo-md3 py-14 px-16 outline-none rounded-3 border-1 border-grey30 placeholder:text-grey60 w-full border-0 text-16 outline-none desktop:!text-16"
                                    name="search" placeholder="검색어 입력" maxLength="100" />
                              </div>
                           </form>
                        </div>
                     </div>
                     <div class="px-18 desktop:px-0"></div>
                  </div>
                  </div>
                  <div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 max-w-[848px]">
                  
                  <div class="col-span-full grid gap-x-64 desktop:grid-cols-2" style="margin: 0 auto">
                        
                        <%
                                                SearchDAO sDAO=new SearchDAO();
                                                                  try{
                                                                     List<SearchVO> selectList=sDAO.selectNovelAll(request.getParameter("search"));
                                                                     pageContext.setAttribute("selList", selectList);
                                                %>
                        
                        <c:forEach var="select" items="${selList}" >
                           <div class="px-18 py-12 desktop:px-0 desktop:py-24" style="border: 1px solid #333">
                              <div
                                 class="flex items-center flex-row w-full flex-row-reverse"
                                 data-testid="skeleton">
                                 <div
                                    class="relative overflow-hidden rounded-3 bg-grey10 w-80 h-122 desktop:h-125 ml-16" style="background-color: #fff"></div>
                                 <div class="flex flex-col w-full flex-1" onclick="selectNovel('${select.num_novel}')">
                                                                        <div class="typo-md2 flex items-center desktop:typo-md1 !typo-md2 mb-6 desktop:!typo-md3 desktop:mb-4">
                                                                            <span class="truncate" style="font-size: 18px">&nbsp;${select.subject}</span>
                                                                        </div>
                                                                        <p class="truncate-webkit typo-sm1 text-grey60 !typo-sm2 mt-8 h-36" style="-webkit-line-clamp:2">&nbsp;${select.id}</p><br/>
                                                                        <div class="flex flex-wrap items-center text-grey60">
                                                                            <span class="typo-sm2 flex items-center">
                                                                                &nbsp;최신화 : ${select.episode} 화
                                                                            </span>
                                                                            <span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
                                                                            <span class="typo-sm2 flex items-center">
                                                                                <span class="typo-g-sm2 -mb-[0.2em] ml-4">&nbsp;<fmt:formatDate value="${select.make}" pattern="yyyy-MM-dd HH:mm"/></span>
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
                        }catch(Exception e){
                           e.printStackTrace();
                        }
                        %>
                        </div>
                  
               </div>
            </main>


         <!-- footer -->
   <div>
      <jsp:include page="../_next/footer.jsp"/>
   </div>


         </div>
      </div>
      <div id="modal-normal"></div>
   </div>
   <!--  <script id="__NEXT_DATA__" type="application/json">
            {"props":{"pageProps":{}},"page":"/search","query":{},"buildId":"DTTq-pEjkraM1eJOqnaey","assetPrefix":"https://pagestage-cdn.kakaoent.com/web","nextExport":true,"autoExport":true,"isFallback":false,"scriptLoader":[]}
        </script> -->
</body>
</html>