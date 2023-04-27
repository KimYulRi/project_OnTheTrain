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
    <link href="${ path }/css/myPage/myPageAccommodation.css" rel="stylesheet" type="text/css">
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
                <div id="ticket"><a href="${ path }/myPage/myPageTicket">승차권</a></div>
                <div id="accommodation" >숙박</div>
            </div>
            
            <c:if test="${not empty accommodationList}">
			    <c:forEach var="accommodation" items="${accommodationList}">
			        <form method="GET" action="${path}/myPage/myPageAccommodationCheck">
			            <div id="accbody">
			                <div class="accfont" id="accimage"><img id="accimages" src="${path}/images/myPage/accTest.png" alt=""></div>
			                <div class="accfont" id="acctitle">${accommodation.name}</div>
			                <div class="accfont" id="acccontent">${accommodation.location}</div>
			                <div class="accfont" id="accprice">${accommodation.explain}</div>
			                <input type="hidden" id="accNo" name="accNo" value="${accommodation.no}" >
			                <button id="acccheck" class="btn btn-danger" type="submit">예약 확인</button>
			                <button id="acccancle" class="btn btn-danger">예약 취소</button>
			            </div>
			        </form>
			    </c:forEach>
			</c:if>


			<c:if test="${empty accommodationList}">
			    <div >
			        <div id="noResult" ><img id="imgNo"  width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
					<div id="noResult">예약한 숙박 내용이 없습니다.</div>
			    </div>
			</c:if>




            



            
        </section>
</body>
    <footer>

    </footer>
    </div>

</html>