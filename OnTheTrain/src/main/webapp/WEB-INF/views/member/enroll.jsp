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
<title>온더트레인</title>
<link rel="stylesheet" type="text/css" href="${ path }/css/member/enroll.css">
<link rel="stylesheet" type="text/css" href="${ path }/css/member/enrollModal.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../common/header.jsp" %>
</head>
<body>
	<section>
		<div class="main-container">
        	<div class="contentArea">
        		<!-- 일반로그인 -->
        		<c:if test="${ member.loginType != 'N' && member.loginType != 'K' }">
				<form name="memberEnrollForm" action="${ path }/enroll" method="POST" onsubmit="return Validation();">
				</c:if>
				<!-- 카카오그인 -->
				<c:if test="${ member.loginType == 'K'}">
				<form name="memberEnrollForm" action="${ path }/enroll" method="POST" onsubmit="return ValidationK();">
				</c:if>
				<!-- 네이버로그인 -->
				<c:if test="${ member.loginType == 'N'}">
				<form name="memberEnrollForm" action="${ path }/enroll" method="POST" onsubmit="return ValidationN();">
				</c:if>
        		<div id="content1">
			        <h2>        
					    회원가입 <span class="sub">*는 필수 입력사항입니다.</span>
					</h2>
                </div>
				
					<div id="content2" >
						<!-- 일반로그인 : 아이디, 비밀번호 필요 -->
						<c:if test="${ member.loginType != 'N' && member.loginType != 'K' }">
							<div class="enrollwrap">
							<h4><label for="userId" class="enrollLabel">아이디 *</label></h4>
							<input type="text" name="id" id="userId" maxlength="12" class="texttype1" placeholder="영문 혹은 영문과 숫자를 조합 4~12자" required>
							<input type="button" id="checkDuplicate1" class="inputbtn" value="중복확인" >
    						<div id="idsucc">사용 가능한 아이디입니다.</div>
							</div>
	
							<div class="enrollwrap">
								<h4><label for="password1" class="enrollLabel">비밀번호 *</label></h4>
								<input type="password" id="password1" name="password" class="texttype2" maxlength="15" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" required>
							</div>
							
							<div class="enrollwrap">
								<h4><label for="password2" class="enrollLabel">비밀번호 확인 *</label></h4>
								<input type="password" id="password2" class="texttype2" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요" required>
							</div>
						</c:if>
						
						<!-- 간편로그인 명시, sns_id hidden으로 넣기 -->
						<c:if test="${ member.loginType == 'N' }">
							<div id="snsdiv">
								<div id="snshead">이용약관, 개인정보 수집 및 이용에 동의하신 후<br>
								<span id="naver">NAVER</span> 계정을 사용하여 회원가입이 가능합니다.</div>
								<input type="hidden" name="snsId"  value="${ member.snsId }" >
								<input type="hidden" name="loginType"  value="${ member.loginType }" >
							</div>
						</c:if>
						<c:if test="${ member.loginType == 'K' }">
							<div id="snsdiv">
								<div id="snshead">이용약관, 개인정보 수집 및 이용에 동의하신 후<br>
								<span id="kakao">KAKAO</span> 계정을 사용하여 회원가입이 가능합니다.</div>
								<input type="hidden" name="snsId"  value="${ member.snsId }" >
								<input type="hidden" name="loginType"  value="${ member.loginType }" >
							</div>
						</c:if>
						
						<div class="enrollwrap">
							<h4><label for="nickname" class="enrollLabel">닉네임 *</label></h4>
							<!-- 일반로그인 -->
							<c:if test="${ member.loginType != 'N' && member.loginType != 'K' }">
								<input type="text" name="nickname" id="nickname" class="texttype1" maxlength="10" placeholder="영문, 한글, 숫자 2~10자" required>
							</c:if>
							<!-- 간편로그인 -->
							<c:if test="${ member.loginType == 'N' || member.loginType == 'K' }">
								<input type="text" name="nickname" id="nickname" class="texttype1" value="${ member.nickname }" maxlength="10" placeholder="영문, 한글, 숫자 2~10자" required>
							</c:if>
							<input type="button" id="checkDuplicate2" class="inputbtn" value="중복확인" >
							<div id="nicksucc">사용 가능한 닉네임입니다.</div>
						</div>
						
						
						<div class="enrollwrap">
							<h4><label for="name" class="enrollLabel">이름 *</label></h4>
							<!-- 일반/카카오 로그인 -->
							<c:if test="${ member.loginType != 'N'}">
								<input type="text" name="name" id="name" class="texttype2" maxlength="10" placeholder="이름을 입력해주세요" required>
							</c:if>
							<!-- 네이버 로그인 -->
							<c:if test="${ member.loginType == 'N'}">
								<input type="hidden" name="name" id="name" value="${ member.name }" >
								<div class="snsDiv">${ member.name }</div>
							</c:if>
							
						</div>

						<div class="enrollwrap">
							<label class="enrollLabel"><h4>생년월일 *</h4>
							<!-- 일반/카카오 로그인 -->
							<c:if test="${ member.loginType != 'N'}">
							<select name="birth1" id="birth1" class="selecttype" required>
								<option  value="년" disabled selected>년</option>
								<c:forEach var="i" begin="1900" end="2023">
    								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>년</option>
								</c:forEach>
							</select>
							
							
							<select name="birth2" id="birth2" class="selecttype" required>
								<option  value="월" disabled selected>월</option>
								<c:forEach var="i" begin="1" end="9">
    								<option value="<c:out value="0${i}"/>"><c:out value="${i}"/>월</option>
								</c:forEach>
								<c:forEach var="i" begin="10" end="12">
    								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>월</option>
								</c:forEach>
							</select>
							
							<select name="birth3" id="birth3" class="selecttype" required>
								<option  value="일" disabled selected>일</option>
								<c:forEach var="i" begin="1" end="9">
    								<option value="<c:out value="0${i}"/>"><c:out value="${i}"/>일</option>
								</c:forEach>
								<c:forEach var="i" begin="10" end="31">
    								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>일</option>
								</c:forEach>
							</select>
							<input type="hidden" id="birth" name="birth" value="">
							</c:if>
							<!-- 네이버 로그인 -->
							<c:if test="${ member.loginType == 'N'}">
								<input type="hidden" name="birth" id="birth" value="${ member.birth }" >
								<div class="snsDiv">${ member.birth }</div>
							</c:if>
							</label>
						</div>		

							<div class="enrollwrap">
								<h4><label for="email1" class="enrollLabel">이메일 *</label></h4>
									<c:if test="${ member.loginType != 'N' && member.loginType != 'K' }">
									<!-- 일반로그인 -->
											<input type="text"  class="texttype3" name="email1" id="email1" required>&nbsp;&nbsp;@&nbsp;
											<input type="text"  class="texttype3" name="email2" list="email3"  id="email2" placeholder="직접입력" required>
											<datalist id="email3">
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
													<option value="gmail.com">gmail.com</option>
												</datalist>	
											<input type="button" id="checkDuplicate3" class="inputbtn" value="중복확인" >
											<div id="emailsucc">사용 가능한 이메일입니다.</div>
											<input type="hidden" id="email" name="email" value="">
									</c:if>
									<!-- 간편로그인 -->
									<c:if test="${ member.loginType == 'N' || member.loginType == 'K' }">
											<div class="snsDiv">${ member.email }</div>
											<input type="hidden"  name="email" value="${ member.email }">
									</c:if>
							</div>
						

						<div class="enrollwrap">
							
							<label class="enrollLabel"><h4>휴대전화번호 *</h4>
							<!-- 일반/카카오 로그인 -->
							<c:if test="${ member.loginType != 'N'}">
								<input type="text"  class="texttype3" name="phone1" id="phone1" value="010" maxlength="3" required> -
								<input type="text"  class="texttype3" name="phone2" id="phone2" maxlength="4" required> -
								<input type="text"  class="texttype3" name="phone3" id="phone3" maxlength="4" required>
								<input type="hidden" id="phone" name="phone" value="">
							</c:if>
							<!-- 네이버 로그인 -->
							<c:if test="${ member.loginType == 'N'}">
								<input type="hidden" name="phone" id="phone" value="${ member.phone }" >
								<div class="snsDiv">${ member.phone }</div>
							</c:if>
							</label>
						</div>

						<div class="enrollwrap" id="addressArea">
							<label class="enrollLabel">
							<h4>주소</h4>
							<input type="text" name="zipcode" id="zipcode" maxlength="7" class="texttype1" readonly>
							<input type="button" id="findaddress" class="inputbtn" value="우편번호 찾기"  onclick="findAddr()">
							<input type="text" name="address1" id="address1" class="texttype4"  readonly >
							<input type="text" name="address2" id="address2" class="texttype4"  placeholder="상세주소" >
							<input type="hidden" id="address" name="address" value="">
							</label>
						</div>
					</div>

					<hr>
					
					<div id="content3">
						<h3>        
							약관동의
						</h3>
						<span class="sub"><b>약관 및 개인정보 수집 이용에 동의 해주세요.</b></span>
					</div>
					<div id="content5">
						<table id="agreetb">
							<tr>
								<td id="tb_all" colspan="2"><label><input type="checkbox" id="agreeAll">전체 약관 동의</label></td>
									
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree1" class="agree" required><span class="sub">[필수]</span> 이용약관 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button" id="agree-modalbtn1" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree2" class="agree" required><span class="sub">[필수]</span> 개인정보 수집 및 이용 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button" id="agree-modalbtn2" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree3" class="agree"><span class="sub">[선택]</span> 위치기반서비스 이용약관 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button"  id="agree-modalbtn3" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree4" class="agree"><span class="sub">[선택]</span> 마켓팅 광고 활용 및 수신 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button"  id="agree-modalbtn4" value="보기"></input></td>
							</tr>
						</table>
					</div>
					<div id="content6">
						
						<input type="submit" id="enrollSubmit" value="가입하기" >	
						
					</div>
				</form>
			</div>
		</div> 
	</section>

	<jsp:include page="../member/enrollModal.jsp" />
	<script src="${ path }/js/member/enrollModal.js"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath",
				"${pageContext.request.contextPath}");
	</script>
	<script src="${ path }/js/member/enroll.js"></script>
	<c:if test="${ member.loginType == 'N' || member.loginType == 'K' }">
		<script>
			alert("${ msg }");
		</script>
	</c:if>
</body>
</html>