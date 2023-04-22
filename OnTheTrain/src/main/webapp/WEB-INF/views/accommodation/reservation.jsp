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
    <title>숙소예약 상세</title>
    <link href="${ path }/css/accommodation/accommodationReservation.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="${ path }/css/accommodation/review.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=abe862743db89d98578a540d9cfed4b7"></script>
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <section>
        <div id="body">           
            <div id="topImage"><img src="${ path }/images/accommodation/topImage.png" alt=""></div>
        </div>    
<!--사진 아래 영역-->            
        <div id="contentFrame">
<!--왼쪽 내용 영역-->         
	<div id="leftContent">       
    	<div id="accomodationName">${ accommodation.name }</div>
        <hr class="line">
        <div class="font15">전화번호</div>
	    <div class="font15 left" id="call">${ accommodation.explain }</div>
	    
	    <br>
        <hr class="line">
        <div class="font15" id="address">주소</div>
     	<div class="font15" id="addressData">${ accommodation.location } </div>
     	
        <!-- 지도 위도 경 -->
        <%-- <div id="map"><img src="${ path }/images/accommodation/" alt=""></div> --%>
        <div class="font15" ><hr class="line">위치 보기</div>
        <div id="map" style="width:100%;height:350px;"></div>
        
        <div id="reservStar"><hr class="line"></div>
        <div id="stara">
            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
            </svg> 4.86(466)
        </div>
        <div id="reviewAccounta">후기22개</div>
        
        <!-- 후기 -->
        <div id="reviewFrame">
        	<!--왼쪽-->	
            <div id="top">
            	<div id="reviewLeft">
	                <div class="reviewTop">
		                <div class="left leftText">접근성</div>
		                <div><hr class="shortLine"></div>
		                <div class="right reviewPoint">3.6</div>
	            	</div>
	                <div class="reviewMiddle">
		                <div class="left leftText">접근성</div>
		                <div><hr class="shortLine"></div>
		                <div class="right reviewPoint">3.6</div>
	            	</div>
	                <div class="reviewBottom">
		                <div class="left leftText">접근성</div>
		                <div><hr class="shortLine"></div>
		                <div class="right reviewPoint">3.6</div>
	            	</div>
                </div>
                <!--오른쪽-->
                <div id="reviewRight">
	                <div class="reviewTop">
		                <div class="left leftText">접근성</div>
		                <div><hr class="shortLine"></div>
		                <div class="right reviewPoint">3.6</div>
	            	</div>
	                <div class="reviewMiddle">
		                <div class="left leftText">접근성</div>
		                <div><hr class="shortLine"></div>
		                <div class="right reviewPoint">3.6</div>
	            	</div>
                 	<div class="reviewBottom">
		                 <div class="left leftText">접근성</div>
		                 <div><hr class="shortLine"></div>
		                 <div class="right reviewPoint">3.6</div>
            		</div>
                </div>
            </div>
            <div id="bottom">
                <div id="reviewArea">
                	<!--왼쪽-->
                	<div id="reviewLeft">
                   		<div class="left userImg"></div>
                  		<div class="left">
		                    <div class="reviewNick">${ reviews[0].nickname }</div>
		                    <div class="cDate"><fmt:formatDate type="date" value="${ reviews[0].createDate }"/></div>
                  		</div>
	             		<div class="left reviewContent">
	             			${ reviews[0].content } 
	             		</div>
             		
	             		<div class="left userImg"></div>
	                  	<div class="left">
		                    <div class="reviewNick">${ reviews[1].nickname }</div>
		                     <div class="cDate"><fmt:formatDate type="date" value="${ reviews[1].createDate }"/></div>
	                  	</div>
	             		<div class="left reviewContent">
	             			${ reviews[1].content } 
	             		</div>
            		</div>
            		
            		<!--오른쪽-->
            		<div id="reviewRight">
                   		<div class="left userImg"></div>
                  		<div class="left">
		                    <div class="reviewNick">${ reviews[2].nickname }</div>
		                    <div class="cDate"><fmt:formatDate type="date" value="${ reviews[2].createDate }"/></div>
                  		</div>
	             		<div class="left reviewContent">
	             			${ reviews[2].content }  
	             		</div>
             		
	             		<div class="left userImg"></div>
	                  	<div class="left">
		                    <div class="reviewNick">${ reviews[3].nickname }</div>
		                     <div class="cDate"><fmt:formatDate type="date" value="${ reviews[3].createDate }"/></div>
	                  	</div>
	             		<div class="left reviewContent">
	             			${ reviews[3].content }  
	             		</div>
            		</div>
            		
           		</div>
             </div>
       	</div>
            <!-- 리뷰 작성하기 버튼 -->
		<a href="${ path }/accommodation/review?no=${accommodation.no}" class="btn btn-primary">리뷰작성</a>
	</div> 

<!--오른쪽 옵션창-->
            <div id="rightFrame">
                <div id="optionBox">
                    <div class="optionFrame">
                        <div id="onedayPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                        <div id="accomodaionDay"> / 박</div>
                        <div class="right" id="topStar">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg> 4.86
                        </div>
                        <div class="right" id="topReview">${reviews[0].starPoint }</div>
                    </div>
                        <div id="accomodationStatus">
                            <div id="check">
	                            <div id="checkIn"><input type="date" id="ckeckInInput" style="height: 100%; width: 100%;" placeholder="체크인" /></div>
	                            <div id="checkOut"><input type="date" id="ckeckOutInput" style="height: 100%; width: 100%;" placeholder="체크아웃" /></div>
                            </div>
                            <div class="left" id="pnum">
	                            <select name="pnumSelect" style="height: 100%; width: 100%">
								  <option value="1" selected="selected">1명</option>
								  <option value="2">2명</option>
								  <option value="3">3명</option>
								  <option value="4">4명</option>
								</select>
                            </div>
                        </div>
                        <button class="button" type="button" id="reservBtn">예약하기</button>
                        <div id="warning">결제 전에는 예약이 확정되지 않습니다.</div>
					<div class="optionFrame" id="bottom1">
                        <div id="onedayPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                        <div id="accomodaionDay"> x <span id="accommoDay" >1</span>박</div>
                        <div class="right"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                    </div>
                    <div id="refund">환불약관</div>
                    <hr class="line">
                    <div id="bottom2">
                        <div class="left">총합계</div>
                        <div class="right" id="totalPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                    </div>
                </div>               
            </div>
		</div>
    </section>
    
    <jsp:include page="./accModal.jsp" />
    
    <script type="text/javascript">
	    $(document).ready(() => {
	    	let mapContainer = document.getElementById('map');
	    	let mapOption = { 
	    	        center: new kakao.maps.LatLng(${ accommodation.lat }, ${ accommodation.lot }), // 지도의 중심좌표
	    	        level: 3 // 지도의 확대 레벨
	    	};
	    	let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    	
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: new kakao.maps.LatLng(${ accommodation.lat }, ${ accommodation.lot })
			});
	    	
			marker.setMap(map);

	    	
		    $('#ckeckInInput').on('change', (event) => {
		    	$('#ckeckOutInput').prop('min', event.target.value);
		    });
		    
		    $('#ckeckOutInput').on('change', (event) => {
		    	let date1 = dayjs($('#ckeckInInput').val());
		    	let date2 = dayjs($('#ckeckOutInput').val());
		    	
		    	
		    	$('#accommoDay').html(date2.diff(date1, "day"));
		    });
	    	
		});
    </script>    
                
</body>
</html>