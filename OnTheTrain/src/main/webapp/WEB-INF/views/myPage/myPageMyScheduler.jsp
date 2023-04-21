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
    <link href="${ path }/css/myPage/myPageMyScheduler.css" rel="stylesheet" type="text/css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@ include file="../common/header.jsp" %>
</head>
<body>
    <div id="container">
        <section>
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div id="mypagechoose" class="toolbarcontent">나의 스케줄러</div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageInfoCheck">개인정보</a></div>
            </div>

            <div id="toptoolbar" >
                <div id="toptoolbartitle" >나의 스케줄러</div>
            </div>

            <table class="table" id="sctablebody" >
                <thead class=" table-light">
                    <tr>
                        <th id="scthtitle" >일정 제목</th>
                        <th id="scthevent" >주요 일정</th>
                        <th id="scthdate">여행 기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="sctabletitle" >나의 멋진 일정 1 어쩌구 저쩌구 말줄임표 테스트 테스트 테스트</td>
                        <td id="sctableevent" >[천안]머드 축제</td>
                        <td id="sctabledate" >2023/01/01 ~ 2023/01/02</td>
                    </tr>
                    <tr>
                        <td id="sctabletitle" >나의 멋진 일정 2 어쩌구 저쩌구 말줄임표 테스트 테스트 테스트</td>
                        <td id="sctableevent" >[천안]머드 축제</td>
                        <td id="sctabledate" >2023/01/01 ~ 2023/01/02</td>
                    </tr>
                    <tr>
                        <td id="sctabletitle" >나의 멋진 일정 3 어쩌구 저쩌구 말줄임표 테스트 테스트 테스트</td>
                        <td id="sctableevent" >[천안]머드 축제</td>
                        <td id="sctabledate" >2023/01/01 ~ 2023/01/02</td>
                    </tr>
                </tbody>
            </table>


            
            



            
        </section>
</body>
    <footer>
        
    </footer>
    </div>

</html>