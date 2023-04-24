<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<<<<<<< HEAD
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>온더테이블</title>

<link href="${ path }/css/trainTable/trainMain.css" rel="stylesheet"
	type="text/css">

<link href="${ path }/css/trainTable/calendar.css" rel="stylesheet"
	type="text/css">

<link href="${ path }/css/trainTable/seatModal.css" rel="stylesheet"
	type="text/css">

<%@ include file="../common/header.jsp"%>
</head>
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<script src="${ path }/js/common/jquery-3.6.3.min.js"></script>

<body>
	<div id="banner">
		<div id="banner_text">승차권 조회</div>
	</div>
	<div id="field">
		<fieldset id="ttable">
			<table align="center" id="ftable">
				<tr id="topTable">
					<th colspan="2" width="100px" style="font-size: 20px">출발</th>
					<td><input style="height: 25px;" type="text"
						class="depPlaceText"> <input style="height: 25px;"
						type="hidden" id="depPlaceId"></td>
					<td>
						<button id="depId">
							<a href="javascript:openPopup()">조회</a>
						</button>
					</td>
				</tr>

				<tr>
					<td colspan="2"></td>
					<td><img src="${ path }/resources/images/trainTable/cross.png"
						style="width: 20px; height: 20px;"></td>
				</tr>
				<tr>
					<th colspan="2" width="100px" style="font-size: 20px;">도착</th>
					<td><input style="height: 25px;" type="text"
						class="arrPlaceText"> <input style="height: 25px;"
						type="hidden" id="arrPlaceId"></td>
					<td>
						<button id="depId">
							<a href="javascript:openPopup1()">조회</a>
						</button>
					</td>

				</tr>
				<tr>
					<th colspan="2" width="100px" style="font-size: 20px;">출발일시</th>
					<td><input style="height: 25px;" type="text" name=""
						id="depPlandTime"></td>
				</tr>

			</table>
			<div id="calcal" style="margin-left: 100px;">
				<table class="Calendar"">
					<thead>
						<tr>
							<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
							<td colspan="5"><span id="calYear"></span>년 <span
								id="calMonth"></span>월</td>
							<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
						</tr>
						<tr>
							<td>일</td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td>토</td>
						</tr>
					</thead>

					<tbody>
					</tbody>
				</table>
			</div>
		</fieldset>

		<fieldset id="ptable">
			<table align="center">
				<div class="personTitle">
					<h3>인원 정보</h3>
				</div>
				<tr>
					<td><select name="adult" id="adult"
						style="width: 190px; height: 40px; cursor: pointer;">
							<option value="0" selected="selected">어른 0명</option>
							<option value="1">어른 1명</option>
							<option value="2">어른 2명</option>
							<option value="3">어른 3명</option>
							<option value="4">어른 4명</option>
							<option value="5">어른 5명</option>
							<option value="6">어른 6명</option>
							<option value="7">어른 7명</option>
							<option value="8">어른 8명</option>
							<option value="9">어른 9명</option>
					</select></td>
				</tr>
				<tr>
					<td><select name="child" id="child"
						style="width: 190px; height: 40px; cursor: pointer;">
							<option value="0" selected="selected">어린이 0명</option>
							<option value="1">어린이 1명</option>
							<option value="2">어린이 2명</option>
							<option value="3">어린이 3명</option>
							<option value="4">어린이 4명</option>
							<option value="5">어린이 5명</option>
							<option value="6">어린이 6명</option>
							<option value="7">어린이 7명</option>
							<option value="8">어린이 8명</option>
							<option value="9">어린이 9명</option>
					</select></td>
				</tr>
				<tr>
					<td><select name="senior" id="senior"
						style="width: 190px; height: 40px; cursor: pointer;">
							<option value="0" selected="selected">경로 0명</option>
							<option value="1">경로 1명</option>
							<option value="2">경로 2명</option>
							<option value="3">경로 3명</option>
							<option value="4">경로 4명</option>
							<option value="5">경로 5명</option>
							<option value="6">경로 6명</option>
							<option value="7">경로 7명</option>
							<option value="8">경로 8명</option>
							<option value="9">경로 9명</option>
					</select></td>
				</tr>
			</table>

			<h3 align="left">도우미 서비스</h3>
			<p>* 휠체어 대여, 휠체어리프트 사용, 시각장애인 동행 서비스 이용을 희망하시는 고객님께선 역사 내 안내센터를
				방문하여 직원에게 말씀해주세요. 친절하게 도와드리겠습니다.</p>

		</fieldset>

	</div>

	<div align="center" id="searchTrain">
		<button type="button" id="traintable_btn">조회하기</button>
	</div>

	<br><br>
	
	<hr id="hr">

	<p id="train"></p>
	
	<p id="none" align="center"></p>
	
	<div align="center" id="back">
        <button type="button" id="checkBack">확인</button>
     </div>
      
      <br><br>
	<hr id="hr">
	
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
=======
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="${ path }/css/trainTable/trainMain.css" rel="stylesheet"
	type="text/css">
  </head>
  <script src="${ path }/js/common/jquery-3.6.3.js"></script>
  <script src="${ path }/js/common/jquery-3.6.3.min.js"></script>
  
  <body>
    <div id="banner">
      <div id="banner_text">승차권 조회</div>
</div>
<div class="field">
<fieldset id="ttable" style="width: 900px;">  
  <table align="center">
    <tr id="topTable">
      <th colspan="2" width="100px" style="font-size: 20px">출발</th>
      <td><input style="height: 25px;" type="text" name="" id="depPlaceId"></td>
      <td><input type="submit" value="조회"  id="depId"></td>
      <th colspan="2" width="100px">인원</th>
      <td><input type="text" style="width: 200px;"></td>
      <td><select name="" id=""></select></td>
    </tr>
    <tr>
      <td colspan="2"></td>
      <td> <img src="${ path }/resources/images/trainTable/cross.png" style="width: 30px; height: 30px;"></td>
    </tr>
    <tr>
      <th colspan="2" width="100px" style="font-size: 20px;">도착</th>
      <td><input style="height: 25px;" type="text" name="" id="arrPlaceId"></td>
      <td><input type="submit" value="조회" id="arId"></td>
      <td></td>
      <td></td>
      <td colspan="2" rowspan="3">
        <div id="calcal">
          <table class="Calendar">
              <thead>
                  <tr>
                      <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                      <td colspan="5">
                          <span id="calYear"></span>년
                          <span id="calMonth"></span>월
                      </td>
                      <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                  </tr>
                  <tr>
                      <td>일</td>
                      <td>월</td>
                      <td>화</td>
                      <td>수</td>
                      <td>목</td>
                      <td>금</td>
                      <td>토</td>
                  </tr>
              </thead>
  
              <tbody>
              </tbody>
          </table>
      </div>
>>>>>>> main

					<div class="train">
						<div class="carriage" data-carriage="1">
							<p class="center">특실 1호차</p>
						</div>
						<div class="carriage" data-carriage="2">
							<p class="center">특실 2호차</p>
						</div>
						<div class="carriage" data-carriage="3">
							<p class="center">일반실 3호차</p>
						</div>
						<div class="carriage" data-carriage="3">
							<p class="center">일반실 4호차</p>
						</div>
					</div>

					<div></div>

<<<<<<< HEAD
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

	<script src="${ path }/js/trainTable/popUpDep.js"></script>
	<script src="${ path }/js/trainTable/popUpArr.js"></script>
	<script src="${ path }/js/trainTable/trainMain.js"></script>
	<script src="${ path }/js/trainTable/calendar.js"></script>
	<script src="${ path }/js/trainTable/seatModal.js"></script>
	<jsp:include page="./seatModal.jsp" />
</body>
=======
        <div align="center">
        <button type="button" id="traintable_btn">조회하기</button>
        </div>
        <p id="train"></p>

    <script src="${ path }/js/trainTable/trainMain.js"></script>
  </body>
>>>>>>> main
</html>