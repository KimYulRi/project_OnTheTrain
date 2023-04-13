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
    <title>ACCOMMODATION_RESERVATION</title>
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <link href="${ path }/css/accomodation/accomodationReservation.css"
	rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <section>
        <div id="body">           
            <div id="accomodationName">하루 감성 수영장 숙소</div>
            <div id="reviewCount">후기22개</div>
            <div id="topImage"><img src="${ path }/images/accomodation/topImage.png" alt=""></div>
        </div>    
<!--사진 아래 영역-->            
        <div id="contentFrame">
<!--왼쪽 내용 영역-->                
            <div id="leftContent">
                <div class="text" id="accomodation">숙소</div>
                <div class="text" id="accomodationExplanation">높은 층의 숙소에서 보는 주변 풍경과 함께 힐링이 가능한 시설입니다.높은 층의 숙소에서 보는 주변 풍경과 함께 힐링이 가능한 시설입니다.높은 층의 숙소에서 보는 주변 풍경과 함께 힐링이 가능한 시설입니다.</div>
                <div class="text" id="ExplanationMore">더보기></div>
                <div class="text" id="calendarClick"><hr class="line">날짜 선택</div>
                <div id="calendarArea"><img id="cimg" src="${ path }/images/accomodation/calender.png" alt=""" alt=""></div>
                <div id="reservStar"><hr class="line">
                    <div id="stara">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                        </svg> 4.86(466)
                    </div>
                    <div id="reviewAccounta">후기22개</div>
                </div>
                <!-- 후기 -->
                <div id="reviewFrame">
                    <!--왼쪽-->
                    <div id="top">
                        <div id="reviewLeft">
	                        <div id="review1">
		                        <div class="left" id="leftText">접근성</div>
		                        <div><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
	                        <div id="review2">
		                        <div class="left" id="leftText">서비스</div>
		                        <div><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
	                        <div id="review3">
		                        <div class="left" id="leftText">숙소 시설</div>
		                        <div><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
                        </div>
                        <!--오른쪽-->
                        <div id="reviewRight">
	                        <div id="review1">
		                        <div class="left" id="leftText">접근성</div>
		                        <div><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
	                        <div id="review2">
		                        <div class="left" id="leftText">서비스</div>
		                        <div><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
	                        <div id="review3">
		                        <div class="left" id="leftText">숙소 시설</div>
		                        <div id="sl"><hr class="shortLine"></div>
		                        <div class="right" id="reviewPoint">3.6</div>
                    		</div>
                        </div>
                    </div>
                    <div id="bottom">
                        <!--왼쪽-->
                        <div id="reviewPerson">
                            <div id="user">
		                        <div class="left" id="userImg"></div>
		                       	<div class="left">
			                        <div id="reviewNick">닉네임</div>
			                        <div id="cDate">2023.03.20</div>
		                       	</div>
                    		</div>
                    		<div class="left"id="reviewContent">
                    			너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다.너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 
                    		</div>
                            <div id="user">
		                        <div class="left" id="userImg"></div>
		                       	<div class="left">
			                        <div id="reviewNick">닉네임</div>
			                        <div id="cDate">2023.03.20</div>
		                       	</div>
                    		</div>
                    		<div class="left"id="reviewContent">
                    			 너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다.너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다.  
                    		</div>
                        </div>
                        <!--오른쪽-->
                        <div id="reviewRight">
                            <div id="user">
		                        <div class="left" id="userImg"></div>
		                       	<div class="left">
			                        <div id="reviewNick">닉네임</div>
			                        <div id="cDate">2023.03.20</div>
		                       	</div>
                    		</div>
                    		<div class="left"id="reviewContent">
                    			너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 
                    		</div>
                            <div id="user">
		                        <div class="left" id="userImg"></div>
		                       	<div class="left">
			                        <div id="reviewNick">닉네임</div>
			                        <div id="cDate">2023.03.20</div>
		                       	</div>
                    		</div>
                    		<div class="left"id="reviewContent">
                    			너무 만족스러웠고 탁 트인 광경이 만족스러웠습니다. 
                    		</div>
                        </div>
                        <div class="text" id="ExplanationMore">더보기></div>
                    </div>
                </div>
                <!-- 지도 -->
                <div id="map"><img src="${ path }/images/accomodation/" alt=""></div>
        </div> 


<!--오른쪽 옵션창-->
            <div id="rightFrame">
                <div id="optionBox">
<!--첫번째 줄-->                    
                    <div class="optionFrame">
                        <div id="onedayPrice">290,000원</div>
                        <div id="accomodaionDay"> / 박</div>
                        <div class="right" id="topStar">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg> 4.86
                        </div>
                        <div class="right" id="topReview">후기22개</div>
                    </div>
<!--박스 체크인,아웃, 인원-->
                        <div id="accomodationStatus">
                            <div id="check">
	                            <div id="checkIn">체크인</div>
	                            <div id="vline"></div>
	                            <div id="checkOut">체크아웃</div>
                            </div>
                            <div class="line" id="hline"></div>
                            <div class="left" id="pnum">인원</div>
                        </div>
                        <button class="button" type="button" id="reservBtn">예약하기</button>
                        <div id="warning">결제 전에는 예약이 확정되지 않습니다.</div>
                        
					<div class="optionFrame" id="bottom1">
                        <div id="onedayPrice">290,000원</div>
                        <div id="accomodaionDay"> x 박</div>
                        <div class="right">1,450,000원</div>
                    </div>
                    
                    <div id="refund">환불약관</div>
                    <hr class="line">
                    
                    <div id="bottom2">
                        <div class="left">총합계</div>
                        <div class="right">1,675,138원</div>
                    </div>
                    
                </div>               
            </div>
</div>
<!-- 페이징 버튼 -->
<div>
    <nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
        </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
        </a>
        </li>
    </ul>
    </nav>
</div>        
    </section>                
</body>
</html>