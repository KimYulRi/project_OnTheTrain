<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${ path }/css/myPage/myPageTicketWaiting.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
        <div id="container">
        <section>
                <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div id="mypagechoose" class="toolbarcontent">결제 대기</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>

            <div id="toptoolbar" >
                <div id="toptoolbartitle" >결제 대기</div>
            </div>


                <div id="waitwhole">
                    <input type="checkbox" id="check">
                    <div id="waitbody">
                        <div id="waitimage" class="wait">이미지</div>
                        <div id="waittitle" class="wait">상품명 : 상품의 이름</div>
                        
                        <div id="waitplace" class="wait">위치 : 상품의 위치, 서귀포</div>
                        
                        <div id="waitres" class="wait">예약 정보 : 상품의 예약 인원</div>
                        
                        <div id="waitdate" class="wait">예약일 : 2023/01/01</div>
                        
                        <div id="waitprice" class="wait">상품가격 : 105,000원</div>
                        
                        <button id="waitview">상세정보</button>
                    </div>
                </div>


                <div id="waitwhole">
                    <input type="checkbox" id="check">
                    <div id="waitbody">
                        <div id="waitimage" class="wait">이미지</div>
                        <div id="waittitle" class="wait">상품명 : 상품의 이름</div>
                        
                        <div id="waitplace" class="wait">위치 : 상품의 위치, 서귀포</div>
                        
                        <div id="waitres" class="wait">예약 정보 : 상품의 예약 인원</div>
                        
                        <div id="waitdate" class="wait">예약일 : 2023/01/01</div>
                        
                        <div id="waitprice" class="wait">상품가격 : 105,000원</div>
                        
                        <button id="waitview">상세정보</button>
                    </div>
                </div>

                <div id="waitwhole">
                    <input type="checkbox" id="check">
                    <div id="waitbody">
                        <div id="waitimage" class="wait">이미지</div>
                        <div id="waittitle" class="wait">상품명 : 상품의 이름</div>
                        
                        <div id="waitplace" class="wait">위치 : 상품의 위치, 서귀포</div>
                        
                        <div id="waitres" class="wait">예약 정보 : 상품의 예약 인원</div>
                        
                        <div id="waitdate" class="wait">예약일 : 2023/01/01</div>
                        
                        <div id="waitprice" class="wait">상품가격 : 105,000원</div>
                        
                        <button id="waitview">상세정보</button>
                    </div>
                </div>
                
                <div id="waitwhole">
                    <input type="checkbox" id="check">
                    <div id="waitbody">
                        <div id="waitimage" class="wait">이미지</div>
                        <div id="waittitle" class="wait">상품명 : 상품의 이름</div>
                        
                        <div id="waitplace" class="wait">위치 : 상품의 위치, 서귀포</div>
                        
                        <div id="waitres" class="wait">예약 정보 : 상품의 예약 인원</div>
                        
                        <div id="waitdate" class="wait">예약일 : 2023/01/01</div>
                        
                        <div id="waitprice" class="wait">상품가격 : 105,000원</div>
                        
                        <button id="waitview">상세정보</button>
                    </div>
                </div>
                <div id="waitwhole">
                    <input type="checkbox" id="check">
                    <div id="waitbody">
                        <div id="waitimage" class="wait">이미지</div>
                        <div id="waittitle" class="wait">상품명 : 상품의 이름</div>
                        
                        <div id="waitplace" class="wait">위치 : 상품의 위치, 서귀포</div>
                        
                        <div id="waitres" class="wait">예약 정보 : 상품의 예약 인원</div>
                        
                        <div id="waitdate" class="wait">예약일 : 2023/01/01</div>
                        
                        <div id="waitprice" class="wait">상품가격 : 105,000원</div>
                        
                        <button id="waitview">상세정보</button>
                    </div>
                </div>

                <div id="waitresult">
                    <div id="result1">현재 선택하신 상품</div>
                    <div id="result">
                        <div id="resultimage">이미지</div>
                        
                        <div id="resulttitle">상품의 이름</div>
                        
                        <div id="resultprice">100,000원</div>
                    </div>
                    <div id="result">
                        <div id="resultimage">이미지</div>
                        <div id="resulttitle">상품의 이름</div>
                        <div id="resultprice">100,000원</div>
                    </div>
                    <div id="result">
                        <div id="resultimage">이미지</div>
                        <div id="resulttitle">상품의 이름</div>
                        <div id="resultprice">100,000원</div>
                    </div>
                    
                    
    
    
                    <div id="total">총 상품금액</div>
                    <div id="totalprice">000000원</div>
                </div>



        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>