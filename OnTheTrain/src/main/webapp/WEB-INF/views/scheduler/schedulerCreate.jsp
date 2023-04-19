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
<link rel="stylesheet" href="${ path }/css/common/jquery-ui.min.css">
<script src="${ path }/js/common/jquery-ui.min.js"></script>
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
				<div class="componentText" data-component="event">일정</div>
				<div class="componentText" data-component="accommodation">숙소</div>
				<div class="componentText" data-component="ticket">승차권</div>
			</div>
		</div>
		<hr>
		<div class="title">
			추가된
			<div class="componentName">${basicComponent}</div>
		</div>
		<div id="noAddedComponentArea">
			<div class="noAddedComponent">
				<div class="noComponentImg"></div>
				<div class="noComponentMsg">
					추가된
					<div class="componentName">${basicComponent}</div>
					없음
				</div>
			</div>
		</div>
		<div id="addedComponent" class="components"></div>
		<hr>
		<div class="title">
			추가 대기 중인
			<div class="componentName">${basicComponent}</div>
			<button id="waitDeleteMode-button" class="delete-button">삭제모드OFF</button>
			<button id="deleteAllWait-button" class="delete-button">모두
				삭제</button>
		</div>
		<div id="waitComponentList" class="components">
			<div id="addCard">
				<div>
					<button>+</button>
				</div>
			</div>
			<div class="card" draggable="true">TestCard</div>
		</div>
		<hr>
		<div class="title">
			<div class="componentName">${basicComponent}</div>
			조회
		</div>
		<div id="searchComponent">
			<select name="locationCode">
				<option>지역 선택</option>
				<option value="">전체</option>
				<c:forEach var="location" items="${locationCodeList}">
					<option value="${location.code}">${location.name}</option>
				</c:forEach>
			</select>
		</div>
		<br>
		<div id="eventList" class="components"></div>
		<div id="noResultArea">
			<div class="noResult">
				<div class="noResultImg"></div>
				<div class="line-break"></div>
				<div class="noResultMsg">조회된 결과가 없습니다.</div>
			</div>
		</div>
		<jsp:include page="./schedulerModal.jsp" />
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("currentComponent", "${currentComponent}");
		</script>
		<script src="${ path }/js/scheduler/calender/daypilot-all.min.js"></script>
		<script type="module" src="${ path }/js/scheduler/schedulerModal.js">
		<script src="${ path }/js/scheduler/schedulerModal.js"></script>
		<script src="${ path }/js/scheduler/schedulerCreate.js"></script>
		<script
			src="${ path }/js/scheduler/calender/schedulerCreateCalender.js"></script>
	</article>
</body>
</html>