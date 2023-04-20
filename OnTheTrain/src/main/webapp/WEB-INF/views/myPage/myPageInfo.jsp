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
	<link href="${ path }/css/myPage/myPageModal.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Buzscn6EZpIDqqzFV3yfPyTzgdVhxFpKX9Rt61x0s0Q7NOLBbJbi2eAeOgIEduKk" crossorigin="anonymous"></script>

</head>
<body>
    <div id="container">
        <section>

	
            <div id="letftoolbar" class="table table-sm" >
                <div id="toolbartitle">마이페이지</div>
                <div class="toolbarcontent"> <a href="${ path }/myPage/myPageTicket">결제 완료</a> </div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageTicketWaiting" >결제 대기</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageMyScheduler">나의 스케줄러</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageCoupon">쿠폰함</a></div>
                <div class="toolbarcontent"><a href="${ path }/myPage/myPageQna">1:1 문의</a></div>
                <div id="mypagechoose" class="toolbarcontent">개인정보</div>
            </div>

            <div id="toptoolbar">
                <div id="toptoolbartitle">개인정보</div>
            </div>
		<form action="">
                            <table id="infotable">
                    <tr id="infoname">
                        <th id="infonamehead">이름</th>
                        <td id="infonamebody"><input class="infoinput" type="" name="" value="홍길동"></td>
                    </tr>
                    <tr id="infoid">
                    <th id="infoidhead">아이디</th>
                    <td id="infoidbody"><input class="infoinput" type="" name="" value="hong1234"></td>
                </tr>
                <tr id="infonick">
                    <th id="infonamehead">닉네임</th>
                    <td id="infonickbody"><input class="infoinput" type="" name="" value="gildongmu"></td>
                </tr>
                <tr id="infophone">
                    <th id="infophonehead">전화번호</th>
                    <td id="infophonebody"><input class="infoinput" type="" name="" value="010-1111-2222"></td>
                </tr>
                <tr id="infoemail">
                    <th id="infoemailhead">이메일</th>
                    <td id="infoemailbody"><input class="infoinput" type="" name="" value="hongsam@kr.com"></td>
                </tr>
                <tr id="infomembership">
                    <th id="infomembershiphead">멤버십</th>
                    <td id="infomembershipbody">
                        (사용자 이름) 님의 멤버십등급은 (멤버십등급) 입니다. <br>
                        <p>다음 등급인 (멤버십 다음등급) 까지는 (필요한 점수)점이 더 필요합니다.</p>
                        <button type="button" id="benefitbtn" class="memberShipModal" >멤버십 혜택 확인</button>
                    </td>
                </tr>
            </table>
            <button type="submit" id="infosubmit" >개인정보 수정하기</button>
            <button type="button" id="pwdchange" class="pwdModal" >비밀번호 변경하기</button>
		</form>
            
            
                                
            
            
            <jsp:include page="./myPageModal.jsp" />
            <script src="${ path }/js/myPage/myPageModal.js"></script>

        </section>
	</body>
    <footer>
        
    </footer>
    </div>

</html>