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
    <link href="${ path }/css/myPage/myPageQnaView.css" rel="stylesheet" type="text/css">
    <link href="${ path }/css/myPage/myPageModal.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div id="container">
        <section>
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div id="mypagechoose" class="toolbarcontent">1:1 문의</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>

            <div id="toptoolbar" >
                <div id="toptoolbartitle" >1:1 문의</div>
            </div>

            

            <div id="qnabody">
            	
                <div id="qnawriter">${qna.writerNo } 님의 문의 내역입니다.</div>
                <div id="qnatype">${qna.type}</div>
                <div id="qnatitle">${qna.title }</div>
                <div id="qnadate">${qna.createDate }</div>
                <div id="qnacontent">${qna.qnaContent }</div>
                <div id="qnafile">${qna.qnaOriginalFileName }</div>
            </div>

            <div class="line"></div>

            <div id="qnareply">
                <div id="replywriter">관리자</div>
                <div id="replydate">${qnaReply.qnaReplyDate }</div>
                <div id="replycontent">${qnaReply.qnaReplyContent }</div>
            </div>
			
			<div class="none"></div>
			
			<button type="button" id="qnaModal" class="qnaModal">답변 작성하기</button>
			<jsp:include page="./myPageQnaModal.jsp" />
			<script src="${ path }/js/myPage/myPageQnaModal.js"></script>


        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>