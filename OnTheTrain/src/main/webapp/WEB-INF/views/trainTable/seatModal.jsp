<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link href="${ path }/css/trainTable/seatModal.css" rel="stylesheet"
	type="text/css">

</head>

<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<script src="${ path }/js/common/jquery-3.6.3.min.js"></script>
<body>

	<div id="modal" class="modal">
		<div class="modal-backdrop"></div>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">좌석 선택</div>
				</div>
				<div class="modal-body">
					<div>
						<ul>
							<li>요청하신 승객n명의 원하시는 좌석을 선택해주세요.</li>
							<li>발매가 가능한 좌석을 선택할 수 있습니다.</li>
							<li>원하시는 좌석을 선택 후 [선택좌석 예약하기] 버튼을 클릭하시면 예약이 완료됩니다.</li>
							<li>원하지 않는 좌석이 선택된 경우에는 좌석을 한 번 더 클릭하시면 취소됩니다.</li>
						</ul>
					</div>

					<div class="train">
						<div class="carriage">
							<p class="center">특실 1호차</p>
						</div>
						<div class="carriage">
							<p class="center">특실 2호차</p>
						</div>
						<div class="carriage">
							<p class="center">일반실 3호차</p>
						</div>
						<div class="carriage">
							<p class="center">일반실 4호차</p>
						</div>
					</div>



					<div class="seats" align="center">
						<table>
							<tbody>
								<tr>
									<td><div class="seat">1A</div></td>
									<td><div class="seat">2A</div></td>
									<td><div class="seat">3A</div></td>
									<td><div class="seat">4A</div></td>
									<td><div class="seat">5A</div></td>
									<td><div class="seat">6A</div></td>
									<td><div class="seat">7A</div></td>
									<td><div class="seat">8A</div></td>
								</tr>
								<tr>
									<td><div class="seat">1B</div></td>
									<td><div class="seat">2B</div></td>
									<td><div class="seat">3B</div></td>
									<td><div class="seat">4B</div></td>
									<td><div class="seat">5B</div></td>
									<td><div class="seat">6B</div></td>
									<td><div class="seat">7B</div></td>
									<td><div class="seat">8B</div></td>
								</tr>
								<tr>
									<td><input type="text"
										style="width: 30px; border: none; font-weight: bold;"
										class="depPlaceText"> <input style="height: 25px;"
										type="hidden" id="depPlaceId"></td>
									<td>>>>>>>></td>
									<td colspan="4" style="text-align: center">통로다 이새끼들아</td>
									<td>>>>>>>></td>
									<td><input type="text"
										style="width: 30px; border: none; font-weight: bold;"
										class="arrPlaceText"> <input style="height: 25px;"
										type="hidden" id="arrPlaceId"></td>
								</tr>
								<tr>
									<td><div class="seat">1C</div></td>
									<td><div class="seat">2C</div></td>
									<td><div class="seat">3C</div></td>
									<td><div class="seat">4C</div></td>
									<td><div class="seat">5C</div></td>
									<td><div class="seat">6C</div></td>
									<td><div class="seat">7C</div></td>
									<td><div class="seat">8C</div></td>
								</tr>

								<tr>
									<td><div class="seat">1D</div></td>
									<td><div class="seat">2D</div></td>
									<td><div class="seat">3D</div></td>
									<td><div class="seat">4D</div></td>
									<td><div class="seat">5D</div></td>
									<td><div class="seat">6D</div></td>
									<td><div class="seat">7D</div></td>
									<td><div class="seat">8D</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button class="apply-button">선택좌석 예약하기</button>
					<button class="cancel-button">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>