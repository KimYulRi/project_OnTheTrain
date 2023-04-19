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
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
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
        <div class="font15" id="calendarClick"><hr class="line">날짜 선택</div>
        <div>체크인 <input type="datetime-local"></div>
        <div>체크아웃 <input type="datetime-local"></div>
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
                        <div id="onedayPrice"><fmt:formatNumber value="${ accommodation.price }"/>원</div>
                        <div id="accomodaionDay"> x 1박</div>
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
			lodgeList('0');
		});
		
		function lodgeList(page) {
			$.ajax({
				type:'GET',
				url:'http://apis.data.go.kr/6460000/jnLodgeist/getNdLodgeList',
				data: {
					ServiceKey:'2mKT3qQbDj6GzbgHRR6zV6nFDrZLqYMyFxWCrU+eb1JGQPP/zcCZ1kLYfli0m/UwxCy3AhHp7SqyLEm7n9kYLw==',
					menuCd: '01',
					startPage: page,
					pageSize:'20'
				},
				success: (obj) => {
					let result = '';
					
					$(obj).find('list').each(function(index) {
						result += 
							'<div class="product" onclick="location.href=\'${ path }/accommodation/reservation?no=' + $(this).find('lodgeId').text() + '\'">' + 
		                        '<div><img src="${ path }/images/accommodation/accomodation' + (index + 1) + '.png" alt=""></div>' +
		                        /* '<div id=""><img src="' + $(this).find('lodgeMainImg').text() + '" alt=""></div>' + */
		                        '<div class="acctitle">' + $(this).find('lodgeNm').text() + '</div>' + 
		                        '<div class="accfont acccontent">' + $(this).find('lodgeAddr').text() + '</div>' + 
		                        '<div class="accfont accprice">' + $(this).find('lodgeTel').text() + '</div>' + 
		                    '</div>';
				   	});
					
					$('.listImg').html(result);
				}, 
				error : (e) => {
					console.log(e);
				}
			});
		}
    </script>    
                
</body>
</html>