
<%@page import="ManagerVO.PastAllMVO"%>
<%@page import="ManagerVO.PastVisitVO"%>
<%@page import="ManagerVO.PastJoinVO"%>
<%@page import="ManagerVO.DashboardVO"%>
<%@page import="ManagerDAO.ManageDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<title>소설조아 | 관리</title>

<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="preload" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/fd0af5d18a01c194.css" data-n-p="" />
<link rel="stylesheet" type="text/css" href="http://localhost/novelWebProject/_next/static/css/font.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->

<!-- cdn chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap">

	h1{
		margin-top: 0px;
		margin-left: 0px;
		margin-right: 0px;		
		margin-bottom: 0px;		
		text-align: center; 
		font-size: 20px;
	}
	
	h2{
		margin-top: 15px;
		margin-left: 0px;
		margin-right: 0px;
		text-align: center; 
		font-size: 30px;
		font-weight: bold;
		
	}
	
	#mBtn, #nBtn, #hBtn{
		border: 1px solid #FFFFFF;
		background-color: #E6E6E6;
	    padding: 10px
	}
	

table{ border:0px solid #333; }
th, td{ height: 150px; font-weight: normal; border: 0px solid #333; text-align: center; width: 900px}
	
	
</style>
</head>

<body>
<%-- <%= session.getAttribute("sesId") %> --%>
<div id="__next" data-reactroot="">
<div style="display: none; background-color: canvas; color-scheme: light"></div>
<div class="lightMode h-full">

<div class="flex flex-col h-full">

	<header class="relative bg-white border-b-1 border-grey20">
		<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 flex-wrap items-center desktop:min-h-[72px] desktop:flex-nowrap desktop:py-12">
			<a class="ml-15 mr-16 max-w-[145px] flex-shrink flex-grow basis-0 py-[13.5px] desktop:ml-0 desktop:mr-32 desktop:max-w-[174px] desktop:py-0" href="http://localhost/novelWebProject/manager/manager_home.jsp">
			<img class="" width="157" height="27" src="http://localhost/novelWebProject/_next/static/images/logo.png" alt="소설조아 logo" /></a>
			<div class="flex items-center ml-auto mr-15 desktop:mr-0">
			<button  class="typo-md3 ml-auto flex cursor-pointer items-center rounded-50 bg-transparent text-black desktop:border-1 desktop:desktop:bg-black desktop:px-13 desktop:py-7 desktop:text-white" id="logoutBtn">로그아웃</button>
			</div>
		</div>
	</header>
	
	<!-- https://studiomeal.com/archives/197 -->
	<!-- mx-auto:left&right margin auto  w-full: width 100%-->
	<!-- flex-row:아이템들이 행방향으로 배치 flex-wrap:줄넘김 -->
	<main class="flex-1 mx-auto w-full max-w-default flex-row flex-wrap" >
	
	<div>
		<h1>관리자 ${ sesId }  홈</h1>
	</div>
	
	<div style="margin-top: 20px; text-align: center; " >
		<input type="button" id="mBtn" value="회원 관리" onclick="location.href='http://localhost/novelWebProject/manager/manager_user.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="nBtn" value="소설 관리" onclick="location.href='http://localhost/novelWebProject/manager/manager_novel.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="hBtn" value="히스토리" onclick="location.href='http://localhost/novelWebProject/manager/manager_history.jsp'">
	</div>
	
	
	
		<h1 style="margin-top: 25px;">일간 이용자 지표 </h1>
	<div style="display: flex; justify-content: center; align-items: center; margin-top: 10px">
	
		<table style="margin: 0 auto;">
		<tr>
		<td  style="height: 200px" >
		<canvas id="myChart"></canvas>
		</td>
		<td>
		<canvas id="myChart2"></canvas>
		</td>
		<td>
		<canvas id="myChart3"></canvas>
		</td>
		</tr>
		


		<%
		// 각 페이지 상단에 다음 코드 추가
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.

		
		 if(session.getAttribute("sesId")==null){
			response.sendRedirect("http://localhost/novelWebProject/manager/manager_login.jsp");
		} 
	
ManageDAO mDAO = new ManageDAO();
DashboardVO dVO = mDAO.selectDash();
PastJoinVO pVO = mDAO.selectsCnt();
PastVisitVO vVO = mDAO.selectvCnt();
PastAllMVO aVO = mDAO.selectAcnt();


Date currentDate = new Date();

// Calendar 객체를 생성하여 현재 시간을 설정함
Calendar calendar = Calendar.getInstance();
calendar.setTime(currentDate);
Date currentDay = calendar.getTime();

// 현재 날짜에서 1일 전의 날짜를 계산함
calendar.add(Calendar.DATE, -1);
Date oneDayBefore = calendar.getTime();

// 현재 날짜에서 2일 전의 날짜를 계산함
calendar.add(Calendar.DATE, -1);
Date twoDaysBefore = calendar.getTime();

calendar.add(Calendar.DATE, -1);
Date threeDaysBefore = calendar.getTime();

calendar.add(Calendar.DATE, -1);
Date fourDaysBefore = calendar.getTime();

// 날짜 형식을 정의함
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");

// 각 날짜를 날짜 형식으로 변환하여 출력함
String current = sdf.format(currentDay);
String current_1 = sdf.format(oneDayBefore);
String current_2 = sdf.format(twoDaysBefore);
String current_3 = sdf.format(threeDaysBefore);
String current_4 = sdf.format(fourDaysBefore);
	%>
		<tr>

		<td style="text-align: left;" >
		<input type="hidden" value="<%= current %>" id="cur">
		<input type="hidden" value="<%= current_1 %>" id="cur-1">
		<input type="hidden" value="<%= current_2 %>" id="cur-2">
		<input type="hidden" value="<%= current_3 %>" id="cur-3">
		<input type="hidden" value="<%= current_4 %>" id="cur-4">
		<!-- 
		sCnt4 4일전 
		 -->
		<input type="hidden" value="<%= pVO.getsCnt() %>" id="sCnt">
		<input type="hidden" value="<%= pVO.getsCnt1() %>" id="sCnt1">
		<input type="hidden" value="<%= pVO.getsCnt2() %>" id="sCnt2">
		<input type="hidden" value="<%= pVO.getsCnt3() %>" id="sCnt3">
		<input type="hidden" value="<%= pVO.getsCnt4() %>" id="sCnt4">
		
		
		<input type="hidden" value="<%= vVO.getvCnt() %>" id="vCnt">
		<input type="hidden" value="<%= vVO.getvCnt1() %>" id="vCnt1">
		<input type="hidden" value="<%= vVO.getvCnt2() %>" id="vCnt2">
		<input type="hidden" value="<%= vVO.getvCnt3() %>" id="vCnt3">
		<input type="hidden" value="<%= vVO.getvCnt4() %>" id="vCnt4">
		
				<input type="hidden" value="<%= aVO.getAllMCNT() %>" id="aCnt">
		<input type="hidden" value="<%= aVO.getAllMCNT1() %>" id="aCnt1">
		<input type="hidden" value="<%= aVO.getAllMCNT2() %>" id="aCnt2">
		<input type="hidden" value="<%= aVO.getAllMCNT3() %>" id="aCnt3">
		<input type="hidden" value="<%= aVO.getAllMCNT4() %>" id="aCnt4">


		<label>총 회원 수 : <%=dVO.getMemberCnt() %>  </label><br>
		<label>오늘의 가입자 수 : <%=dVO.getTodaySignUpCnt() %></label><br>
		<label>오늘의 방문자 수 : <%=dVO.getTodayVisitCnt() %></label><br>	
		</td>
<td>
</td>
		<td style="text-align: left;" >
				<label>총 소설 수 : <%=dVO.getNovelCnt() %></label><br>
		<label>오늘 등록된 소설 수 : <%=dVO.getTodayCreateNovelCnt() %></label><br>	
		<label>오늘 등록된 에피소드 수 : <%=dVO.getTodayCreateEpCnt() %></label><br>
		</td>
		</tr>

		</table>
		
		
	</div>
	

	
	</main>
	
	<footer	class="typo-sm1 border-t-1 border-grey20 bg-grey10 text-grey60 desktop:typo-sm2 mt-48 desktop:mt-116">
	<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18 flex-col items-start py-32 desktop:flex-row desktop:items-center desktop:py-40">
		<div class="flex mb-20 w-full items-center justify-between desktop:mb-0 desktop:w-auto"></div>
		<div style="font-size: 40px">소설조아&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="flex flex-col" style="position: relative; top: 10px;">
			<ul	class="flex flex-wrap mb-20 list-none p-0 text-grey60 desktop:mb-5">
				<li class="mr-8"><a href="#void">회사소개</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">이용약관</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void"> <strong>개인정보처리방침</strong></a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">청소년보호정책</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">권리침해신고센터</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">공지사항</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">고객센터</a></li>
				<span class="mx-4 text-10 my-0 mr-8 ml-2 hidden text-grey30 desktop:inline">|</span>
				<li class="mr-8"><a href="#void">도움말</a></li>
			</ul>
			<ul class="flex flex-wrap mb-20 list-none p-0 font-medium text-grey60 desktop:mb-10">
				<li class="mr-8">
				<div class="flex cursor-pointer items-center font-bold">(주)소설조아 사업자 정보
						<svg width="16" height="16" viewBox="0 0 16 16" fill="none"	xmlns="" role="img" class="">
                         <path fill-rule="evenodd" clip-rule="evenodd" d="M7.99966 11.0002L2.99902 6.06302L4.05289 4.99561L7.99966 8.89229L11.9464 4.99561L13.0003 6.06302L7.99966 11.0002Z" fill="currentColor"></path>
                        </svg>
				</div>
			</li>
			</ul>
		</div>
	</div>
	</footer>
	
</div>
</div>
</div>
<script type="text/javascript">

$("#logoutBtn").click(function(){
	 location.href="http://localhost/novelWebProject/manager/manager_logout.jsp"; 
});



//가입자 수
var scnt = document.getElementById('sCnt').value;
var scnt1 = document.getElementById('sCnt1').value;
var scnt2 = document.getElementById('sCnt2').value;
var scnt3 = document.getElementById('sCnt3').value;
var scnt4 = document.getElementById('sCnt4').value;

//방문자 수
var vcnt = document.getElementById('vCnt').value;
var vcnt1 = document.getElementById('vCnt1').value;
var vcnt2 = document.getElementById('vCnt2').value;
var vcnt3 = document.getElementById('vCnt3').value;
var vcnt4 = document.getElementById('vCnt4').value;


var acnt = document.getElementById('aCnt').value;
var acnt1 = document.getElementById('aCnt1').value;
var acnt2 = document.getElementById('aCnt2').value;
var acnt3 = document.getElementById('aCnt3').value;
var acnt4 = document.getElementById('aCnt4').value;

var curDate = document.getElementById('cur').value;
var curDate_1 = document.getElementById('cur-1').value;
var curDate_2 = document.getElementById('cur-2').value;
var curDate_3 = document.getElementById('cur-3').value;
var curDate_4 = document.getElementById('cur-4').value;


/* alert(document.getElementById('num')); */
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        curDate_4,curDate_3,curDate_2,curDate_1,curDate
                    ],
                    datasets: [
                        { //데이터
                            label: '가입자 수', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                scnt4,scnt3,scnt2,scnt1,scnt //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(54, 162, 235, 0.2)',
                                 'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)' 
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(54, 162, 235, 1)',
                               'rgba(255, 99, 132, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)' 
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                /*          {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)',
                            	borderWidth: 1 //경계선 굵기
                        }  */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            
            
            
            var context2 = document
            .getElementById('myChart2')
            .getContext('2d');
        var myChart2 = new Chart(context2, {
            type: 'line', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                	curDate_4,curDate_3,curDate_2,curDate_1,curDate
                ],
                datasets: [
                    { //데이터
                        label: '방문자 수', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                        	vcnt4,vcnt3,vcnt2,vcnt1,vcnt
                        //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 206, 86, 0.2)',
                            /* 'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)' */
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 206, 86, 1)',
                             'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)' 
                        ],
                        borderWidth: 1 //경계선 굵기
                    }
            /*          {
                        label: 'test2',
                        fill: false,
                        data: [
                            8, 34, 12, 24
                        ],
                        backgroundColor: 'rgb(157, 109, 12)',
                        borderColor: 'rgb(157, 109, 12)',
                        	borderWidth: 1 //경계선 굵기
                    }  */
                ]
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
        
        
        
        var context3 = document
        .getElementById('myChart3')
        .getContext('2d');
    var myChart3 = new Chart(context3, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
            	curDate_4,curDate_3,curDate_2,curDate_1,curDate
            ],
            datasets: [
                { //데이터
                    label: '총 소설 수', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                    	acnt4,acnt3,acnt2,acnt1,acnt//x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(255, 159, 64, 0.2)' 
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(153, 102, 255, 1)',
                       /*  'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 159, 64, 1)' */
                    ],
                    borderWidth: 1 //경계선 굵기
                }
        /*          {
                    label: 'test2',
                    fill: false,
                    data: [
                        8, 34, 12, 24
                    ],
                    backgroundColor: 'rgb(157, 109, 12)',
                    borderColor: 'rgb(157, 109, 12)',
                    	borderWidth: 1 //경계선 굵기
                }  */
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
        </script>
    </body>
</html>

</body>
</html>