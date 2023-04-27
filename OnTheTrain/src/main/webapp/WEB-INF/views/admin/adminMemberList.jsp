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
   	<link rel="stylesheet" type="text/css" href="${ path }/css/admin/adminMemberListModal.css">
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
                <h4>회원 관리</h4>
            </div>
                <div class="page-content">
                  <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">
                                    <div class="card-body">
                                       
                                        <div class="input-group mb-4" id="adminSelectwrap">
                                        
                                        <p>전체 회원수 <code class="highlighter-rouge">${ totalMember }</code>명</p>
	                                        <div id="adminSelect">
	                                                    <select class="form-select" id="adminfilter">
	                                                        <option selected>전체</option>
	                                                        <option value="1">정상회원</option>
	                                                        <option value="2">정지회원</option>
	                                                        <option value="3">탈퇴회원</option>
	                                                    </select>
	                                                    
	                                                    <select class="form-select" id="adminsort">
	                                                        <option selected>회원번호순</option>
	                                                        <option value="1">이름순</option>
	                                                        <option value="2">가입일자순</option>
	                                                    </select>
	                                        </div>
                                        </div>                                        
                                    
                                      
                                  	<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 admin-tb">
                                            <thead>
                                                <tr>
                                                    <th  class="col-2">회원번호</th>
                                                    <th  class="col-1">아이디</th>
                                                    <th  class="col-2">이름</th>
                                                    <th  class="col-1">등급</th>
                                             		<th  class="col-2">가입일자</th>
                                                    <th  class="col-1">상태</th>
                                                    <th class="col-md-3">관리</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach var="member" items="${ list }" >
                                                <tr>
                                                    <td class="text-bold-500">${ member.no }</td>
                                                    <c:if test="${ empty member.id }"><td>${ member.loginTypeText } 회원</td></c:if>
													<c:if test="${ not empty member.id }"><td>${ member.id }</td></c:if>
						
                                                    <td class="text-bold-500">${ member.name }</td>
                                                    <td>${ member.membershipText }</td>
                                                    <td><fmt:formatDate value="${ member.enrollDate }" pattern="yyyy-MM-dd" /></td>
                                                    <td>
                                                    <c:choose>
														  <c:when test="${ member.status == 'X'}">
														     <span class="badge  bg-disable" >
														  </c:when>
														  <c:when test="${ member.status == 'N'}">
														     <span class="badge  bg-light-warning" >
														   </c:when>
														  <c:otherwise>
														     <span class="badge bg-light-primary" >
														  </c:otherwise>
														</c:choose> ${ member.statusText }</span>
                                                   </td>
                                                    
                                                    <td class="text-center d-flex justify-content-center">
                                                    	<div id=tablebtn>
		                                                    <button class="adminbtn1 block" data-no="${ member.no }"
		                                            		data-bs-toggle="modal" data-bs-target="#exampleModalCenter">회원정보</button>
															<button class="adminbtn2">1:1문의</button>
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
                                         		<a class="page-link" href="${ path }/admin/member?page=1">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/member?page=${ pageInfo.prevPage }" >
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                            	</a>
                                            </li>
	                                            
                                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
												<c:choose>
													<c:when test="${ status.current == pageInfo.currentPage}">
														<li class="page-item active">
															<a class="page-link" href="${ path }/admin/member?page=${ status.current }">${ status.current }</a>
														</li>
													</c:when>
													<c:otherwise>					
														<li class="page-item">
															<a class="page-link" href="${ path }/admin/member?page=${ status.current }">${ status.current }</a>
														</li>	
													</c:otherwise>
												</c:choose>
											</c:forEach>
												
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/member?page=${ pageInfo.nextPage }">
                                                   <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                               </a>
                                           	</li>
                                                
                                            <li class="page-item">
                                            	<a class="page-link" href="${ path }/admin/member?page=${ pageInfo.maxPage }">
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
	<jsp:include page="../admin/adminMemberListModal.jsp" />
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
    <script>
        // 메뉴바 변경
        window.onload = function() {
			document.getElementById("ad_memberboard").classList.add("active");
		}
        
        /* 회원정보 모달버튼 누르면 값 전달 */
	$(document).ready(() => {
       $('.adminbtn1').on('click', (event) => {
    			 var infobtn =  $(event.target);
    			 var no = infobtn.data('no');

    			 
    			 $.ajax({
    					type: 'POST',
    					url:  '${path}/admin/member/findMemberInfo',
    					dataType: 'json',
    					data: {
    						no
    					},
    					success: (obj) => {
    						if(obj!=null){
    							$('#userId').val(obj.id);
    							$('#nickname').val(obj.nickname);
    							$('#name').val(obj.name);
    							
    							const birth = new Date(obj.birth);
    							const year = birth.getFullYear();
    							const month = birth.getMonth() + 1;
    							const day = birth.getDate();
    							
    							$('#birth1').val(year);
    							$('#birth2').val(month);
    							$('#birth3').val(day);
    							
    							const [email1, email2] = obj.email.split('@');
    							$('#email1').val(email1);
    							$('#email2').val(email2);
    							
    							
    							const [phone1, phone2, phone3] = obj.phone.split('-');
    							$('#phone1').val(phone1);
    							$('#phone2').val(phone2);
    							$('#phone3').val(phone3);
    							
    							if(obj.address!=null){
    								$('#address').val(obj.address);
    							}
    							
    							$('#membership').val(obj.membership);
    							$('#status').val(obj.status);
    							
    						} else {
    							alert("회원정보를 찾을 수 없습니다!");
    						}
    						
    					},
    					error: (error)=> {
    						alert(error);
    					}
    					
    				});
    			 
    			
    		});
       
       const form = document.querySelector('#memberUpdateForm');
       const modal = document.querySelector('#exampleModalCenter');
       modal.addEventListener('hidden.bs.modal', function () {
	    	   form.reset();
	       });
       
      
       
	});
        
        
    </script>

    <script src="${path}/bootstrap5/assets/js/main.js"></script>
    
<%-- 
	<script src="${ path }/js/admin/adminMemberModal.js"></script> --%>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>