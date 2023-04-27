<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온더트레인</title>
        <link href="${ path }/css/myPage/myPageTicket.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@ include file="../common/header.jsp" %>
</head>
<body>
    <div id="container">
    		
    		 <div id="myBanner" >
            	<img alt="" id="myBannerImg" width="1024px" height="181px" src="${ path }/images/myPage/myPage.jpg"  >
            </div>
        <section>
                <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div id="mypagechoose" class="toolbarcontent"> 결제 완료 </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>
            <div id="toptoolbar" >
                <div id="ticket">승차권</div>
                <div id="accommodation" ><a href="${ path }/myPage/myPageAccommodation" >숙박</a></div>
            </div>
            
<<<<<<< HEAD
            <div id="ticketbody" class="rounded-5 border">
                <div id="tickettitle">열차종류</div>
                <div id="ticketlogo">로고 이미지</div>
                <div id="ticketdatebody">
                    <div id="ticketdatetitle" >탑승일</div> 
                    <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                    </svg>&nbsp;2023/01/01</div>
                </div>
                <div id="tickettimebody">
                    <div id="tickettimetitle">출발시간</div>
                    <div id="tickettime"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
                        <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
                        <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
                    </svg>&nbsp;15:30</div>
                </div>
                <div id="ticketstation">
                    <div id="ticketstationstart">도착역 <div id="ticketstationstartcontent" >서울역 </div></div>
                    <div id="ticketstationarrow"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"/>
                    </svg></div>
                    <div id="ticketstationend">출발역  <div id="ticketstationendcontent">역삼역</div></div>
                </div>
=======
>>>>>>> main

		<c:if test="${not empty ticketList}">
            <c:forEach items="${ticketList}" var="ticketList" >
	            <div id="ticketbody" class="rounded-5 border">
	                <div id="tickettitle">승차권</div>
	                <div id="ticketlogo"><img width="100px" height="20px" src="${ path }/images/myPage/OnTheTrain_LogoTest.png" alt=""></div>
	                <div id="ticketdatebody">
	                    <div id="ticketdatetitle" >탑승일</div> 
	                    <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
	                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
	                    </svg>&nbsp;<fmt:formatDate pattern="yy/MM/dd" value="${ticketList.depDate}" /></div>
	                </div>
	                <div id="tickettimebody">
	                    <div id="tickettimetitle">출발시간</div>
	                    <div id="tickettime"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
	                        <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>

	                        <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
	                    </svg>&nbsp;<fmt:formatNumber pattern="00" value="${ticketList.depTime / 100}" /><fmt:formatNumber pattern=":00" value="${ticketList.depTime % 100}" /></div>
	                </div>
	                <div id="ticketstation">
	                    <div id="ticketstationstart">출발역 <div id="ticketstationstartcontent" >${ticketList.departure} </div></div>
	                    <div id="ticketstationarrow"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 16 16">
	                        <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"/>
	                    </svg></div>
	                    <div id="ticketstationend">도착역  <div id="ticketstationendcontent">${ticketList.arrival}</div></div>
	                </div>
	
	                <div id="tickettrainbody">
	                    <div id="tickettrainway">&nbsp;<div id="tickettrainwaycontent">편도</div></div>
	                    <div id="tickettrainname">&nbsp;<div id="tickettrainnamecontent">${ticketList.type }</div></div>
	                    <div id="tickettrainsitnum">좌석 번호<div id="tickettrainsitnumcontent">${ticketList.seat }</div></div>
	                </div>
	                <div id="ticketpricebody">
	                    <div id="ticketpricetitle">영수액<div id="ticketpricecontent"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
	                        <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
	                        <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
	                    </svg>&nbsp;<fmt:formatNumber value="${ticketList.price}" pattern="#,###"/>원</div></div>
	                </div>
				
	                <button id="ticketcancle" class="btn btn-primary" >예약 취소</button>
	            </div>
				</c:forEach>
	       </c:if>	
	            
	                <c:if test="${empty ticketList}" >
	               		<div id="noResult" ><img id="imgNo"  width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
						<div id="noResult">예약한 승차권이 없습니다.</div>
                    </c:if>
	            	<div id="pageBar">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='${ path }/myPage/myPageTicket?page=1'">&lt;&lt;</button>
			
						<!-- 이전 페이지로 -->
						<button onclick="location.href='${ path }/myPage/myPageTicket?page=${ pageInfo.prevPage }'">&lt;</button>
			
						<!--  5개 페이지 목록 -->
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:choose>
								<c:when test="${ status.current == pageInfo.currentPage}">
									<button disabled>${ status.current }</button>
								</c:when>
								<c:otherwise>						
									<button onclick="location.href='${ path }/myPage/myPageTicket?page=${ status.current }'">${ status.current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
									<!-- 다음 페이지로 -->
						<button onclick="location.href='${ path }/myPage/myPageTicket?page=${ pageInfo.nextPage }'">&gt;</button>
			
						<!-- 맨 끝으로 -->
						<button onclick="location.href='${ path }/myPage/myPageTicket?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
					</div>


            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>