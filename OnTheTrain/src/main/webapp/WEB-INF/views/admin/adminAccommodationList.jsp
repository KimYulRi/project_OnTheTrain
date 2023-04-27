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
    <title>온더트레인</title>

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
                <h4>숙박 예약 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
                                       
                                        <div class="input-group mb-4" id="adminSelectwrap">
                                        
                                        <p>전체 예약 수<code class="highlighter-rouge"> ${ totalAccommodation }</code>건</p>
	                                        <div id="adminSelect">
	                                                    <select class="form-select" id="adminfilter">
	                                                        <option selected>전체</option>
	                                                        <option value="1">결제대기</option>
	                                                        <option value="2">예약완료</option>
	                                                        <option value="3">예약취소</option>
	                                                    </select>
	                                                    
	                                                    <select class="form-select" id="adminsort">
	                                                        <option selected>예약번호순</option>
	                                                        <option value="1">체크인날짜순</option>
	                                                        <option value="2">예약일순</option>
	                                                    </select>
	                                        </div>
                                        </div>                                        
                                    
                                      
                                  	<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 admin-tb">
                                            <thead>
                                                <tr>
                                                    <th  class="col-1">예약번호</th>
                                                    <th  class="col-2">회원번호</th>
                                                    <th  class="col-1">숙소번호</th>
                                                    <th  class="col-2">체크인</th>
                                             		<th  class="col-1">체크아웃</th>
                                             		<th  class="col-2">인원</th>
                                                    <th  class="col-1">상태</th>
                                                    <th class="col-md-2">관리</th>
                                                </tr>
                                            </thead>
                                           	<tbody>
                                             <c:forEach var="acc" items="${ list }" >
                                                <tr>
                                                    <td class="text-bold-500">${ acc.no }</td>
                                                    <td>${ acc.memberNo }</td>
                                                    <td class="text-bold-500">${ acc.accommodationNo }</td>
                                                    <td><fmt:formatDate value="${ acc.checkin }" pattern="yyyy-MM-dd" /></td>
                                                    <td><fmt:formatDate value="${ acc.checkout }" pattern="yyyy-MM-dd" /></td>
                                                    <td>${ acc.adultNumber }</td>
                                                    <td>
                                                    <c:choose>
                                                    	 <c:when test="${ acc.refundStatus == 'Y'}">
														     <span class="badge   bg-disable" >예약취소</span>
														  </c:when>
														  <c:when test="${ acc.refundStatus == 'N'}">
														     <span class="badge  bg-light-primary" >예약완료</span>
														  </c:when>
													</c:choose>
                                                   </td>
                                                    
                                                    <td class="text-center d-flex justify-content-center">
                                                    	<div id=tablebtn>
		                                                    <button class="adminbtn2 block" data-no="${ acc.no }"
		                                            		data-bs-toggle="modal" data-bs-target="#exampleModalCenter">상세보기</button>
														</div>
                                                    </td>
                                                </tr>
                                               </c:forEach>											
                                            </tbody> 
                                        </table>
                                        
                                    </div>
                                </div>
                                
                                <!-- 페이징 -->
                                 <div id="adminpagebar">
                                         <ul class="pagination pagination-primary" >
                                         
                                         	<li class="page-item">
                                         		<a class="page-link" href="${ path }/admin/accommodation?page=1">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/accommodation?page=${ pageInfo.prevPage }" >
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                            	</a>
                                            </li>
	                                            
                                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
												<c:choose>
													<c:when test="${ status.current == pageInfo.currentPage}">
														<li class="page-item active">
															<a class="page-link" href="${ path }/admin/accommodation?page=${ status.current }">${ status.current }</a>
														</li>
													</c:when>
													<c:otherwise>					
														<li class="page-item">
															<a class="page-link" href="${ path }/admin/accommodation?page=${ status.current }">${ status.current }</a>
														</li>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
												
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/accommodation?page=${ pageInfo.nextPage }">
                                                   <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                               </a>
                                           	</li>
                                                
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/accommodation?page=${ pageInfo.maxPage }">
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
			document.getElementById("ad_accommodationboard").classList.add("active");
		}
        
    </script>

    <script src="${path}/bootstrap5/assets/js/main.js"></script>
<%-- 
	<script src="${ path }/js/admin/adminMemberModal.js"></script> --%>
</body>
    <%@ include file="../common/footer.jsp"%>

</html>