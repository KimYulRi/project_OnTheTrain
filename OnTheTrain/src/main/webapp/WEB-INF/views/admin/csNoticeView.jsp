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
    <link rel="stylesheet" href="${path}/css/admin/csNoticeView.css">
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
      

      <div class="content" id="content-tablehead">
    
    	<div id="btnarea">
        <button class="noticeBtn" id="updateBtn">수정</button>
        <button class="noticeBtn" id="deleteBtn">삭제</button>
        </div>
        
      </div>  
        
      <div class="content" id="content-list">
        <table class="table" id="noticetable">
                    <thead>
                      <tr>
                            <td class="col-1 paddingtd"><span id="cate">카테고리</span></td>
                            <td id="title">게시글이름</td>
                            <td class="col-1">날짜</td>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td id="tbcontent" colspan="3">글내용</td>
                        </tr>
                    </tbody>
                </table>
      </div>
      
      <div class="content" id="content-btn">
        <button class="noticeBtn" onclick="tolist()">목록</button>
      </div>  
      
  </div>
</section>
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>