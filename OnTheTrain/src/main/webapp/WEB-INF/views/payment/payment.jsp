<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온더트레인</title>
	<%@ include file="../common/header.jsp" %>
	<script src="${ path }/js/common/jquery-3.6.3.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<link rel="stylesheet" type="text/css" href="${ path }/font/common/NotoSansKR-Bold.otf">
	<link rel="stylesheet" type="text/css" href="${ path }/css/payment/payment.css">
	<script>
		// path 변수를 자바스크립트에서 사용할 수 있는 형태로 변환
		var path = '<%=request.getContextPath()%>'; 
	</script>
	<script src="${ path }/js/payment/payment.js"></script>
</head>
<body>
	<section>
		<div id="container">
			<div id="payment_box1">
				<div class="products">
				
					<div class="modal_container">
					  <button id="modal_open_btn">상세정보</button>
					  <div class="modal">
					    <div class="modal_content">
					    
					      <button id="modal_close_btn">닫기</button>
					    </div>
					  </div>
					</div>
					
				</div>		
			</div>

			<div id="payment_box2">
			
				<div id="price_content">
					<h4 id="price_detail">결제 상세 금액</h4>
					<div>
						<h4>선택하신 결제대기 목록</h4>
						
					</div>
					<div class="price">
						<span>선택 결제대기 금액</span> <span>00000</span><span>원</span>
					</div>
					<div class="discount">
						<span id="membership_discount_comment">멤버십 할인</span> <span id="membership_discount" class="discount_detail"></span><span id="membership_discount_krw" class="discount_detail">원</span>
					</div>
					<div class="discount">
						<span id="coupon_discount_comment">쿠폰 할인</span> <span id="coupon_discount" class="discount_detail">00000</span><span id="membership_discount_krw" class="discount_detail">원</span>
					</div>
					<div class="price">
						<span>할인 적용 금액</span> <span>00000</span><span>원</span>
					</div>
					<div class="price">
						<span class="final_price">최종 결제 금액</span> <span class="final_price">00000</span><span class="final_price">원</span>
					</div>
				</div>
				
			
			</div>
				<button id="payment_btn" type="button" onclick="payment.requestPay()">결제하기</button>
		
		</div>

				
				<button id="coupon_adapt_btn" type="button">적용하기</button>
				<button id="coupon_cancel_btn" type="button">취소하기</button>
	</section>


</body>
</html>