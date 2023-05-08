<%@page import="java.sql.SQLException"%>
<%@page import="novel.NewNovelVO"%>
<%@page import="novel.NewNovelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설 수정 | 소설조아</title>
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


$(function(){
	
	$("#textBox").keyup(function (e) {
		var content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$("#textCount").text('0');
	    } else {
	    	$("#textCount").text(content.length);
	    }
	    
	    // 글자수 제한
	    if (content.length > 100) {
	    	// 100자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 100));
	        // 100자 넘으면 알림창 뜨도록
	        alert('글자수는 100자까지 입력 가능합니다.');
	    };
	});
	
	$("#photo").click(function() {
		$("#filephoto").click();
	});
	
	$("#filephoto").change( function(event) {
		
		//이미지 파일만 업로드
		var blockExt=["gif","png","jpg","bmp"];
		var blockFlag=false;
		
		var fileName=$("#filephoto").val();
		var ext=fileName.substring(fileName.lastIndexOf(".")+1);
		
		for(var i=0;i<blockExt.length;i++){
			if(blockExt[i]==ext){
				blockFlag=true;
				break;
			}//end if
		}//end for
		
		if(!blockFlag){
			alert("이미지 파일만 선택 가능합니다");
			return;
		}//end if

	    var file = event.target.files[0];

	    var reader = new FileReader(); 
	    reader.onload = function(e) {

	        $("#photo").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});
	
	$("#regi").click(function(){
		
		if($("#title").val()==""){
			alert("제목은 필수입니다");
			$("#title").focus();
			return;
		}
			frm.submit();
	});
});
	


</script>
</head>
<%
if("POST".equals(request.getMethod())){
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
					<div
						class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18 mt-32 desktop:mt-47">
						<div class="flex flex-col flex-1">
							<div class="border-b-2 pb-12 desktop:pb-16">
								<h1 class="typo-dp3 mt-8 desktop:typo-dp2 desktop:mt-16">소설 수정</h1>
							</div>
							<form class="w-full" name="frm" method="post" action="novel_edit_sub.jsp" enctype="multipart/form-data">
								<%
								String id=session.getAttribute("user_id").toString();
								NewNovelDAO nDAO=new NewNovelDAO();
								try{
									NewNovelVO nVO=nDAO.selectNovel(id, Integer.parseInt(request.getParameter("num_novel")));
								%>
								<div class="typo-md3 pt-30">
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-center mb-28 desktop:mb-32">
											<label
												class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0 desktop:w-124">작가명<span
												class="typo-md3 ml-3 text-secondary-text">*</span></label>
											<div class="flex flex-col w-full desktop:flex-row">
												<input type="text" name="id" value="<%=id%>">
												<input type="hidden" name="num_novel" value="${param.num_novel}">
											</div>
										</div>
									</div>
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-start mb-28 desktop:mb-32">
											<label
												class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0 desktop:w-124">이용가
												설정<span class="typo-md3 ml-3 text-secondary-text">*</span>
											</label>
											<div class="mt-4 desktop:mt-0">
												<div class="flex mb-8">
													<label class="flex typo-md3 mr-40 items-center">
														<input
														class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
														type="radio" name="age" value="0" <%=nVO.getAge()==0?"checked":"" %>/>
														<span class="">전체 이용가</span>
													</label>
													<label
														class="flex typo-md3 mr-40 items-center"><input
														class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
														type="radio" name="age" value="1" <%=nVO.getAge()==1?"checked":"" %>/>
														<span class="">15세 미만 이용 불가</span>
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-center mb-28 desktop:mb-32">
											<label
												class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0 desktop:w-124">소설
												제목<span class="typo-md3 ml-3 text-secondary-text">*</span>
											</label>
											<div class="w-full desktop:max-w-[600px]">
												<div class="flex w-full">
													<input
														class="typo-md3 py-14 px-16 outline-none rounded-3 border-1 border-grey30 placeholder:text-grey60 w-full"
														name="title" maxlength="100" id="title" value="<%=nVO.getTitle()%>">
												</div>
											</div>
										</div>
									</div>
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-start mb-32">
											<label
												class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0 desktop:w-124">소설
												표지<span class="typo-md3 ml-3 text-secondary-text">*</span>
											</label>
											<div>
												<div class="flex">
													<div>
														<img src="/novelWebProject/_next/static/images/novel_thumb/<%=nVO.getFilephoto()%>" id="photo" style="width: 100px;height: 150px"/>
													</div>
													<input type="file" name="upphoto" id="filephoto" style="display: none;">
													<input type="hidden" name="filephoto" value="<%=nVO.getFilephoto()%>" style="display: none;">
												</div>
												<div class="flex mt-4 cursor-pointer items-center"></div>
											</div>
										</div>
									</div>
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-start mb-24 desktop:mb-32">
											<label
												class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0 desktop:w-124">소설
												소개</label>
											<div class="w-full">
												<div
													class="flex flex-col rounded-3 border-1 border-grey30 py-14 px-16">
													<div class="overflow-scroll">
														<div
															class="grid Textarea_autoGrow__tT5K5 typo-md3 max-h-200"
															data-replicated-value="">
															<textarea id="textBox"
																class="typo-md3 rounded-3 border-1 border-grey30 py-14 px-16 placeholder:text-grey60 flex-[1_1_100%] resize-none outline-none typo-md3 w-full !border-0 !p-0"
																name="story" rows="3"><%=nVO.getStory()%></textarea>
														</div>
													</div>
													<div class="flex mt-12 justify-end">
														<p class="typo-g-x-sm1">
															<span class="text-grey80" id="textCount"><%=nVO.getStory().length()%></span><span
																class="text-grey60"> / 100</span>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="w-full">
									<div
										class="flex flex-col items-start desktop:flex-row desktop:items-center mb-32">
										<label
											class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0ㄴ desktop:w-124">공개<span
											class="typo-md3 ml-3 text-secondary-text">*</span></label>
										<div class="flex">
											<label class="flex typo-md3 mr-40 items-center"><input
												class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
												type="radio" name="open" value="0" <%=nVO.getOpen()==0?"checked":""%>><span
												class="">비공개</span></label><label
												class="flex typo-md3 mr-40 items-center"><input
												class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
												type="radio" name="open" value="1" <%=nVO.getOpen()==1?"checked":""%>><span
												class="">공개</span></label>
										</div>
									</div>
								</div>
								<div class="w-full">
									<div
										class="flex flex-col items-start desktop:flex-row desktop:items-center mb-32">
										<label
											class="flex typo-md3-b mb-8 w-full flex-[0_0_auto] desktop:typo-md3 desktop:mr-48 desktop:mb-0ㄴ desktop:w-124">완결<span
											class="typo-md3 ml-3 text-secondary-text">*</span></label>
										<div class="flex">
											<label class="flex typo-md3 mr-40 items-center"><input
												class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
												type="radio" name="end" value="0" <%=nVO.getEnd()==0?"checked":""%>><span
												class="">미완결</span></label><label
												class="flex typo-md3 mr-40 items-center"><input
												class="mr-6 h-20 w-20 flex-none appearance-none rounded-full bg-white outline-none grid place-content-center border-1 border-grey30 before:h-8 before:w-8 before:scale-0 before:transform before:rounded-full before:shadow-radioGroup before:transition-transform before:duration-[120ms] before:ease-in-out before:content-[&quot;&quot;] checked:before:scale-[1] disabled:bg-grey20 disabled:checked:before:shadow-radioGroupDisabled"
												type="radio" name="end" value="1" <%=nVO.getEnd()==1?"checked":""%>><span
												class="">완결</span></label>
										</div>
									</div>
								</div>
								<div class="mb-40 border-b-1 border-black/10 desktop:mb-56">
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-center mb-32 hidden">
											<label class="flex typo-md3 items-start"><div
													class="mr-8 shrink-0">
													<div class="flex relative">
														<input
															class="peer h-18 w-18 border-none outline-none items-center"
															type="checkbox" name="onlyStage">
														<div
															class="flex absolute inset-0 h-20 w-20 border-1 border-grey30 p-2 text-transparent peer-checked:text-checkboxIcon peer-disabled:bg-grey20 peer-disabled:peer-checked:text-grey30">
															<svg width="16" height="16" viewBox="0 0 16 16"
																fill="none" xmlns="http://www.w3.org/2000/svg"
																role="img">
																<path fill-rule="evenodd" clip-rule="evenodd"
																	d="M14.0003 5.09294L6.65288 11.9995L2 7.6258L3.02736 6.53286L6.65288 9.94082L12.9729 4L14.0003 5.09294Z"
																	fill="currentColor"></path></svg>
														</div>
													</div>
												</div>
												<p class="break-words text-14" style="word-break: keep-all;">이
													소설은 Kakaopage STAGE에서만 독점으로 연재하겠습니다. (선택)</p></label>
										</div>
									</div>
									<div class="w-full">
										<div
											class="flex flex-col items-start desktop:flex-row desktop:items-center mb-32 hidden">
											<label class="flex typo-md3 items-start"><div
													class="mr-8 shrink-0">
													<div class="flex relative">
														<input
															class="peer h-18 w-18 border-none outline-none items-center"
															type="checkbox" name="completionPromise">
														<div
															class="flex absolute inset-0 h-20 w-20 border-1 border-grey30 p-2 text-transparent peer-checked:text-checkboxIcon peer-disabled:bg-grey20 peer-disabled:peer-checked:text-grey30">
															<svg width="16" height="16" viewBox="0 0 16 16"
																fill="none" xmlns="http://www.w3.org/2000/svg"
																role="img">
																<path fill-rule="evenodd" clip-rule="evenodd"
																	d="M14.0003 5.09294L6.65288 11.9995L2 7.6258L3.02736 6.53286L6.65288 9.94082L12.9729 4L14.0003 5.09294Z"
																	fill="currentColor"></path></svg>
														</div>
													</div>
												</div>
												<p class="break-words text-14" style="word-break: keep-all;">kakaopage
													STAGE에서 완결까지 꾸준히 연재하겠습니다. (선택)</p></label>
											<div class="flex mt-2 text-grey60">
												<svg width="18" height="18" viewBox="0 0 18 18" fill="none"
													xmlns="http://www.w3.org/2000/svg" role="img"
													class="mr-2 ml-0 desktop:ml-3">
													<rect x="1" y="1" width="16" height="16" rx="8"
														fill="white" stroke="#EEEEEE"></rect>
													<path
														d="M8.32 10.2H9.97C9.97 9.64 10.2 9.28 10.93 8.71C11.58 8.21 11.94 7.62 11.94 6.88C11.94 5.52 10.96 4.53 9.23 4.53C7.61 4.53 6.47 5.61 6.47 7.05H8.21C8.21 6.54 8.57 6.07 9.24 6.07C9.87 6.07 10.23 6.38 10.23 6.88C10.23 7.36 9.91 7.66 9.32 8.11C8.59 8.66 8.32 9.21 8.32 10.2ZM9.2 13.04C9.81 13.04 10.26 12.6 10.26 11.99C10.26 11.38 9.81 10.93 9.2 10.93C8.59 10.93 8.14 11.38 8.14 11.99C8.14 12.6 8.59 13.04 9.2 13.04Z"
														fill="#999999"></path></svg>
												<p class="break-words mt-3" style="word-break: keep-all;">kakaopage
													STAGE에서 완결까지 꾸준히 연재해주시겠다고 약속해주신 소설 중, 소설 완결 후 우수 소설을 선정하여
													지원금을 드립니다. (선택사항)</p>
											</div>
										</div>
									</div>
									<div class="w-full">
										
									</div>
								</div>
								<div>
									<div class="flex mb-32 justify-center">
									
									
											<input type="button" value="등록"class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-28 py-12 typo-md2-b desktop:px-56 desktop:py-13 desktop:typo-lg2-b w-full desktop:w-[240px]"
											id="regi">

									</div>
								</div>
								<%
								}catch(SQLException se){
									se.printStackTrace(); 
								}
								%>
							</form>
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

