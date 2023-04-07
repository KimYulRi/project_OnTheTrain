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
</head>
<body>
	<section id="body">
		<h2>로그인</h2>
		<form action="${path}/login/in" method="POST">
				<input type="text" id="userId" name="id" placeholder=" 아이디" required>
				
				<br>

				<input type="password" id="userPwd" name="password" placeholder=" 비밀번호"  required>

				<br>
				
				<input type="checkbox" id="rememberId" name="remember"> <label for="rememberId" id=rememberLabel>아이디 저장</label>
				
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

			<a href="https://kauth.kakao.com/oauth/authorize?client_id=***REMOVED***&redirect_uri=http://localhost:8088/final/login/kakao&response_type=code"><img class="noneButton" src="${ path }/images/member/kakao.png"></a><br>
			<a href="${url}"><img class="noneButton" src="${ path }/images/member/naver.png"></a><br>

	</section>
</body>
</html>