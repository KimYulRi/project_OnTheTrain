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
                <h4>승차권 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
                                       
                                        <div class="input-group mb-4" id="adminSelectwrap">
                                        
                                        <p>전체 승차권 수<code class="highlighter-rouge"> ${ totalTicket }</code>개</p>
	                                        <div id="adminSelect">
	                                                    <select class="form-select" id="adminfilter">
	                                                        <option selected>전체</option>
	                                                        <option value="1">결제대기</option>
	                                                        <option value="2">발권완료</option>
	                                                        <option value="3">발권취소</option>
	                                                    </select>
	                                                    
	                                                    <select class="form-select" id="adminsort">
	                                                        <option selected>승차권번호순</option>
	                                                        <option value="1">탑승일순</option>
	                                                        <option value="2">예약일순</option>
	                                                    </select>
	                                        </div>
                                        </div>                                        
                                    
                                      
                                  	<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 admin-tb">
                                            <thead>
                                                <tr>
                                                    <th  class="col-1">승차권번호</th>
                                                    <th  class="col-2">예매자</th>
                                                    <th  class="col-1">열차번호</th>
                                                    <th  class="col-2">출발역</th>
                                                    <th  class="col-1">도착역</th>
                                                    <th  class="col-2">탑승일</th>
                                             		<th  class="col-1">예약일</th>
                                                    <th  class="col-1">상태</th>
                                                    <th class="col-md-1">관리</th>
                                                </tr>
                                            </thead>
                                           <%--  <tbody>
                                             <c:forEach var="ticket" items="${ list }" >
                                                <tr>
                                                    <td class="text-bold-500">${ ticket.ticketNo }</td>
                                                    <td>${ ticket.nickname }</td>
                                                    <td class="text-bold-500">?열차번호?</td>
                                                    <td>${ ticket.departure }</td>
                                                    <td>${ ticket.arrival }</td>
                                                    <td><fmt:formatDate value="${ ticket.depDate }" pattern="yyyy-MM-dd" /></td>
                                                    <td><fmt:formatDate value="${ ticket.bookDate }" pattern="yyyy-MM-dd" /></td>
                                                    <td>결제상태
                                                    <c:choose>
                                                    	 <c:when test="${ ticket.refundStatus == 'Y'}">
														     <span class="badge   bg-disable" >발권취소</span>
														  </c:when>
														  <c:when test="${ ticket.paymentStatus == 'N'}">
														     <span class="badge  bg-light-warning" >결제대기</span>
														   </c:when>
														  <c:when test="${ ticket.paymentStatus == 'Y'}">
														     <span class="badge  bg-light-primary" >발권완료</span>
														  </c:when>
														  <c:otherwise>
														     <span class="badge  bg-disable">발권취소</span>
														  </c:otherwise>
													</c:choose>
                                                   </td>
                                                    
                                                    <td class="text-center d-flex justify-content-center">
                                                    	<div id=tablebtn>
		                                                    <button class="adminbtn2 block" data-no="${ ticket.ticketNo }"
		                                            		data-bs-toggle="modal" data-bs-target="#exampleModalCenter"></button>
														</div>
                                                    </td>
                                                </tr>
                                               </c:forEach>											
                                            </tbody> --%>
                                        </table>
                                        
                                    </div>
                                </div>
                                
                                <!-- 페이징 -->
                                 <div id="adminpagebar">
                                         <ul class="pagination pagination-primary" >
                                         
                                         	<li class="page-item">
                                         		<a class="page-link" href="${ path }/admin/ticket?page=1">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/ticket?page=${ pageInfo.prevPage }" >
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                            	</a>
                                            </li>
	                                            
                                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
												<c:choose>
													<c:when test="${ status.current == pageInfo.currentPage}">
														<li class="page-item active">
															<a class="page-link" href="${ path }/admin/ticket?page=${ status.current }">${ status.current }</a>
														</li>
													</c:when>
													<c:otherwise>					
														<li class="page-item">
															<a class="page-link" href="${ path }/admin/ticket?page=${ status.current }">${ status.current }</a>
														</li>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
												
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/ticket?page=${ pageInfo.nextPage }">
                                                   <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                               </a>
                                           	</li>
                                                
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/ticket?page=${ pageInfo.maxPage }">
                                               		<span aria-hidden="true"><i class="bi bi-chevron-double-right"></i></span>
                                           		</a>
                                           </li>
                                        </ul>
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
    <script>
        // 메뉴바 변경
        window.onload = function() {
			document.getElementById("ad_ticketboard").classList.add("active");
		}
        
    </script>

    <script src="${path}/bootstrap5/assets/js/main.js"></script>
    
<%-- 
	<script src="${ path }/js/admin/adminMemberModal.js"></script> --%>
</body>

</html>