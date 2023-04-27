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
	<%@ include file="../common/header.jsp" %>
	<link href="${ path }/css/accommodation/review.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <script src="https://cdnjs.clouflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
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
		        <div class="font15" id="callnum">예약 가능 여부 : ${accommodation.status == 'Y' ? '가능' : '불가능'}</div>
		        <div class="font15" id="callnum">잔여 객실 수 : ${ accommodation.maxValue }</div>
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
		        <div id="stara">
		            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
		            	<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
		            </svg><fmt:formatNumber type="number" pattern="0.00" maxFractionDigits="2" value="${ average }" /> (리뷰${ reviews.size() }개)
		            
		            <!-- 리뷰 작성하기 버튼 -->
					<%-- <a href="#" onclick="window.open('${ path }/accommodation/review?no=${accommodation.no}', '_blank', 'width=330, height=500', 'true');" class="btn btn-primary right" style="margin-left: 10px;" id="writeReview">리뷰작성</a> --%>
					<a href="${ path }/accommodation/review?no=${accommodation.no}" class="btn btn-primary right" style="margin-left: 10px;" id="writeReview">리뷰작성</a> 
		        </div>
		        
		        <!-- 후기 -->
		        <div id="reviewFrame">
    				<div id="reviewArea">
        				<c:set var="i" value="0"/>
        				<c:forEach var="review" items="${ reviews }" varStatus="status">
            				<c:if test="${ status.count % 2 == 0 }">
                				<div class="reviewLeft">
                    				<div style="height: 150px; margin-bottom: 60px;">
                       					<div class="left">
				                            <div class="reviewNick">${ review.nickname }</div>
				                            <div class="littleFont"><fmt:formatDate type="date" value="${ review.createDate }"/></div>
				                            <c:if test="${ loginMember.no  == review.memberNo }">
					                            <a class="littleFont" style=" text-decoration: none;" href="${ path }/accommodation/review/update?no=${ review.no }">수정</a>
					                            <a class="littleFont" style="color: darkred; text-decoration: none;" href="${ path }/accommodation/review/delete?no=${ review.no }">삭제</a>
											</c:if>
				                            <div class="littleFont">
				                            	<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			           						 		<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							            		</svg>
							            		${ review.starPoint }
				                            </div>
				                            
                        				</div>
                        			<div class="reviewContent">
                            			${ review.content } 
                        			</div>
                    				</div>
                				</div>
            				</c:if>
            				<c:if test="${ status.count % 2 != 0 }">
				                <div class="reviewRight">
				                    <div style="height: 150px; margin-bottom: 60px;">
				                        <div class="left">
				                            <div class="reviewNick">${ review.nickname }</div>
				                            <div class="littleFont"><fmt:formatDate type="date" value="${ review.createDate }"/></div>
											<c:if test='${ loginMember.no  == review.memberNo }'>
					                            <a class="littleFont" style=" text-decoration: none;" href="${ path }/accommodation/review/update?no=${ review.no }">수정</a>
					                            <a class="littleFont" style="color: darkred; text-decoration: none;" href="${ path }/accommodation/review/delete?no=${ review.no }">삭제</a>
												
											</c:if>
											<div class="littleFont">
				                            	<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
			           						 		<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							            		</svg>
							            		${ review.starPoint }
				                            </div>
				                        </div>
				                        <div class="reviewContent">
				                            ${ review.content } 
				                        </div>
				                    </div>
				                </div>
            				</c:if>
            			<c:set var="i" value="${i+1}"/>
        				</c:forEach>
    				</div>
				</div>
<%-- 			    <div id="reviewFrame">
	                <div id="reviewArea">
	                	<div class="reviewLeft">
		                	<c:forEach var="review" items="${ reviews }">
			                	<div style="height: 150px; margin-bottom: 60px;">
				                	<div class="left">
					                    <div class="reviewNick">${ review.nickname }</div>
					                    <div class="littleFont"><fmt:formatDate type="date" value="${ review.createDate }"/></div>
						                <a class="littleFont" href="${ path }/accommodation/review/update?no=${ review.no }">수정</a>
						                <a class="littleFont" href="${ path }/accommodation/review/delete?no=${ review.no }">삭제</a>
			                  		</div>
				             		<div class="reviewContent">
				             			${ review.content } 
				             		</div>
			                	</div>
		                	</c:forEach>
	                	</div>
	                	<div class="reviewRight">
	                		<c:forEach var="review" items="${ reviews }">
			                	<div style="height: 150px; margin-bottom: 60px;">
				                	<div class="left">
					                    <div class="reviewNick">${ review.nickname }</div>
					                    <div class="littleFont"><fmt:formatDate type="date" value="${ review.createDate }"/></div>
						                <a class="littleFont" href="${ path }/accommodation/review/update?no=${ review.no }">수정</a>
						                <a class="littleFont" href="${ path }/accommodation/review/delete?no=${ review.no }">삭제</a>
			                  		</div>
				             		<div class="reviewContent">
				             			${ review.content } 
				             		</div>
			                	</div>
		                	</c:forEach>
	                	</div>
	           		</div>
		       	</div> --%>
			</div> 

<!--오른쪽 옵션창-->
		<form name="insertReservation" action="${ path }/accommodation/reservation" method="post"  >
            <div id="rightContent" >
                  <div class="optionFrame ">
                     <div id="onedayPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                      <div id="accomodaionDay"> / 박</div>
                      <div class="right" id="topStar">
	                      <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	                      	<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	                      </svg>
                      </div>
                      <div class="right" id="topReview">
                      	<fmt:formatNumber type="number" pattern="0.00" maxFractionDigits="2" value="${ average }" />
                   	  </div>
                  </div>
                  <div id="accomodationStatus" >
                        <div id="check">
	                        <div id="checkIn"><input  type="date" name="checkIn" id="ckeckInInput" style="height: 100%; width: 100%;" placeholder="체크인" /></div>
	                        <div id="checkOut"><input type="date" name="checkOut" id="ckeckOutInput" style="height: 100%; width: 100%;" placeholder="체크아웃" /></div>
                  		</div>
	                  <div class="left" id="pnum">
	                  	<select id="pnumSelect" name="adultNumber">
					  		<option value="1" selected="selected">1명</option>
						  	<option value="2">2명</option>
					  		<option value="3">3명</option>
					  		<option value="4">4명</option>
						</select>
	                  </div>
                  </div>
                  <input type="hidden" name="accommodationNo"  value="${ accommodation.no }">
                  <input type="hidden" name="memberNo"  value="${ loginMember.no }">
                  <input type="hidden" name="price"  value="${ accommodation.price}">
                  <button class="btn btn-primary  type="button" id="reservBtn">예약하기</button>
                  <div id="warning">결제 전에는 예약이 확정되지 않습니다.</div>
				  <div class="optionFrame" id="bottom1">
                      <div id="onedayPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                      <div id="accomodaionDay"> x <span id="accommoDay" >1</span>박</div>
                  </div>
                  <!-- <div id="refund">환불약관</div> -->
                  <div id="bottom2">
                      <span class="left" style="padding: 14px; font-size:17px;">총합계</span>
                      <span id="totalPrice" class="right" style="padding: 14px"><fmt:formatNumber value="${ accommodation.price }"/>원</span>
                  </div>
            </div>
         </form>   
            
            <!-- 상단으로 이동하는 부트스트랩 아이콘  -->
            <div class="btn_gotop ">
	            <i class="bi bi-chevron-double-up"></i>
            </div>
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