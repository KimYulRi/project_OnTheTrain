<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--     <link href="${ path }/css/myPage/myPageQna.css" rel="stylesheet" type="text/css"> --%>
    <!-- CSS only -->

<link href="${ path }/css/weather/weather.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	
	<div id="weatherbody" >
		<form action="" method="GET" onsubmit="return getWeather(event)">
		  <div id="datebody" ><p>날짜를 선택해주세요. <input type="text" id="datepicker" name="date"></p></div>
		  <div id="citybody" ><p>도시를 선택해주세요. 
			  <select id="city" name="city">
				  <option value="Seoul" data-name="서울특별시">서울특별시</option>
				  <option value="Busan" data-name="부산광역시">부산광역시</option>
				  <option value="Daegu" data-name="대구광역시">대구광역시</option>
				  <option value="Incheon" data-name="인천광역시">인천광역시</option>
				  <option value="Gwangju" data-name="광주광역시">광주광역시</option>
				  <option value="Daejeon" data-name="대전광역시">대전광역시</option>
				  <option value="Ulsan" data-name="울산광역시">울산광역시</option>
				  <option value="Sejong" data-name="세종특별자치시">세종특별자치시</option>
				  <option value="Gyeonggi-do" data-name="경기도">경기도</option>
				  <option value="Gangwon-do" data-name="강원도">강원도</option>
				  <option value="Chungcheongbuk-do" data-name="충청북도">충청북도</option>
				  <option value="Chungcheongnam-do" data-name="충청남도">충청남도</option>
				  <option value="Jeollabuk-do" data-name="전라북도">전라북도</option>
				  <option value="Jeollanam-do" data-name="전라남도">전라남도</option>
				  <option value="Gyeongsangbuk-do" data-name="경상북도">경상북도</option>
				  <option value="Gyeongsangnam-do" data-name="경상남도">경상남도</option>
				  <option value="Jeju-do" data-name="제주도">제주도</option>
			  </select></p>
		</div> 
		  
		  <div id="btndiv">
			  <button id="weatherbtn" type="submit">날씨 조회하기</button>
		  </div>
		</form>
		
		<div id="result"></div>
	</div>

    <script src="${ path }/js/weather/weather.js"></script>
</body>
</html>