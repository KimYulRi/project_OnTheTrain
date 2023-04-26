<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온더트레인</title>
<link rel="stylesheet" href="${ path }/css/common/common.css">
<link rel="stylesheet" href="${ path }/css/common/home.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<link href="${ path }/css/accommodation/accommodationList.css"rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<%@ include file="./common/header.jsp" %>
</head>

<body>
	<main>
        <div class="main-container">
        	<div id="ticketArea">
        		<img src="${ path }/images/common/main.jpg" alt="">
        	</div>
        	<div class="contentArea">
        		<div>
                    <div class="banner_space">
                        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                	<img src="${ path }/images/accommodation/banner1.png" class="d-block w-100" alt="...">
	                            </div>
	                            <div class="carousel-item">
	                                <img src="${ path }/images/accommodation/banner2.png" class="d-block w-100" alt="...">
	                            </div>
	                            <div class="carousel-item">
	                                <img src="${ path }/images/accommodation/banner3.png" class="d-block w-100" alt="...">
	                            </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    

                    <div class="gray_line"></div>           
                    <div >
                        현재 예약 가능한 숙소가 얼마 남지 않았으므로, 서둘러 예약하세요.
                    </div>
                    <div id="pCount">
                        숙소44개
                    </div>    
                </div>      
<!-- 숙박 목록 -->
                <div class="listArea">
                    <div class="listImg ">
					</div>
                </div>
                
                <div>
        			<img style="width: 1200px;" class="banner_space" src="${ path }/images/common/Rectangle 170.png" alt="">
                </div>
                
            </div>
        </section>
	
	
        		<div id="content1">
 					<a href="${ path }/scheduler/main">스케줄러 메인으로</a>

  					<%@ include file="../views/weather/weather.jsp" %>
  
			        <h1>
					   메인페이지 수정 중
					</h1>
					
					<P>  The time on the server is ${serverTime}. </P>
				</div>
		    </div>
	    </div>
      </main>
      
      <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script>
	
	
		$(document).ready(() => {
			lodgeList('1');
		});
		
		function lodgeList(page) {
			$.ajax({
				type:'GET',
				url:'http://apis.data.go.kr/6460000/jnLodgeist/getNdLodgeList',
				data: {
					ServiceKey:'2mKT3qQbDj6GzbgHRR6zV6nFDrZLqYMyFxWCrU+eb1JGQPP/zcCZ1kLYfli0m/UwxCy3AhHp7SqyLEm7n9kYLw==',
					menuCd: '01',
					startPage: page,
					pageSize:'42'
				},
				success: (obj) => {
					let result = '';
					
					$(obj).find('list').each(function(index) {
						result += 
							'<div class="product" onclick="location.href=\'${ path }/accommodation/reservation?no=' + $(this).find('lodgeId').text() + '\'">' + 
		                        '<div><img style="width: 156px;height: 151px;border-radius: 10px;" src="${ path }/images/accommodation/accImg' + (((page - 1) * 20) + (index + 1)) + '.jpeg" alt=""></div>' +
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