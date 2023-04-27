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
   	<script src="${ path }/js/common/jquery-3.6.3.js"></script>
   	<style>
   	.createCuponBtn{
   	
	width: 100px;
	height: 30px;
	
	font-size: 12px;
	border: 0px;
	border-radius: 4px;
	
	background-color:#596180;
	color: #ffffff;
	}

	.createCuponBtn:hover{
		background-color:#00008B;
		color: #ffffff;
	}
   	</style>
   	
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
                <h4>쿠폰 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
                                       
                                        <div class="mb-4" id="adminSelectwrap">
                                        
                                        <p>전체 쿠폰 수<code class="highlighter-rouge"> ${ totalCupon }</code>개</p>
	                                    <button class="createCuponBtn">쿠폰등록</button>
                                        </div>                                        
                                    
                                      
                                  	<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 admin-tb">
                                            <thead>
                                                <tr>
                                                    <th  class="col-3">쿠폰번호</th>
                                                    <th  class="col-3">쿠폰명</th>
                                                    <th  class="col-3">할인율</th>
                                                    <th class="col-md-3">관리</th>
                                                </tr>
                                            </thead>
                                           <tbody>
                                                <tr>
                                                    <td class="text-bold-500">쿠폰번호</td>
                                                    <td>쿠폰명</td>
                                                    <td class="text-bold-500">할인율</td>
                                                    
                                                    <td class="text-center d-flex justify-content-center">
                                                    	<div id=tablebtn>
		                                                    <button class="adminbtn2 block"
		                                            		data-bs-toggle="modal" data-bs-target="#exampleModalCenter">상세보기</button>
														</div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
                                    </div>
                                </div>
                                
                                <!-- 페이징 -->
                                 <div id="adminpagebar">
                                         <ul class="pagination pagination-primary" >
                                         
                                         	<li class="page-item">
                                         		<a class="page-link" href="${ path }/admin/cupon?page=1">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/cupon?page=${ pageInfo.prevPage }" >
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                            	</a>
                                            </li>
	                                            
                                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
												<c:choose>
													<c:when test="${ status.current == pageInfo.currentPage}">
														<li class="page-item active">
															<a class="page-link" href="${ path }/admin/cupon?page=${ status.current }">${ status.current }</a>
														</li>
													</c:when>
													<c:otherwise>					
														<li class="page-item">
															<a class="page-link" href="${ path }/admin/cupon?page=${ status.current }">${ status.current }</a>
														</li>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
												
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/cupon?page=${ pageInfo.nextPage }">
                                                   <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                               </a>
                                           	</li>
                                                
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/cupon?page=${ pageInfo.maxPage }">
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
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
    <script>
        // 메뉴바 변경
        window.onload = function() {
			document.getElementById("ad_cuponboard").classList.add("active");
		}
        
        
        
    </script>
    <script src="${path}/bootstrap5/assets/js/main.js"></script>
</body>

</html>