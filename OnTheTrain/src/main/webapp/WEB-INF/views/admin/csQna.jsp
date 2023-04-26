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
    <link rel="stylesheet" href="${path}/css/admin/csQna.css">
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
      
      <div class="content" id="qnahead">

        궁금한 점이 있으신가요?<br>
        고객님의 문의사항 해결을 위해 최선을 다하겠습니다.
      </div>

        
      <div class="content" id="content-list">
        <hr>
        	<p id="spanPoint">1:1 상담 전에 꼭 확인해주세요.</p>
        <ul id="qnalist">
        	<li>※ 질문하신 질문의 답변은 마이페이지>1:1게시판 문의내역에서 답변내용을 확인 하실 수 있습니다</li>
        	<li>※ 1:1 고객문의 처리시간은 09:00 ~18:00 입니다. (문의는 24시간 언제나 가능합니다.)</li>
        	<li>※ 최단시간 내에 접수사항을 조치하여 해결해 드리도록 하겠습니다.</li>
        	<li>※ 피해 발생시에는 공정거래위원회 소비자분쟁해결기준에 의거해서 처리됩니다.</li>
        </ul>
      </div>
      
       <div class="content" id="content-btn">
        <button class="qnaBtn" onclick="toQna()">문의하기</button>
      </div>  
  </div>
</section>
	<script>
	function toQna() {
		  window.location.href = "${ path }/myPage/myPageQnaWrite";
		}
	</script>

    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>