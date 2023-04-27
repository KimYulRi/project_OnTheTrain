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
                <h4>1:1문의 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
                                       
                                        <div class="input-group mb-4" id="adminSelectwrap">
                                        
                                        <p>전체 문의 수<code class="highlighter-rouge"> ${ totalQna }</code>개</p>
	                                        <div id="adminSelect">
	                                                    <select class="form-select" id="adminfilter">
	                                                        <option selected>전체</option>
	                                                        <option value="1">미답변</option>
	                                                        <option value="2">답변</option>
	                                                    </select>
	                                                    
	                                                    <select class="form-select" id="adminsort">
	                                                        <option selected>번호순</option>
	                                                        <option value="1">등록일순</option>
	                                                    </select>
	                                        </div>
                                        </div>                                        
                                    
                                      
                                  	<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 admin-tb">
                                            <thead>
                                                <tr>
                                                    <th  class="col-1">문의번호</th>
                                                    <th  class="col-2">분류</th>
                                                    <th  class="col-4">제목</th>
                                                    <th  class="col-1">회원번호</th>
                                                    <th  class="col-2">등록일</th>
                                                    <th  class="col-1">답변</th>
                                                    <th class="col-md-1">관리</th>
                                                </tr>
                                            </thead>
                                           	<tbody>
                                             <c:forEach var="qna" items="${ list }" >
                                                <tr>
                                                    <td class="text-bold-500">${ qna.qnaNo }</td>
                                                    <td>${ qna.type }</td>
                                                    <td class="text-bold-500">${ qna.title }</td>
                                                    <td>${ qna.writerNo }</td>
                                                    <td>${ qna.createDate }</td>
                                                    <td>
                                                    <c:choose>
                                                    	 <c:when test="${ qna.qnaCheck == 'Y'}">
														     <span class="badge   bg-disable" >답변완료</span>
														  </c:when>
														  <c:when test="${ qna.qnaCheck  == 'N'}">
														     <span class="badge  bg-light-warning" >미답변</span>
														   </c:when>
													</c:choose>
                                                   </td>
                                                    
                                                    <td class="text-center d-flex justify-content-center">
                                                    	<div id=tablebtn>
		                                                    <button class="adminbtn2 block" data-no="${ qna.qnaNo }">상세보기</button>
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
                                         		<a class="page-link" href="${ path }/admin/qna?page=1">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/qna?page=${ pageInfo.prevPage }" >
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                            	</a>
                                            </li>
	                                            
                                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
												<c:choose>
													<c:when test="${ status.current == pageInfo.currentPage}">
														<li class="page-item active">
															<a class="page-link" href="${ path }/admin/qna?page=${ status.current }">${ status.current }</a>
														</li>
													</c:when>
													<c:otherwise>					
														<li class="page-item">
															<a class="page-link" href="${ path }/admin/qna?page=${ status.current }">${ status.current }</a>
														</li>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
												
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/qna?page=${ pageInfo.nextPage }">
                                                   <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                               </a>
                                           	</li>
                                                
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/qna?page=${ pageInfo.maxPage }">
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
			document.getElementById("ad_qnaboard").classList.add("active");
		}
        
        $(document).ready(() => {
            $('.adminbtn2').on('click', (event) => {
         			var infobtn =  $(event.target);
         			var no = infobtn.data('no');
         			window.location.href = "${ path }/admin/qna/view?no="+no;
         			 
            });
        });
    </script>

    <script src="${path}/bootstrap5/assets/js/main.js"></script>
    
<%-- 
	<script src="${ path }/js/admin/adminMemberModal.js"></script> --%>
</body>

</html>