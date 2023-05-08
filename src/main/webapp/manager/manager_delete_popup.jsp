<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"
	crossorigin="anonymous" />
<link rel="stylesheet"
	data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<style type="text/css">
#wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}
</style>	
</head>
<body>
		<div 
			class="flex rounded-t-0 relative z-1 max-h-[70%] flex-col overflow-hidden bg-white"
			data-body-scroll-lock="ignore" style="width: 502px; height: 250px;">
			<div
				class="flex flex-col h-full overflow-hidden px-18 py-24 desktop:p-30">
				<div style="position: relative; top: 15px"
					class="flex-1 overflow-y-scroll scrollbar-hide desktop:px-10 desktop:pt-10">
					<div class="typo-md1 text-center desktop:typo-lg3 py-8">
						<div class="whitespace-pre-line"
							style="font-weight: bold; font-size: 20px">삭제하시겠습니까?</div>
					</div>
				</div>

			<form id="deleteForm" method="post" action="manager_delete_process.jsp">
				<input type="hidden" name="novelNum"
					value="<%=request.getParameter("novelNum")%>">
				<input type="hidden" name="title"
					value="<%=request.getParameter("title")%>">
				<div class="w-full shrink-0"
					style="position: relative; bottom: 18px; top: 20px">
					<div class="flex mt-24 desktop:mt-32">
						<button
							class="flex items-center justify-center border-1 appearance-none px-24 py-12 typo-md2-b mr-8 flex-1"
							type="button" style="font-weight: bold" onclick="window.close()">취소</button>
						<button
							class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b flex-1"
							type="submit" style="font-weight: bold" id="deleteBtn">삭제</button>
					</div>
				</div>
			</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>