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
    <title>ACCOMMODATION_LIST</title>
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <link href="${ path }/css/accommodation/accommodationList.css"rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<%@ include file="../common/header.jsp" %>
</head>
<body>
        <section>
            <div id="body">           
                <div>
                    <div id="banner_space">
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
                    
<!--검색바-->
<!--                     <div> 
                        <div id="searchAreab">
                            <form class="search-form" id="searchKey">
                                <div class="dropdown">
                                    <button  type="button" data-bs-toggle="dropdown" aria-expanded="false">도착지 검색</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">도시1</a></li>
                                            <li><a class="dropdown-item" href="#">도시2</a></li>
                                            <li><a class="dropdown-item" href="#">도시3</a></li>
                                        </ul>
                                </div>
체크인 
                                <div class="dropdown">
                                    <button  type="button" data-bs-toggle="dropdown" aria-expanded="false">체크인</button>
                                        <ul class="dropdown-menu">
                                            <input type="datetime-local">
                                            <li><a class="dropdown-item" href="#">날짜추가</a></li>
                                        </ul>
                                </div>
체크아웃
                                <div class="dropdown">
                                    <button  type="button" data-bs-toggle="dropdown" aria-expanded="false">체크아웃</button>
                                        <ul class="dropdown-menu">
                                            <input type="datetime-local">
                                            <li><a class="dropdown-item" href="#">날짜추가</a></li>
                                        </ul>
                                </div>
인원
                                <div class="dropdown">
                                    <button  type="button" data-bs-toggle="dropdown" aria-expanded="false">인원</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">1명</a></li>
                                            <li><a class="dropdown-item" href="#">2명</a></li>
                                            <li><a class="dropdown-item" href="#">3명 이상</a></li>
                                        </ul>
                                </div>
돋보기     
                                <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" id="searchIcon" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>
                                </button>
                            </form> 
                        </div>
필터박스
                        <div id="filter_box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>
                            </svg>
                            <div id="filterText">
                                필터
                            </div>        
                    	</div> 
                    </div> -->
                    
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
                    <div class="listImg">
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
                        <li class="page-item"><a class="page-link" href="javascript:" onclick="lodgeList('1')">1</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:" onclick="lodgeList('2')">2</a></li>
                        <li class="page-item"><a class="page-link" href="javascript:" onclick="lodgeList('3')">3</a></li>
                        <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        </li>
                    </ul>
                    </nav>
                </div>
            </div>
        </section>
	
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
					pageSize:'20'
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