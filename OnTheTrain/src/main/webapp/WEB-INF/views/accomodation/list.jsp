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
    <link href="${ path }/css/accomodation/accomodationList.css"
	rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <section>
            <div id="body">           
                <div>
                    <div id="banner_space">
                        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                <img src="${ path }/images/accomodation/banner1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="${ path }/images/accomodation/banner2.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="${ path }/images/accomodation/banner3.png" class="d-block w-100" alt="...">
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
                    <div class="text_type1" id="text1">
                        온더트레인과 숙소 찾기
                    </div>
<!--검색바-->
                    <div> 
                        <div id="searchArea">
                            <form class="search-form" id="searchKey">
<!--도착지 검색-->                                
                                <div class="dropdown">
                                    <button  type="button" id="search1" data-bs-toggle="dropdown" aria-expanded="false">도착지 검색</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">도시1</a></li>
                                            <li><a class="dropdown-item" href="#">도시2</a></li>
                                            <li><a class="dropdown-item" href="#">도시3</a></li>
                                        </ul>
                                </div>
<!--체크인--> 
                                <div class="dropdown">
                                    <button  type="button" id="search2" data-bs-toggle="dropdown" aria-expanded="false">체크인</button>
                                        <ul class="dropdown-menu">
                                            <input type="datetime-local">
                                            <li><a class="dropdown-item" href="#">날짜추가</a></li>
                                        </ul>
                                </div>
<!--체크아웃-->
                                <div class="dropdown">
                                    <button  type="button" id="search3" data-bs-toggle="dropdown" aria-expanded="false">체크아웃</button>
                                        <ul class="dropdown-menu">
                                            <input type="datetime-local">
                                            <li><a class="dropdown-item" href="#">날짜추가</a></li>
                                        </ul>
                                </div>
<!--인원-->
                                <div class="dropdown">
                                    <button  type="button" id="search4" data-bs-toggle="dropdown" aria-expanded="false">인원</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">1명</a></li>
                                            <li><a class="dropdown-item" href="#">2명</a></li>
                                            <li><a class="dropdown-item" href="#">3명 이상</a></li>
                                        </ul>
                                </div>
<!--돋보기-->     
                                <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" id="search_icon" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>
                                </button>
                            </form> 
                        </div>
<!--필터박스-->
                        <div id="filter_box">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>
                            </svg>
                            <div id="filter_box_text">
                                필터
                            </div>        
                    </div> 
                    </div>
                    <div class="gray_line"> 
                    </div>           
                    <div class="text_type2">
                        현재 예약 가능한 숙소가 얼마 남지 않았으므로, 서둘러 예약하세요.
                    </div>
                    <div class="text_type2" id="accomodaion_count_text">
                        숙소9개
                    </div>    
                </div>      
<!-- 숙박 목록 -->
                <div>
                    <div class="areaset" id="list_img" >
<!-- 숙박 상품들 -->
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation1.png" alt="">
                            </div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation2.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation3.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation4.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation5.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation6.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation7.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation8.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                        <div class="product" >
                            <div class="accfont" id="accimage"><img id="accimages" src="${ path }/images/accomodation/accomodation9.png" alt=""></div>
                            <div class="accfont" id="acctitle">동구의 아파트</div>
                            <div class="accfont" id="accstar"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                            </svg>4.86(466)
                            </div>
                            <div class="accfont" id="acccontent">[Amaigin view] 최고층 야경을 어쩌구저쩌구 12312312 3djWjrn</div>
                            <div class="accfont" id="accprice">150,000원 / 박</div>
                        </div>
                </div>
<!-- 지도 영역 -->
                <div class="areaset" id="map">
                    <img src="${ path }/images/accomodation/map.png" alt="">
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
            </div>
        </section>
        
        <button id="btn1">api 테스트1</button>
        <button id="btn2">api 테스트2</button>
        
	
	<script>
		$(document).ready(() => {
			$('#btn1').on('click', () => {
				$.ajax({
					type: 'GET',
					url: 'http://apis.data.go.kr/6300000/openapi2022/tourroms/gettourroms',
			        dataType:'json',
					data: {
						serviceKey: '2mKT3qQbDj6GzbgHRR6zV6nFDrZLqYMyFxWCrU+eb1JGQPP/zcCZ1kLYfli0m/UwxCy3AhHp7SqyLEm7n9kYLw==',
						pageNo: '1',
						numOfRows: '20'
					},
					success: (obj) => {
						let items = obj.response.body.items;
						
						
						console.log(obj);
						console.log(items);
					}, 
					error : (e) => {
						console.log(e);
					}
					
				});
			});	
			
			$('#btn2').on('click', () => {
				$.ajax({
					type:'GET',
					url:'http://apis.data.go.kr/6460000/jnLodgeist/getNdLodgeList',
					data: {
						ServiceKey:'2mKT3qQbDj6GzbgHRR6zV6nFDrZLqYMyFxWCrU+eb1JGQPP/zcCZ1kLYfli0m/UwxCy3AhHp7SqyLEm7n9kYLw==',
						menuCd: '01',
						startPage:'0',
						pageSize:'10'
					},
					success: (obj) => {
						console.log(obj);
						
						$(obj).find('list').each(function(){
						   console.log($(this).find('lodgeAddr').text());
						   console.log($(this).find('lodgeId').text());
						   console.log($(this).find('lodgeMainImg').text());
						   console.log($(this).find('lodgeMenuCd').text());
						   console.log($(this).find('lodgeMenuNm').text());
						   console.log($(this).find('lodgeNm').text());
						   console.log($(this).find('lodgeTel').text());
					   	});
					}, 
					error : (e) => {
						console.log(e);
					}
				});
			});
		});
	</script>
</body>
</html>