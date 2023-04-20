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
<link rel="stylesheet" type="text/css" href="${ path }/css/member/findId.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<%@ include file="../common/header.jsp" %>
</head>
<body>
<section>
		<div id="body">
				<div class="content1">
					<h3>아이디 찾기</h3>
						<span class="sub"><b>회원가입시 등록하신 이름과 이메일을 입력해주세요.</b></span>
				</div>
				<div class="content2">
					<input type="text" name="name" id="name" class="texttype2" maxlength="10" placeholder=" 이름">
					<br>
					<input type="text"  class="texttype3" name="email1" id="email1"  placeholder="이메일">&nbsp;&nbsp;@&nbsp;
					<input type="text"  class="texttype3" name="email2" list="email3"  id="email2" placeholder="직접입력">
					<datalist id="email3">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</datalist>	
				</div>
					<button class="Searchbtn" id="submitBtn">아이디 찾기</button>
	
		</div>
		<div id="after_body">   
				<div class="content1">
					<h3>아이디 확인</h3>
						<span class="sub"><b>입력하신 정보와 일치하는 아이디는 다음과 같습니다.</b></span>
				</div>
				<div class="content3">
					<p class="resulttext"><span id="result_name"></span>님의 아이디는</p>
					<p class="resulttext"><span id="result_id"></span>입니다.</p>
				</div>	
					<button onclick="window.location.href='${ path }/login'" class="Searchbtn">로그인 바로가기</button>
				
		</div>
</section>
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath",
				"${pageContext.request.contextPath}");
</script>
<script src="${ path }/js/member/findId.js"></script>
</body>
</html>