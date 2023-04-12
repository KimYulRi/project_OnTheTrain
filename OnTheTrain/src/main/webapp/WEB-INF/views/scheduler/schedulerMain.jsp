<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${ path }/css/scheduler/schedulerMain.css" rel="stylesheet"
	type="text/css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
</head>
<body>
	<article>
		<div id="schedulerBanner">
			<div id="schedulerBannerTextBox">
				<div class="title">스케줄러</div>
				<div class="subtitle">일정, 숙박, 승차권을 한 눈에 관리하세요</div>
			</div>
		</div>
		<div id="schedulerCreate" class="schedulerBanners">
			<div class="subtitle">새 일정 만들기</div>
		</div>
		<div id="schedulerRead" class="schedulerBanners">
			<div class="subtitle">만든 일정 확인하기</div>
		</div>
	</article>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath",
				"${pageContext.request.contextPath}");
	</script>
	<script src="${ path }/js/scheduler/schedulerMain.js"></script>
</body>
</html>