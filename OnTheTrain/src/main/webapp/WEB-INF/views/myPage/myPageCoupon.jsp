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
    <title>Document</title>
    <link href="${ path }/css/myPage/myPageCoupon.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@ include file="../common/header.jsp" %>
</head>
<body>
    <div id="container">
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
                <tbody>
                    <tr>
                        <td id="coupontitle" >반가워요 신인 환영 쿠폰</td>
                        <td id="coupondate" >~2023/01/01</td>
                        <td id="couponsale" >15,000원</td>
                    </tr>
                </tbody>
            </table>

	<table class="table" id="coupontablebody">
    <thead class="table-light">
        <tr>
            <th id="coupontitlebody">쿠폰 이름</th>
            <th id="coupondatebody">이용 기간</th>
            <th id="couponsalebody">할인 혜택</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${myCouponList}" var="myCoupon">
            <tr>
                <td id="coupontitle">${myCoupon.getTitle()}</td>
                <td id="coupondate">${myCoupon.getStartDate()} ~ ${myCoupon.getEndDate()}</td>
                <td id="couponsale">${myCoupon.getDiscount()}원</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div id="paging" class="text-center">
    <c:if test="${pageInfo.getMaxPage() > 1}">
        <ul class="pagination">
            <c:if test="${pageInfo.startPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="?page=1" aria-label="First">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" var="i">
                <c:choose>
                    <c:when test="${i == pageInfo.currentPage}">
                        <li class="page-item active">
                            <span class="page-link">${i}</span>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pageInfo.endPage < pageInfo.getMaxPage()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pageInfo.getMaxPage()}" aria-label="Last">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </c:if>
</div>
			
            
            



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>