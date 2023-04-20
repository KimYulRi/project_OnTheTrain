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
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="${ path }/css/admin/adminMemberModal.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <%@ include file="../admin/adminNav.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="admincontent">
			<div id="adminheader">
				<h2> 회원관리 </h2>
			</div>
			<div id="admincontent">
				<table id="admintable">
					<tr>
						<th id="lefttb" width="80px">No.</th>
						<th width="130px">아이디</th>
						<th width="130px">이름</th>
						<th width="130px">등급</th>
						<th width="130px">가입일</th>
						<th width="130px">상태</th>
						<th id="righttb">관리</th>
					</tr>
						 <c:forEach var="member" items="${ list }" >
					<tr>
						<td id="lefttb">${ member.no }</td>
						<c:if test="${ empty member.id }"><td>${ member.loginTypeText } 회원</td></c:if>
						<c:if test="${ not empty member.id }"><td>${ member.id }</td></c:if>
						<td>${ member.name }</td>
						<td>${ member.membershipText }</td>
						<td>${ member.enrollDate }</td>
						<td>${ member.statusText }</td>
						<td id="righttb">
							<button class="infoadminbtn" 
							data-no="${ member.id }">회원정보</button>&nbsp;&nbsp;
							<button class="adminbtn">1:1문의</button>
						</td >
					</tr>
					  </c:forEach>
				</table>
			
			</div>
			<div id="adminPaging" aria-label="Page navigation example">
				  <ul class="pagination">
				  
				 	 <li class="page-item">
				      <a class="page-link" href="${ path }/admin/member?page=1" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="${ path }/admin/member?page=${ pageInfo.prevPage }" aria-label="Previous">
				        <span aria-hidden="true">&lt;</span>
				      </a>
				    </li>
				    
				 <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>					
							<li class="page-item"><a class="page-link" href="${ path }/admin/member?page=${ status.current }">${ status.current }</a></li>	
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				    <li class="page-item">
				      <a class="page-link" href="${ path }/admin/member?page=${ pageInfo.nextPage }" aria-label="Next">
				        <span aria-hidden="true">&gt;</span>
				      </a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="${ path }/admin/member?page=${ pageInfo.maxPage }" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
			</div>
			
	</div>
	<jsp:include page="../admin/adminMemberModal.jsp" />
	<script src="${ path }/js/admin/adminMemberModal.js"></script>
</body>
</html>