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
<title>온더트레인</title>
<link href="${ path }/css/scheduler/schedulerCreate.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${ path }/css/scheduler/schedulerModal.css">
<link rel="stylesheet" type="text/css"
	href="${ path }/css/scheduler/calender/onthetrain_theme.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<link rel="stylesheet"
	href="${ path }/css/scheduler/jquery-ui.schdeuler.css">
<script src="${ path }/js/common/jquery-ui.min.js"></script>
<%@ include file="../common/header.jsp"%>
</head>
<body>
	<article>
		<div id="schedulerBanner">스케줄러</div>
		<div id="schedulerTitle">
			나의 멋진 일정
			<div id="titleEditButton">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  <path
						d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
</svg>
			</div>
		</div>
		<div id="scheduler">
			<div id="schedulerCalender" class="calendarContainer">
				<div class=days>


					<div class="schedulerCalenderBlank">구분</div>
					<div class="day">일</div>
					<div class="day">월</div>
					<div class="day">화</div>
					<div class="day">수</div>
					<div class="day">목</div>
					<div class="day">금</div>
					<div class="day">토</div>
					<div class="schedulerCalenderLastBlank"></div>

				</div>
				<div id="dp"></div>
			</div>
			<div id="schedulerSidemenu">

				<div class="sideMenuIcon" id="previousWeek-Button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-arrow-bar-left"
						viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5ZM10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5Z" />
</svg>
				</div>
				<div class="sideMenuIcon" id="nextWeek-Button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-arrow-bar-right"
						viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M6 8a.5.5 0 0 0 .5.5h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L12.293 7.5H6.5A.5.5 0 0 0 6 8Zm-2.5 7a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5Z" />
</svg>
				</div>
				<div class="sideMenuIcon" id="download-Button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
  <path
							d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
  <path
							d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
</svg>
				</div>
				<div class="sideMenuIcon" id="save-Button">
					<svg class="svg-icon"
						style="width: 30px; height: 30px; vertical-align: middle; fill: currentColor; overflow: hidden;"
						viewBox="0 0 1024 1024" version="1.1"
						xmlns="http://www.w3.org/2000/svg">
						<path
							d="M725.333333 128H213.333333c-47.146667 0-85.333333 38.186667-85.333333 85.333333v597.333334c0 47.146667 38.186667 85.333333 85.333333 85.333333h597.333334c47.146667 0 85.333333-38.186667 85.333333-85.333333V298.666667l-170.666667-170.666667zM512 810.666667c-70.613333 0-128-57.386667-128-128s57.386667-128 128-128 128 57.386667 128 128-57.386667 128-128 128z m128-426.666667H213.333333v-170.666667h426.666667v170.666667z" /></svg>

				</div>
				<div class="sideMenuIcon" >
					<svg class="svg-icon"
						style="width: 30px; height: 30px; vertical-align: middle; fill: currentColor; overflow: hidden;"
						viewBox="0 0 1024 1024" version="1.1"
						xmlns="http://www.w3.org/2000/svg">
						<path d="M746.932 698.108" />
						<path
							d="M925.731 288.698c-1.261-1.18-3.607-3.272-6.902-6.343-5.486-5.112-11.615-10.758-18.236-16.891-18.921-17.526-38.003-35.028-56.046-51.397-2.038-1.848-2.038-1.835-4.077-3.682-24.075-21.795-44.156-39.556-58.996-52.076-8.682-7.325-15.517-12.807-20.539-16.426-3.333-2.402-6.043-4.13-8.715-5.396-3.365-1.595-6.48-2.566-10.905-2.483C729.478 134.227 720 143.77 720 155.734l0 42.475 0 42.475 0 84.95L720 347l21.205 0L890 347l0 595L358.689 942C323.429 942 295 913.132 295 877.922L295 177l361.205 0c11.736 0 21.25-9.771 21.25-21.5s-9.514-21.5-21.25-21.5l-382.5 0L252 134l0 21.734L252 813l-52.421 0C166.646 813 140 786.928 140 754.678L140 72l566.286 0C739.29 72 766 98.154 766 130.404L766 134l40 0 0-3.596C806 76.596 761.271 33 706.286 33L119.958 33 100 33l0 19.506 0 702.172C100 808.463 144.642 852 199.579 852L252 852l0 25.922C252 936.612 299.979 984 358.689 984l552.515 0L932 984l0-21.237L932 325.635 932 304l0.433 0C932.432 299 930.196 292.878 925.731 288.698zM762 304l0-63.315L762 198.21l0-0.273c14 11.479 30.3 26.369 49.711 43.942 2.022 1.832 2.136 1.832 4.157 3.665 17.923 16.259 36.957 33.492 55.779 50.926 2.878 2.666 5.713 5.531 8.391 7.531L762 304.001z" />
						<path
							d="M816.936 436 407.295 436c-10.996 0-19.91 8.727-19.91 19.5 0 10.77 8.914 19.5 19.91 19.5l409.641 0c11 0 19.914-8.73 19.914-19.5C836.85 444.727 827.936 436 816.936 436z" />
						<path
							d="M816.936 553 407.295 553c-10.996 0-19.91 8.727-19.91 19.5 0 10.774 8.914 19.5 19.91 19.5l409.641 0c11 0 19.914-8.726 19.914-19.5C836.85 561.727 827.936 553 816.936 553z" />
						<path
							d="M816.936 689 407.295 689c-10.996 0-19.91 8.729-19.91 19.503 0 10.769 8.914 19.497 19.91 19.497l409.641 0c11 0 19.914-8.729 19.914-19.497C836.85 697.729 827.936 689 816.936 689z" /></svg>
				</div>
				<div class="sideMenuIcon">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path
							d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
</svg>
				</div>
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
		<div class="gray_line"></div>
		<div class="title">
			추가된
			<div class="componentName">${basicComponent}</div>
		</div>
		<div id="addedComponent" class="components">
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
		</div>
		<div class="gray_line"></div>
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
			<!--  <div class="card" draggable="true">TestCard</div>  -->
		</div>
		<div class="gray_line"></div>
		<div class="title">
			<div class="componentName">${basicComponent}</div>
			조회
			<div class="explantion">(*는 필수 입력 정보입니다)</div>
		</div>
		<div id="componentSearchArea">
			<div id="eventSearch">
				<select name="locationCode">
					<option>지역 선택</option>
					<option value="">전체</option>
					<c:forEach var="location" items="${locationCodeList}">
						<option value="${location.code}">${location.name}</option>
					</c:forEach>
				</select>
				<div class="explantion">에서</div>
			</div>
			<input type="date" id="eventStartDate" name="startDate">
			<div class="explantion">(*)부터</div>
			<input type="date" id="eventEndDate" name="endDate">
			<div class="explantion">까지 열리는 행사를 찾습니다.</div>
			<button id="searchEvent-button" class="search-button">검색</button>
			<div class="gray_line"></div>
		</div>
		<br>
		<div>
			<div id="noResultArea">
				<div class="noResult">
					<div class="noResultImg"></div>
					<div class="line-break"></div>
					<div class="noResultMsg">조회된 결과가 없습니다.</div>
				</div>
			</div>
			<div id="resultArea">
				<div id="itemList" class="components"></div>
			</div>
		</div>
		<jsp:include page="./schedulerModal.jsp" />
		<jsp:include page="./schedulerModalView.jsp" />
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("currentComponent", "${currentComponent}");
		</script>
		<script src="${ path }/js/scheduler/calender/daypilot-all.min.js"></script>
		<script type="module"
			src="${ path }/js/scheduler/schedulerModalModule.js"></script>
		<script type="module" src="${ path }/js/scheduler/schedulerCreate.js"></script>
		<script type="module"
			src="${ path }/js/scheduler/schedulerModalViewModule.js"></script>
		<script type="module"
			src="${ path }/js/scheduler/calender/schedulerCreateCalender.js"></script>
	</article>
</body>
</html>