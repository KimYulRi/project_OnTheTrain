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
    <link href="${ path }/css/myPage/myPageAccommodationCheck.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<%@ include file="../common/header.jsp" %>
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=abe862743db89d98578a540d9cfed4b7"></script>
</head>
<body>
    <section id="body">
        <div>           
            <div><img src="${ path }/images/accommodation/${ accommodation.renamedFilename }" id="topImage"  alt=""></div>
        </div>    
<!--사진 아래 영역-->            
        <div id="contentFrame">
<!--왼쪽 내용 영역-->         
			<div id="leftContent"> 
		    	<div class="accomodationName bold">${ accommodation.name }</div>
		        <div class="font15" id="callnum">체크인 날짜 : ${reservationCheck.checkIn}</div>
		        <div class="font15" id="callnum">체크아웃 날짜 : ${reservationCheck.checkOut}</div>
		        <div class="font15" id="callnum">결제하신 가격 : <fmt:formatNumber value="${reservationCheck.price}" pattern="#,###"/>원</div>
		        <div class="font15" id="callnum">총 인원 : ${reservationCheck.adultNumber}명</div>
		        <hr class="line">
		        <div class="font15 bold" id="callnum">전화번호</div>
			    <div class="font15 left" id="call">${ accommodation.explain }</div>
			    
			    <br>
		        <hr class="line">
		        <div class="font15 bold" >주소</div>
		     	<div class="font15" id="addressData">${ accommodation.location } </div>
		     	
		        <!-- 지도 위도 경도 -->
		        <%-- <div id="map"><img src="${ path }/images/accommodation/" alt=""></div> --%>
		        <div class="font15 bold" id="mapViewer"><hr class="line">위치 보기</div>
		        <div id="map"></div>
		        
		        <div id="reservStar"><hr class="line"></div>
		     
				<div id="btndiv">
		     	   <button type="button" id="qnaModal" class="qnaBtn" onclick="location.href='${path}/myPage/myPageAccommodation'" >목록으로 돌아가기</button>
				</div>
		   

    </section>
    
    <script type="text/javascript">
	    $(document).ready(() => {
	    	let date = new Date();
	    	
	    	let year = date.getFullYear();
	    	let month = ('0' + (date.getMonth() + 1)).slice(-2);
	    	let day = ('0' + date.getDate()).slice(-2);
	    	let dateStr = year + '-' + month + '-' + day;
	    	
	    	$('#ckeckInInput').prop('min', dateStr);
	    	
	    		
		    	let mapContainer = document.getElementById('map');
		    	let mapOption = { 
		    	        center: new kakao.maps.LatLng(${ accommodation.lat }, ${ accommodation.lot }), // 지도의 중심좌표
		    	        level: 3 // 지도의 확대 레벨
		    	};
		    	let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		    	
				// 마커를 생성합니다
				let marker = new kakao.maps.Marker({
				    position: new kakao.maps.LatLng(${ accommodation.lat }, ${ accommodation.lot })
				});
		    	
				marker.setMap(map);
	
				let iwContent = '<div style="padding:10px;"><div class="bold">${ accommodation.name }</div><br><div class="littleFont">${ accommodation.explain }</div><br><a href="https://map.kakao.com/link/map/${ accommodation.name },${ accommodation.lat }, ${ accommodation.lot }" style="color:blue" target="_blank">큰지도보기</a> <br> <a href="https://map.kakao.com/link/to/ ${ accommodation.name },${ accommodation.lat }, ${ accommodation.lot }" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    //위의 코드는 이름,전화번호,큰지도보기와 길찾기 도착지 설정 
				iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
				// 인포윈도우를 생성합니다 
				let infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
				
			    $('#ckeckInInput').on('change', (event) => {
			    	$('#ckeckOutInput').prop('min', event.target.value);
			    });
			    
			    $('#ckeckOutInput').on('change', (event) => {
			    	let date1 = dayjs($('#ckeckInInput').val());
			    	let date2 = dayjs($('#ckeckOutInput').val());
			    	let nights = date2.diff(date1, 'day');
			    	let totalPrice = ${ accommodation.price };
			    	
			    	totalPrice = (nights * totalPrice) + '';
			    	
			    	$('#totalPrice').text(totalPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ','));
			    	$('#accommoDay').text(nights);
			    });
		    
			   /* 최상단이동 */
			    $(window).scroll(function(){
			    	if ($(this).scrollTop() > 300){
			    		$('.btn_gotop').show();
			    	} else{
			    		$('.btn_gotop').hide();
			    	}
			    });
			    $('.btn_gotop').click(function(){
			    	$('html, body').animate({scrollTop:0},400);
			    	return false;
			    });
		});
    </script>    
                
</body>
</html>