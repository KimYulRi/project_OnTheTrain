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
<title>Insert title here</title>
	<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"> -->
	<!-- iamport.payment.js -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<link rel="stylesheet" href="${ path }/css/payment/payment.css">
	<script>
		var path = "<%=request.getContextPath()%>"; // path 변수를 자바스크립트에서 사용할 수 있는 형태로 변환
		console.log(path); // path 변수 값 출력
	</script>
	<script src="${ path }/js/payment/payment.js"></script>
</head>
<body>
	<section>
	
		<div id="payment-box1">
	
			<div id="payment-waiting-list">
			
			</div>		
			
		</div>

		<div id="payment-box2">
		
		
		
		</div>
		
		<div class="modal_container">
		  <button id="modal_open_btn">상세정보</button>
		  <div class="modal">
		    <div class="modal_content">
		      <p>모달창 내용</p>
		      <button id="modal_close_btn">닫기</button>
		    </div>
		  </div>
		</div>
		
		<button id="coupon_adapt_btn" type="button">적용하기</button>
		<button id="coupon_cancel_btn" type="button">취소하기</button>
	
		<button id="payment_btn" type="button" onclick="payment.requestPay()">결제하기</button>


	</section>


</body>
</html>