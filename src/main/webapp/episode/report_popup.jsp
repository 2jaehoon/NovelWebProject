<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css"	as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/novelWebProject/_next/static/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
	#wrap { display: flex; align-items: center; justify-content: center; height: 100%; }
	button, input, optgroup, select, textarea {
    	-webkit-appearance: auto;
	}
</style>	

<noscript data-n-css=""></noscript>

<%  
	if(session.getAttribute("user_num_member")==null){
		response.sendRedirect("../login/loginpage.jsp");
		return;
	}	

	int userNum = (Integer)session.getAttribute("user_num_member");
	int num_novel = Integer.parseInt(request.getParameter("num_novel")); 
	String id = request.getParameter("id");
%>

<script type="text/javascript">

	$(function(){
		
		$("#reportBtn").click(function(){
			var value = $("input[type=radio][name=report]:checked").val();
	        if (value) {
	            $("#reportCode").val(value);
	            $("#reportFrm").submit();
	            alert( "신고되었습니다.");
	            opener.parent.location.href="http://localhost/novelWebProject/episode/novel.jsp?num_novel=" + <%=request.getParameter("num_novel")%>;
	        }
	        else {
	            alert('선택된 신고항목이 없습니다.');
	        }
		}); //report
		
	});// ready

</script>
</head>


<body>
	<div class="flex rounded-t-0 relative z-1 max-h-[100%] flex-col overflow-hidden bg-white"
		data-body-scroll-lock="ignore" style="width: 502px; height: 800px; border: 1px solid #000000;">
	<div class="flex flex-col h-full overflow-hidden px-18 py-24 desktop:p-30">
		<div style="position: relative; top: 15px" class="flex-1 overflow-y-scroll scrollbar-hide desktop:px-10 desktop:pt-10">
		<img id="reportImg" src="http://localhost/novelWebProject/_next/static/images/report.png" style="width: 40px; height: 40px;" alt="신고"/>
		<div class="typo-md1 text-center desktop:typo-lg3 py-8">
			<div class="whitespace-pre-line" style="font-weight: bold; font-size: 20px">신고</div><br>
			<div>서비스 이용목적에 부합하지 않는 콘텐츠를 신고해주세요. <br>
				신고하신 내용은 운영정책에 따라 처리되며,<br> 
				허위 신고시 이용에 제한을 받을 수 있습니다.<br>
			</div>
			<br><br><br>
			
			
		<form id="reportFrm" action="report_process.jsp" method="post">
			<input type="hidden" id="num_novel" name="num_novel" value="<%= num_novel %>" />
			<input type="hidden" id="userNum" name="userNum" value="<%= userNum %>" />
			<input type="hidden" id="id" name="id" value="<%= id %>" />
			<input type="hidden" id="reportCode" name="reportCode" value="" />
			
			<div>
				<label><input type="radio" name="report" value="1" />영리목적/홍보성</label><br>
				<label><input type="radio" name="report" value="2" />욕설/인신공격</label><br>
				<label><input type="radio" name="report" value="3" />불법정보</label><br>
				<label><input type="radio" name="report" value="4" />개인정보 노출</label><br>
				<label><input type="radio" name="report" value="5" />음란성/선정성</label><br>
				<label><input type="radio" name="report" value="6" />같은 내용 도배</label><br>
				<label><input type="radio" name="report" value="7" />권리침해 신고</label><br>
			</div>
			
			
			
		</form>
		</div>
		</div>
		
		<div class="w-full shrink-0" style="position: relative; bottom: 18px">
		
			<div class="flex mt-24 desktop:mt-32">
				<button class="flex items-center justify-center border-1 appearance-none px-24 py-12 typo-md2-b mr-8 flex-1"
					type="button" id="cancel" style="font-weight: bold" onclick="javascript:window.close()">취소</button>
				
				<button class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b flex-1"
					type="button" id="reportBtn" style="font-weight: bold">신고</button>
			</div>
			
		</div>
		
		
	</div>
	</div>
</body>
</html>