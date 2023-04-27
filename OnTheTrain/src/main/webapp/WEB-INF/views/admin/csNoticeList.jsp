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
<title>온더트레인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   	<link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/css/admin/csNoticeList.css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    
	<%@ include file="../common/header.jsp" %>
    
</head>
<body>
<section>
  <div class="seciton-container">
      <div class="content" id="heading-conatiner">
        <h4>고객센터</h4>
      </div>
      <div class="content boxContainer">
        <a href="${path}/cs/notice" id="box1">공지사항</a>
        <a href="${path}/cs/faq" id="box2">자주묻는 질문</a>
        <a href="${path}/cs/qna" id="box3">1:1:문의</a>
      </div>
      
      <div class="content" id="content-search">
<!-- 		<form class="search-form">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                      </svg></button>
        </form> -->

      </div>

      <div class="content" id="content-tablehead">
        <p id="totaltag">총<span id="numspan"> ${ totalNotice }</span>개</p>
        <c:if test="${ not empty loginMember && loginMember.role == 'ROLE_ADMIN' }">
        <button class="noticeBtn" onclick="Towrite()">글쓰기</button>
        </c:if>
      </div>  
        
      <div class="content" id="content-list">
        <table class="table table-hover" id="noticetable">
                    <tbody>
                      <!-- 고정 -->
                 
                    <c:forEach var="fixList" items="${ fixList }" >
                        <tr class="table-light">
                            <td class="col-1 centertd"><span id="fixed">공지</span></td>
                            <td class="paddingtd"><span id="cate">${ fixList.type }</span></td>
                            <td class="boldtd"=><a href="${ path }/cs/notice/view?no=${ fixList.no }">
									${ fixList.title }
								</a></td>
                            <td class="col-1"><fmt:formatDate value="${ fixList.createDate }" pattern="yyyy-MM-dd"/></td>
                      </tr>
                    </c:forEach>
                    			
                        <!-- 전체 -->
                    	<c:forEach var="list" items="${ list }">
                        <tr>
                            <td class="centertd">${ list.no }</td>
                            <td class="paddingtd"><span id="cate">${ list.type }</span></td>
                            <td><a href="${ path }/cs/notice/view?no=${ list.no }">
									${ list.title }
								</a>
							</td>
                            <td>
                            <fmt:formatDate value="${ list.createDate }" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                      </c:forEach>										
                    </tbody>
                </table>
      </div>
      <div class="content">
      	<div id="content-pagebar">
	        <ul class="pagination pagination-primary" >
	        
	          <li class="page-item">
	            <a class="page-link" href="${ path }/cs/notice/page=1">
	                  <span aria-hidden="true"><i class="bi bi-chevron-double-left"></i></span>
	              </a>
	          </li>
	          <li class="page-item">
	            <a class="page-link" href="${ path }/cs/notice?page=${ pageInfo.prevPage }" >
	                  <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
	            </a>
	          </li>
	            
	            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
	            <c:choose>
	            <c:when test="${ status.current == pageInfo.currentPage}">
	          <li class="page-item active">
	            <a class="page-link" href="${ path }/cs/notice?page=${ status.current }">${ status.current }</a>
	          </li>
	            </c:when>
	            <c:otherwise>					
	          <li class="page-item">
	            <a class="page-link" href="${ path }/cs/notice?page=${ status.current }">${ status.current }</a>
	          </li>
	            </c:otherwise>
	            </c:choose>
	            </c:forEach>
	
	          <li class="page-item">
	            <a class="page-link" href="${ path }/cs/notice?page=${ pageInfo.nextPage }">
	              <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
	            </a>
	            </li>
	          <li class="page-item">
	            <a class="page-link" href="${ path }/cs/notice?page=${ pageInfo.maxPage }">
	                <span aria-hidden="true"><i id="pagecs" class="bi bi-chevron-double-right"></i></span>
	            </a>
	          </li>
	        </ul>
      </div>
      </div>
  </div>
</section>
<script>
      const inputElement = document.querySelector('.search-form input');
      const headersearchform = document.querySelector('.search-form');
      inputElement.addEventListener('focus', function() {
    	  headersearchform.style.borderColor = 'rgba(129, 177, 245, .8)';
      });
	  inputElement.addEventListener('blur', function() {
		  headersearchform.style.borderColor = '#D3D2D2';
	  });
	  function Towrite() {
		  window.location.href = "${ path }/cs/notice/write";
		}
	</script>
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>