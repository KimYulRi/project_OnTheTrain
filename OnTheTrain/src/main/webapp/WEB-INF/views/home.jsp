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
<link rel="stylesheet" href="${ path }/css/common/common.css">
<%@ include file="../views/common/header.jsp" %>
</head>
<body>
	<main>
        <div class="main-container">
        	<div id="ticketArea">
        		<img src="${ path }/images/common/main.jpg" alt="">
        	</div>
        	<div class="contentArea">
        		<div id="content1">
 <a href="${ path }/scheduler/main">스케줄러 메인으로</a>
  <a href="${ path }/myPage/myPageticket">마이페이지 이동 테스트</a>
			        <h1>
					   메인페이지 수정 중
					</h1>
					
					<P>  The time on the server is ${serverTime}. </P>
				</div>
		    </div>
	    </div>
      </main>
</body>
</html>