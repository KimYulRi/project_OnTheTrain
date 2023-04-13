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
<title>로그인</title>
<link rel="stylesheet" href="${ path }/css/member/login.css">
<%@ include file="../common/header.jsp" %>
</head>
<body>
	<section>
	<div id="body">
		<form action="${path}/login/in" method="POST">
			<h2>로그인</h2>
				<input type="text" id="userId" name="id" placeholder=" 아이디" 
				value="${ empty cookie.rememberId ? '' : cookie.rememberId.value }" required>
					
				<br>

				<input type="password" id="userPwd" name="password" placeholder=" 비밀번호"  required>

				<br>
				
				<input type="checkbox" id="rememberId" name="rememberId" 
				${ empty cookie.rememberId ? "" : "checked" }> <label for="rememberId" id=rememberLabel>아이디 저장</label>
				
				<br>
				
				<input type="submit" id="loginbtn" value="로그인">
			</form>
			
			<div class="atag-wrrap">
				<a href="#" class="atag" >아이디 찾기&nbsp;</a>
				<span class="atag">|</span>
				<a href="#" class="atag">&nbsp;비밀번호 찾기</a>
				
				<a href="#" class="atag" id="enroll">회원가입</a>
			</div>
			
			<br>
			
			<a href="${Kurl}"><img class="noneButton" src="${ path }/images/member/kakao.png"></a><br>
			<a href="${Nurl}"><img class="noneButton" src="${ path }/images/member/naver.png"></a><br>

	</div>
	</section>
</body>
</html>