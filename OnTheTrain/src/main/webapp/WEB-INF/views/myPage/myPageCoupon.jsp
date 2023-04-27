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
    <link href="${ path }/css/myPage/myPageCoupon.css" rel="stylesheet" type="text/css">
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
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div id="mypagechoose" class="toolbarcontent">쿠폰함</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>

            <div id="toptoolbar" >
                <div id="toptoolbartitle" >사용 가능한 쿠폰</div>
            </div>

            <table class="table" id="coupontablebody" >
                <thead class=" table-light">
                    <tr>
                        <th id="coupontitlebody" >쿠폰 이름</th>
                        <th id="coupondatebody" >이용 기간</th>
                        <th id="couponsalebody">할인 혜텍</th>
                    </tr>
                </thead>
                <c:if test="${not empty myCoupon}">
	                <c:forEach items="${myCoupon}" var="myCoupon" >
		                <tbody>
		                    <tr>
		                        <td id="coupontitle" >${myCoupon.couponName }</td>
		                        <td id="coupondate" >~<fmt:formatDate pattern="yyyy/MM/dd" value="${myCoupon.expDate}"/></td>
								<c:if test="${myCoupon.discountRate == 0}">
								    <td id="couponsale"><fmt:formatNumber value="${myCoupon.discountAmount}" pattern="#,###"/>원</td>
								</c:if>
								<c:if test="${myCoupon.discountAmount == 0}">
								    <td id="couponsale">${myCoupon.discountRate}%</td>
								</c:if>
		                    </tr>
		                </tbody>
	                </c:forEach>
                </c:if>	
                
            </table>
            
                    <c:if test="${empty myCoupon}" >
	                	<div id="noResult" ><img id="imgNo"  width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
						<div id="noResult">사용할 수 있는 쿠폰이 없습니다.</div>
                    </c:if>


			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='${ path }/myPage/myPageCoupon?page=1'">&lt;&lt;</button>
	
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/myPage/myPageCoupon?page=${ pageInfo.prevPage }'">&lt;</button>
	
				<!--  5개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>						
							<button onclick="location.href='${ path }/myPage/myPageCoupon?page=${ status.current }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
							<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/myPage/myPageCoupon?page=${ pageInfo.nextPage }'">&gt;</button>
	
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/myPage/myPageCoupon?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			
				</div>
                <div></div>
            </div>
            
            



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>