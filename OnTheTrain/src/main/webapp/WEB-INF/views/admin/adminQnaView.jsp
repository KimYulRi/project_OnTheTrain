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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

   	<link rel="stylesheet" href="${path}/bootstrap5/assets/css/bootstrap.css">
   	<link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/bootstrap5/assets/css/app.css">
    <link rel="stylesheet" href="${path}/css/admin/adminCommon.css">
    <link rel="stylesheet" href="${path}/css/admin/adminQnaView.css">
 <%--   	<link rel="stylesheet" type="text/css" href="${ path }/css/admin/adminMemberListModal.css"> --%>
   	<script src="${ path }/js/common/jquery-3.6.3.js"></script>
</head>

<body>
    <div id="app">
        <%@ include file="../admin/adminSidebar.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h4>1:1문의 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
		                                    
			                     <table id="noticetable">
			                    <thead>
			                      <tr id="trhead1">
			                      		<td  class="headhead" colspan="3">${member.nickname} 님의 문의 내역</td>
			                      </tr>
			                      <tr id="trhead3"  >
			                            <td class="col-1 paddingtd"><span id="cate">${ qna.type }</span></td>
			                            <td id="title">${ qna.title }</td>
			                            <td id="righttd col-1">${ qna.createDate }</td>
			                      </tr>
			                      
			                      </thead>
			                      <tbody>
			                      <tr id="trfile">
			                            <td class="paddingtd"><span id="filetd">첨부파일</span></td>
			                            <td colspan="2">
			                            	<span id="filefont">
				                           	<c:if test="${ not empty qna.qnaOriginalFileName }">
				                           	<a href="${ path }/resources/upload/qna/${ qna.renamedFileName }">
				                           		$ {qna.qnaOriginalFileName }
				                           	</a>
				                           	</c:if>
				                            </span>
			                            </td>
			                      </tr>
			                        <tr class="trcontent">
			                            <td id="tbcontent1" colspan="3"> ${ qna.qnaContent }</td>
			                        </tr>
			                    </tbody>
			                    
			                     <thead>
			                      <tr id="trhead2">
			                      		<td class="headhead" colspan="3"> 온더트레인 답변</td>
			                      </tr>
			                      <tr id="trhead4">
			                            <td id="righttd" colspan="3">2023-04-23${qnaReply.qnaReplyDate}</td>
			                      </tr>
			            
			                      </thead>
			                      <tbody>
			                        <tr  class="trcontent"> 
			                            <td id="tbcontent2" colspan="3">${ qnaReply.qnaReplyContent }</td>
			                        </tr>
			                    </tbody>
			                </table>
			
			<div class="none"></div>
			
			<button type="button" id="qnaModal" class="qnaModal qnaBtn">답변 작성하기</button>
                                      
                                  	
                                </div>
                                
                              
                            </div>
                        </div>
                    </div>
                    
                </section>
            </div>
        </div>
    </div>
	<%-- <jsp:include page="../admin/adminMemberListModal.jsp" /> --%>
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
			<jsp:include page="../myPage/myPageQnaModal.jsp" />
			<script src="${ path }/js/myPage/myPageQnaModal.js"></script>
    <script>
        // 메뉴바 변경
        window.onload = function() {
			document.getElementById("ad_qnaboard").classList.add("active");
		}
        
    </script>

    <script src="${path}/bootstrap5/assets/js/main.js"></script>
    
<%-- 
	<script src="${ path }/js/admin/adminMemberModal.js"></script> --%>
</body>

</html>