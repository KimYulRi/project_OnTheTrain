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
<link href="${ path }/css/scheduler/schedulerCreate.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${ path }/css/scheduler/schedulerModal.css">
<link rel="stylesheet" type="text/css"
	href="${ path }/css/scheduler/calender/onthetrain_theme.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<title>Document</title>
<link>
</head>
<body>
	<article>
		<div id="schedulerBanner">스케줄러</div>
		<div id="schedulerTitle">나의 멋진 일정</div>
		<div></div>
		<div id="scheduler">
			<div id="schedulerCalender" class="calendarContainer">
				<div id="dp"></div>
			</div>
			<div id="schedulerSidemenu">
				<div class="sideMenuIcon">아이콘1</div>
				<div class="sideMenuIcon">아이콘2</div>
				<div class="sideMenuIcon">아이콘3</div>
				<div class="sideMenuIcon">아이콘4</div>
			</div>
		</div>
		<br>
		<div id="schedulerComponents">
			<div id="selectComponent">
				<button>prev</button>
				<div class="componentText">
					<a href="${ path }/scheduler/create/event">일정</a>
				</div>
				<div class="componentText">
					<a href="${ path }/scheduler/create/accommodation">숙소</a>
				</div>
				<div class="componentText">
					<a href="${ path }/scheduler/create/ticket">승차권</a>
				</div>
				<button>next</button>
			</div>
			<hr>
			<div class="title">추가된 ${currentComponent}</div>
			<div id="addedComponent" class="components">
				<div class="card">
					<div class="cardThumbnail"></div>
					<div class="cardBrief">
						<div class="cardTitle">cardTitle</div>
						<div class="cardRequiredDetail">cardRequiredDetail</div>
						<div class="cardOptionalDetail">cardOptionalDetail</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="title">추가 대기 중인 ${currentComponent}</div>
			<div id="waitComponentList" class="components">
				<div id="addCard">
					<div id="addCard">
						<button>+</button>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="title">${currentComponent}조회</div>
		<div id="searchComponent">
			<div>
				지역 코드 조회 <select name="location">
					<option value="">전체</option>
					<c:forEach var="location" items="${locationCodeList}">
						<option value="${location.code}">${location.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<jsp:include page="./schedulerModal.jsp" />
		<script src="${ path }/js/scheduler/calender/daypilot-all.min.js"></script>
		<script src="${ path }/js/scheduler/schedulerModal.js"></script>
		<script src="${ path }/js/scheduler/schedulerCreate.js"></script>
	</article>
</body>
</html>