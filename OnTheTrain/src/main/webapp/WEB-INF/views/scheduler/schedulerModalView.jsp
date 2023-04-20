<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />


<div id="schedulerEventModalView" class="modal">
	<div class="modal-backdrop"></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title">Event Modal Title</div>
			</div>
			<div class="modal-body">
				<div class="eventImage">
					<div class="image-preview">
<!-- 						<span class="image-caption">이미지 등록</span> -->
						<img id="preview-image_view"
							src="${ path }/images/common/OnTheTrain_Logo.png"
							alt="Preview Image" />
					</div>
				</div>
				<div class="eventRequired">
					<h3 class="modal-subtitle">필수 항목</h3>
					<label for="event-title_view">일정명</label> <span
						id="eventTitle_view" class="view-field"></span>
					<br>
					<br>
					<label for="event-location_view">위치</label> <span
						id="eventLocation_view" class="view-field"></span>
					<br>
					<br>
					<div class="schedulerTimes">
						<label for="event-start-time_view" class="timelabel">시작 시간</label>
						<label for="event-end-time_view">종료 시간</label> <span
							id="eventStartTime_view" class="view-field"></span> <span
							id="eventEndTime_view" class="view-field"></span>
					</div>
				</div>
				<div class="eventOptional">
					<h3 class="modal-subtitle">선택 항목</h3>
					<label for="event-price_view">가격</label> <span id="eventPrice_view"
						class="view-field"></span>
					<br>
					<br>
					<label for="event-details_view">세부사항</label> <span
						id="eventDetails_view" class="view-field"></span>
				</div>
			</div>
			<div class="modal-footer">
				<button class="confirm-button">확인</button>
				<button class="edit-button">수정</button>
				<button class="modalDelete-button">삭제</button>
			</div>
		</div>
	</div>
</div>



