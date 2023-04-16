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
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageticket">결제 완료</a> </div>
                <div id="mypagechoose" class="toolbarcontent">결제 대기</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>
            <div id="toptoolbar" >
                <div id="ticket">승차권</div>
                <div id="accommodation" ><a href="${ path }/myPage/myPageAccommodationWaiting" >숙박</a></div>
            </div>


            <table class="table" id="ticketwaitbody" >
                <thead class=" table-light">
                    <tr>
                        <th id="twtitlebody" >상품명</th>
                        <th id="twarrdatebody" >출발일</th>
                        <th id="twpricebody" >상품 금액</th>
                        <th id="twseatbody" >좌석 번호</th>
                        <th id="twcanclebody">예약 취소</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="twtitle" >새마을호 [ 역삼역 - 강남역 ]</td>
                        <td id="twarrdate" >2023/01/01</td>
                        <td id="twprice" >59,000원</td>
                        <td id="twseat" >A10</td>
                        <td id="twcancle"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                        </svg></td>
                    </tr>
                    <tr>
                        <td id="twtitle" >새마을호 [ 역삼역 - 부산역 ] 혹시모르니 말줄임표 테스트 123</td>
                        <td id="twarrdate" >2023/01/01</td>
                        <td id="twprice" >59,000원</td>
                        <td id="twseat" >A10</td>
                        <td id="twcancle"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                        </svg></td>
                    </tr>
                </tbody>
            </table>


        </section>
</body>
<footer>
        
</footer>
    </div>

</html>