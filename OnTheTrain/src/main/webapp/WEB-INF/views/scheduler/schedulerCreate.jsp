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
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<title>Document</title>
<link>
</head>
<body>
	<article>
		<div id="schedulerBanner">스케줄러</div>
		<div id="scheduler">
			<div id="schedulerTitle">나의 멋진 일정</div>
			<div id="schedulerCalender"></div>
			<div id="schedulerSidemenu"></div>
		</div>
		<div id="schedulerComponents">
			<div id="selectComponent">
				<button>prev</button>
				<div class="componentText"><a href="${ path }/scheduler/create/event">일정</a></div>
				<div class="componentText"><a href="${ path }/scheduler/create/accommodation">숙소</a></div>
				<div class="componentText"><a href="${ path }/scheduler/create/ticket">승차권</a></div>
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
			<div id="waitComponent" class="components">
				<div id="waitComponentList"></div>
				<div class="addCard">
					<button>+</button>
				</div>
			</div>
			<hr>
			<div class="title">${currentComponent} 조회</div>
			<div id="searchComponent"></div>
		</div>
		<jsp:include page="./schedulerModal.jsp" />
		<script src="${ path }/js/scheduler/schedulerModal.js"></script>
		<script src="${ path }/js/scheduler/schedulerCreate.js"></script>
	</article>
</body>
</html>