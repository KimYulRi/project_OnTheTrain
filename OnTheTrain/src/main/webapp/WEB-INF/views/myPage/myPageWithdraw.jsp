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
    <link href="${ path }/css/myPage/myPageWithdraw.css" rel="stylesheet" type="text/css">
	<link href="${ path }/css/myPage/myPageModal.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Buzscn6EZpIDqqzFV3yfPyTzgdVhxFpKX9Rt61x0s0Q7NOLBbJbi2eAeOgIEduKk" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <div id="container">
        <section>
        	<div id="myBanner" >
            	<img alt="" id="myBannerImg" width="1024px" height="181px" src="${ path }/images/myPage/myPage.jpg"  >
            </div>
	
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div id="mypagechoose" class="toolbarcontent">개인정보</div>
            </div>

            <div id="toptoolbar">
                <div id="toptoolbartitle">개인정보</div>
            </div>
				<form action="${ path }/myPage/myPageWithdraw" method="POST">
             <div id="withbody" >
				
					<div id="withtitle" >회원 탈퇴하기전에 확인해주세요</div>
					<div class="with" >회원 탈퇴를 진행할 경우 회원님의 모든 데이터는 삭제되며</div>
					<div class="with" >삭제된 데이터는 복구할 수 없습니다.</div>
					
					<div class="with" >정말로 회원을 탈퇴 하시겠습니까?</div>
					
					<div class="with" >탈퇴를 원하시면 본인의 이름을 입력하신후 탈퇴하기 버튼을 눌러주세요.</div>
					
				<br>
				<input type="text" name="nameCheck" id="nameCheck" >
				<br>
				<br>
            	<button type="submit" id="withdraw" >회원 탈퇴하기</button>
             </div>

		</form>
            
            
                                
            
            
            <jsp:include page="./myPageModal.jsp" />
            <script src="${ path }/js/myPage/myPageModal.js"></script>
			<script src="${ path }/js/myPage/myPageInfo.js"></script>
        </section>
        <%@ include file="../common/footer.jsp"%>
	</body>
    </div>

</html>