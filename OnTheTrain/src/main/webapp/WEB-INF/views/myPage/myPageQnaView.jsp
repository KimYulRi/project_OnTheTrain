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
    <link href="${ path }/css/myPage/myPageQnaView.css" rel="stylesheet" type="text/css">
    <link href="${ path }/css/myPage/myPageModal.css" rel="stylesheet" type="text/css">
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
                <div id="toptoolbartitle" >1:1 문의</div>
            </div>

            

             <table id="noticetable" >
                              
                                <thead>
                                  <tr id="trhead1">
                                        <td  class="headhead" colspan="3">${member.nickname} 님의 문의 내역</td>
                                  </tr>
                                  <tr id="trhead3"  >
                                        <td class="col-1 paddingtd"><span id="cate">${ qna.type }</span></td>
                                        <td id="title">${ qna.title }</td>
                                        <td id="righttd">${ qna.createDate }</td>
                                  </tr>
                                  
                                  </thead>
                               <tbody>
                               <tr id="trfile">
                                     <td class="paddingtd"><span id="filetd">첨부파일</span></td>
                                     <td colspan="2">
                                        <span id="filefont">
                                          <c:if test="${ not empty qna.qnaOriginalFileName }">
                                          <a href="${ path }/resources/upload/qna/${ qna.qnaRenamedFileName }">
                                             ${qna.qnaOriginalFileName }
                                          </a>
                                          </c:if>
                                        </span>
                                     </td>
                               </tr>
                                 <tr class="trcontent">
                                     <td id="tbcontent1" colspan="3"> ${ qna.qnaContent }</td>
                                 </tr>
                             </tbody>
                             
                             <c:if test="${not empty qnaReply}">
	                              <thead>
	                               <tr id="trhead2">
	                                     <td class="headhead" colspan="3"> 온더트레인 답변</td>
	                               </tr>
	                               <tr id="trhead4">
	                                     <td id="righttd" colspan="3">${qnaReply.qnaReplyDate}</td>
	                               </tr>
	                               </thead>
	                             
	                              <tbody>
	                                 <tr  class="trcontent"> 
	                                     <td id="tbcontent2" colspan="3">${ qnaReply.qnaReplyContent }</td>
	                                 </tr>
	                             </tbody>
                             </c:if>

                         </table>
			                  <c:if test="${empty qnaReply}">
				                  <div id="noResultBody" >
	                             	<div id="noResult" ><img id="imgNo"  width="110px" height="110px" src="${ path }/images/common/noResult.png" alt=""></div>
	                             	<br>
									<div id="noResult">작성된 관리자의 답변이 없습니다.</div>
				                  </div>
                             </c:if>
			
<!-- 			<div class="none"></div> -->
			

			<div id="btndiv" >
				<button type="button" id="qnaBtn" class="qnaBtn" onclick="location.href='${path}/myPage/myPageQna'" >목록으로 돌아가기</button>
			</div>


        </section>
        <%@ include file="../common/footer.jsp"%>
</body>

    </div>

</html>