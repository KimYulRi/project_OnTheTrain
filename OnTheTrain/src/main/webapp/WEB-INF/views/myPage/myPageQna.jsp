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
    <link href="${ path }/css/myPage/myPageQna.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div id="container">
        <section>
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageticket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div id="mypagechoose" class="toolbarcontent">1:1 문의</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>
            
            <div id="toptoolbar" >
                <div id="toptoolbartitle" >1:1 문의 목록</div>
            </div>


            <div id="qnabody">
                <div id="qnabox">
                    <div id="qnaboxtype" class="qnabox">문의 유형</div>
                    <div id="qnaboxtitle" class="qnabox">문의 제목</div>
                    <div id="qnaboxdate" class="qnabox">문의 작성일</div>
                    <div id="qnaboxcheck" class="qnabox">답변 상태</div>
                </div>
                <div id="qnacontent">
                    <div id="qnatype" class="qnabox">결제</div>
                    <div id="qnatitle" class="qnabox">결제는 어떻게 하면 되나요? 말줄임표 테스트 야야야 12345 야야야야야야야야야야야</div>
                    <div id="qnadate" class="qnabox">2023/01/01</div>
                    <div id="qnacheckno" class="qnabox">미답변</div>
                </div>
                <div id="qnacontent">
                    <div id="qnatype" class="qnabox">결제</div>
                    <div id="qnatitle" class="qnabox">결제는 어떻게 하면 되나요? 말줄임표 테스트 야야야 12345 야야야야야야야야야야야</div>
                    <div id="qnadate" class="qnabox">2023/01/01</div>
                    <div id="qnacheckok" class="qnabox">답변완료</div>
                </div>
                <div></div>
            </div>

            <button id="writeqnabtn" type="button" class="btn btn-primary btn-sm"  >문의 작성하기</button>
            
            



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

	<script src="${ path }/js/myPage/myPageInfo.js"></script>
</html>