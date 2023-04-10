<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="modal">
	<div class="modal-header">
		<h2 class="modal-title">모달창 제목</h2>
	</div>
	<div class="modal-body">
		<div class="modal-image">
			<p>이미지 등록</p>
			<div class="image-area"></div>
		</div>
		<div class="modal-required">
			<h3>필수 입력 항목</h3>
			<form>
				<label for="name">일정명:</label> <input type="text" id="name"
					name="name"><br> <br> <label for="start-time">시작시간:</label>
				<input type="datetime-local" id="start-time" name="start-time"><br>
				<br> <label for="end-time">종료시간:</label> <input
					type="datetime-local" id="end-time" name="end-time"><br>
				<br>
			</form>
		</div>
		<div class="modal-optional">
			<h3>선택 입력 항목</h3>
			<form>
				<label for="price">가격:</label> <input type="number" id="price"
					name="price"><br> <br> <label for="details">세부사항:</label>
				<textarea id="details" name="details"></textarea>
				<br> <br>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<button class="apply-button">적용</button>
		<button class="reset-button">초기화</button>
		<button class="delete-button">삭제</button>
	</div>
</div>