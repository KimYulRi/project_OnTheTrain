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
    <link href="${ path }/css/myPage/myPageInfo.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <div id="container">
        <section>


            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageticket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div id="mypagechoose" class="toolbarcontent">개인정보</div>
            </div>

            <div id="toptoolbar">
                <div id="toptoolbartitle">개인정보</div>
            </div>

            <table id="infotable">
                <tr id="infoname">
                    <th id="infonamehead">이름</th>
                    <td id="infonamebody">홍길동</td>
                </tr>
                <tr id="infoid">
                    <th id="infoidhead">아이디</th>
                    <td id="infoidbody">hong1234</td>
                </tr>
                <tr id="infonick">
                    <th id="infonamehead">닉네임</th>
                    <td id="infonickbody">gildongmu</td>
                </tr>
                <tr id="infophone">
                    <th id="infophonehead">전화번호</th>
                    <td id="infophonebody">010-1111-2222</td>
                </tr>
                <tr id="infoemail">
                    <th id="infoemailhead">이메일</th>
                    <td id="infoemailbody">hongsam@kr.com</td>
                </tr>
                <tr id="infomembership">
                    <th id="infomembershiphead">멤버십</th>
                    <td id="infomembershipbody">
                        (사용자 이름) 님의 멤버십등급은 (멤버십등급) 입니다. <br>
                        <p>다음 등급인 (멤버십 다음등급) 까지는 (필요한 점수)점이 더 필요합니다.</p>
                        <button id="benefitbtn">멤버십 혜택 확인</button>
                    </td>
                </tr>
            </table>
            


            
        </section>
	</body>
    <footer>
        
    </footer>
    </div>

</html>