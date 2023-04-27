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
    <title>온더트레인</title>
    <link href="${ path }/css/myPage/myPageInfo.css" rel="stylesheet" type="text/css">
	<link href="${ path }/css/myPage/myPageModal.css" rel="stylesheet" type="text/css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-Buzscn6EZpIDqqzFV3yfPyTzgdVhxFpKX9Rt61x0s0Q7NOLBbJbi2eAeOgIEduKk" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<%@ include file="../common/header.jsp" %>
</head>
<body>
    <div id="container">
        <section>
        	<div id="myBanner" >
            	<img alt="" id="myBannerImg" width="1024px" height="181px" src="${ path }/images/myPage/myPage.jpg"  >
            </div>
	
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
				<form action="${ path }/myPage/myPageInfo" method="POST">
                            <table id="infotable">
                    <tr id="infoname">
                        <th id="infonamehead">이름</th>
                        <td id="infonamebody"><input class="infoinput" type="text" name="name" value="${loginMember.name }"></td>
                    </tr>
                    <tr id="infoid">
                    <th id="infoidhead">아이디</th>
                    <td id="infoidbody"><input class="infoinput" type="text" name="userId" value="${loginMember.id}"> <input type="button" id="checkDuplicate1" class="inputbtn" value="중복확인" > <div id="idsucc">사용 가능한 아이디입니다.</div></td>
                </tr>
                <tr id="infonick">
                    <th id="infonamehead">닉네임</th>
                    <td id="infonickbody"><input class="infoinput" type="text" name="nickname" value="${loginMember.nickname}"><input type="button" id="checkDuplicate2" class="inputbtn" value="중복확인" > <div id="nicksucc">사용 가능한 닉네임입니다.</div></td>
                </tr>
                <tr id="infophone">
                    <th id="infophonehead">전화번호</th>
                    <td id="infophonebody"><input class="infoinput" type="text" name="phone" value="${loginMember.phone}"></td>
                </tr>
                <tr id="infoemail">
                    <th id="infoemailhead">이메일</th>
                    <td id="infoemailbody"><input class="infoinput" type="text" name="email" readonly="readonly" value="${loginMember.email}"></td>
                </tr>
                <tr>
                	<th>주소</th>
                	<td>
                		<div class="enrollwrap" id="addressArea">
							<label class="enrollLabel">	
							<input type="hidden" name="zipcode" id="zipcode" maxlength="7" class="texttype1" readonly>
							<input type="text" name="address1" id="address1" class="texttype4"  readonly placeholder="${loginMember.address}" >
							<input type="text" name="address2" id="address2" class="texttype4"  placeholder="상세주소" >
							<input type="button" id="findaddress" class="inputbtn" value="우편번호 찾기"  onclick="findAddr()">
							<input type="hidden" id="address" name="address" value="">
							</label>
						</div>
                	</td>
                </tr>
                <tr id="infomembership">
                    <th id="infomembershiphead">멤버십</th>
                    <td id="infomembershipbody">
                        ${loginMember.name } 님의 멤버십등급은 
						<c:if test="${loginMember.membership == 'M1'}">
							Bronze
						</c:if>
						<c:if test="${loginMember.membership == 'M2'}">
							Silver
						</c:if>
						<c:if test="${loginMember.membership == 'M3'}">
							Gold
						</c:if>
						<c:if test="${loginMember.membership == 'M4'}">
							VIP
						</c:if>
						 입니다. <br>
                        <p>현재 나의 누적금액 : <fmt:formatNumber value="${loginMember.amount}" pattern="#,###"/>원</p>
                        <button type="button" id="benefitbtn" class="memberShipModal" >멤버십 혜택 확인</button>
                    </td>
                </tr>
            </table>
            <button type="submit" id="infosubmit" >개인정보 수정하기</button>
            <button type="button" id="pwdchange" class="pwdModal" >비밀번호 변경하기</button>
           <button type="button" id="withdraw" class="withdrawModal" onclick="location.href='${path}/myPage/myPageWithdraw'">회원 탈퇴</button>
		</form>
            
            
                                
            
            
            <jsp:include page="./myPageModal.jsp" />
            <script src="${ path }/js/myPage/myPageModal.js"></script>
			<script src="${ path }/js/myPage/myPageInfo.js"></script>
        </section>
        <%@ include file="../common/footer.jsp"%>
	</body>

    </div>

</html>