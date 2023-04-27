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
    <title>온더트레인</title>
    <link href="${ path }/css/myPage/myPageQna.css" rel="stylesheet" type="text/css">
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
                    <div id="qnaboxdate" class="qnabox">작성일</div>
                    <div id="qnaboxcheck" class="qnabox">답변 상태</div>
                </div>
                <c:if test="${not empty qnaList}">
				<div id="qnacontent">
				    <c:forEach items="${qnaList}" var="qna">
				        <div id="qnatype" class="qnabox">${qna.type}</div>
				        <div id="qnatitle" class="qnabox"><a href="${ path }/myPage/myPageQnaView?no=${ qna.qnaNo }">
								${ qna.title }
							</a></div>
				        <div id="qnadate" class="qnabox">${qna.createDate}</div>
				        <c:if test="${qna.qnaCheck == 'Y'}">
				        	<div id="qnacheckok" class="qnabox">답변완료</div>
				        </c:if>
				         <c:if test="${qna.qnaCheck == 'N'}">
				        	<div id="qnacheckno" class="qnabox">미답변</div>
				        </c:if>
				    </c:forEach>
				    </div>
                </c:if>
                <c:if test="${empty qnaList}">
                	<div id="noResult" ><img id="imgNo"  width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
					<div id="noResult">작성하신 1:1 문의 내역이 없습니다.</div>
                </c:if>
                
			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='${ path }/myPage/myPageQna?page=1'">&lt;&lt;</button>
	
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/myPage/myPageQna?page=${ pageInfo.prevPage }'">&lt;</button>
	
				<!--  5개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>						
							<button onclick="location.href='${ path }/myPage/myPageQna?page=${ status.current }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
							<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/myPage/myPageQna?page=${ pageInfo.nextPage }'">&gt;</button>
	
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/myPage/myPageQna?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			
				</div>
                <div></div>
            </div>

            <button id="writeqnabtn" type="button" class="btn btn-primary btn-sm"  onclick="location.href='${path}/myPage/myPageQnaWrite'" > 문의 작성하기 </button>
            
            



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

	<script src="${ path }/js/myPage/myPageInfo.js"></script>
</html>