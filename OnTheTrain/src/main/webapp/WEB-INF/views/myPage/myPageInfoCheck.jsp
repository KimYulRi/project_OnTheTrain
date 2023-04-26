<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${ path }/css/myPage/myPageInfoCheck.css" rel="stylesheet" type="text/css">
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
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div id="mypagechoose" class="toolbarcontent">개인정보</div>
            </div>
	
            <div id="toptoolbar">
                <div id="toptoolbartitle">개인정보</div>
            </div>
			
			<c:if test="${loginMember.snsLogin == 'N'}">
	            <form action="${ path }/myPage/myPageInfoCheck" method="POST"  >
	                <div id="infocheck">
	                    <input type="text" id="idcheck" name="idcheck"  placeholder="아이디를 입력해주십시오.">
	                    <br>
	                    <input type="password" id="pwdcheck" name="pwdcheck"  placeholder="비밀번호를 입력해주십시오.">
	                    <button type="submit" id="infobtn">본인 확인</button>
	                </div>
	            </form>
			</c:if>
			<c:if test="${loginMember.snsLogin == 'Y'}">
				<div id="noResult" ><img width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
				<div id="noResult">간편 로그인 회원은 개인정보를 수정하실수 없습니다.</div>
				<div id="noResult" >회원 탈퇴를 원하신다면 아래의 버튼을 눌러주세요.</div>
				<div id="noResult" >
					<button type="button" id="withdraw" class="withdrawModal" onclick="location.href='${path}/myPage/myPageWithdraw'">회원 탈퇴</button>
				</div>
			
			
			</c:if>

            


            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>