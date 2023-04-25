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
<title>온더트레인 - 고객센터</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   	<link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/css/admin/csFaqList.css">
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
      
      <div class="content" id="content-list">
		  	<table class="table table-hover" id="noticetable">
                    <tbody>
                    <c:forEach var="list" items="${ list }" >
                        <tr class="table-light toggleclickb" id="toggleclick${list.no}" data-no="${list.no}">
                            <td class="col-2 tdcenter"><b>${ list.type }</b></td>
                            <td><b>Q. </b>${ list.title }</td>
                            <td class="col-1" id="updown${list.no}"><i class="bi bi-chevron-down"></i></td>
                      </tr>		
                        <tr class="toggledisplay" id="toggleopen${list.no}">
                            <td></td>
                            <td>${ list.content }</td>
                            <td></td>
                        </tr>
                     </c:forEach>									
                    </tbody>
                </table>
		  
      </div>
      
  </div>
</section>

    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
    <script>
    $(document).ready(() => {
    	       $('.toggleclickb').on('click', (event) => {
		    	 var infobtn =  $(event.currentTarget);
				 var no = infobtn.data('no');
				 var id = "toggleopen"+no;
				 var ud = "updown"+no;
				console.log(no);
				 
		    	 var row = document.getElementById(id);
		    	 var el = document.getElementById(ud).querySelector("i");
		    	
		    	  if (row.style.display === "none") {
		    	    row.style.display = "table-row";
		    	    el.classList.remove("bi-chevron-down");
		    	    el.classList.add("bi-chevron-up");
		    	  } else {
		    	    row.style.display = "none";
		    	    el.classList.remove("bi-chevron-up");
		    	    el.classList.add("bi-chevron-down");
		    	  }
			});
  });
    </script>
</body>
</html>