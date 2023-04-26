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
<title>Pay</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp17133480"); // 예:imp1234xxxxx
	
    function requestPay() {
        IMP.request_pay({
            pg : 'html5_inicis.INIpayTest',
            pay_method : 'card',
            merchant_uid: "57008833-330078", 
            name : '공기 한 줌',
            amount : 100,
            buyer_email : 'maybe0047@gmail.com',
            buyer_name : '수수께끼의 개발자',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 역삼동',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
                var msg = '결제가 완료되었습니다.';
                alert(msg);
            } else {
                console.log(rsp);
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    }
</script>

<title>이니시스 결제</title>
</head>
<body>
	<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

</body>
</html>