<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script type="module"
	src="${ path }/js/scheduler/schedulerComponent/schedulerEvent.js"></script>


<div id="schedulerEventModal" class="modal">
	<div class="modal-backdrop"></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title">Event Modal Title</div>
			</div>
			<div class="modal-body">
				<div class="eventImage">
					<div class="image-preview">
						<span class="image-caption">이미지 등록</span>
						<input class="image-upload" type="file">
						<img class="preview-image"
							src="${ path }/images/common/OnTheTrain_Logo.png"
							alt="Preview Image" />
					</div>
				</div>
				<div class="eventRequired">
					<h3 class="modal-subtitle">필수 항목</h3>
					<label for="event-title">일정명</label>
					<input type="text" id="event-title" required>
					<label for="event-location">위치</label>
					<input type="text" id="event-location" required>
					<div class="schedulerTimes">
						<label for="event-start-time" class="timelabel">시작 시간</label> <label
							for="event-end-time">종료 시간</label>
						<input type="datetime-local" id="event-start-time" required>
						<input type="datetime-local" id="event-end-time" class="endtime"
							required>
					</div>
				</div>
				<div class="eventOptional">
					<h3 class="modal-subtitle">선택 항목</h3>
					<label for="event-price">가격</label>
					<input type="number" id="event-price" class="form-control">
					<label for="event-details">세부사항</label>
					<textarea id="event-details" class="form-control"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="add-button">Apply</button>
				<button class="reset-button">Reset</button>
				<button class="cancel-button">Cancel</button>
			</div>
		</div>
	</div>
</div>

<div id="schedulerAccommodationModal" class="modal">
	<div class="modal-backdrop"></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title">Accommodation Modal Title</div>
			</div>
			<div class="modal-body">
				<div class="accommodationImage">
					<div class="image-preview">
						<span id="accommodation-image-caption" class="image-caption">이미지
							등록</span>
						<input id="accommodation-image-upload" class="image-upload"
							type="file">
						<img id="accommodation-preview-image" class="preview-image"
							src="${ path }/images/common/OnTheTrain_Logo.png"
							alt="Preview Image" />
					</div>
				</div>
				<div class="accommodationRequired">
					<h3 class="modal-subtitle">필수 항목</h3>
					<label for="accommodation-title">숙소명</label>
					<input type="text" id="accommodation-title" required>
					<div class="schedulerTimes">
						<label for="accommodation-start-time" class="timelabel">시작
							시간</label> <label for="accommodation-end-time">종료 시간</label>
						<div class="line-break"></div>
						<input type="date" id="accommodation-start-time" required>
						<input type="date" id="accommodation-end-time" class="endtime"
							required>
					</div>
					<label for="accommodation-title">위치</label>
					<input type="text" id="accommodation-location" required>
				</div>
				<div class="accommodationOptional">
					<h3 class="modal-subtitle">선택 항목</h3>
					<label for="accommodation-stars">별점</label>
					<input type="number" id="accommodation-stars" class="form-control">
					<label for="accommodation-price">가격</label>
					<input type="number" id="accommodation-price" class="form-control">
					<label for="event-details">세부사항</label>
					<textarea id="accommodation-details" class="form-control"></textarea>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="add-button">Apply</button>
			<button class="cancel-button">Cancel</button>
		</div>
	</div>
</div>
<div id="schedulerTicketModal" class="modal">
	<div class="modal-backdrop"></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title">Ticket Modal Title</div>
			</div>
			<div class="modal-body">
				<div class="TicketRequired">
					<h3 class="modal-subtitle">필수 항목</h3>
					<div class="schedulerTicketStation">
						<label for="ticketDep" class="timelabel">출발역</label> <label
							for="ticketArr">도착역</label>
						<div class="line-break"></div>
						<input type="text" id="ticketDep" required>
						<input type="text" id="ticketArr" class="endtime" required>
					</div>
					<div class="schedulerTimes">
						<label for="ticket-start-time" class="timelabel">출발 시간</label> <label
							for="ticket-end-time">도착 시간</label>
						<div class="line-break"></div>
						<input type="datetime-local" id="ticket-start-time" required>
						<input type="datetime-local" id="ticket-end-time" class="endtime" required>
					</div>
				</div>
				<div class="accommodationOptional">
					<h3 class="modal-subtitle">선택 항목</h3>
					<label for="accommodation-stars">인원</label>
					<input type="number" id="accommodation-stars" class="form-control">
					<label for="accommodation-price">비용</label>
					<input type="number" id="accommodation-price" class="form-control">
					<label for="event-details">세부사항</label>
					<textarea id="accommodation-details" class="form-control"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button class="add-button">Apply</button>
				<button class="cancel-button">Cancel</button>
			</div>
		</div>
	</div>
</div>