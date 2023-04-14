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
<link rel="stylesheet" type="text/css" href="${ path }/css/common/modal.css">
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../common/header.jsp" %>
</head>
<body>
	<section>
		<div class="main-container">
        	<div class="contentArea">
				<form name="memberEnrollFrm" action="${ path }/member/enroll" method="POST">
        		<div id="content1">
			        <h2>        
					    회원가입 <span class="sub">*는 필수 입력사항입니다.</span>
					</h2>
                </div>
				
					<div id="content2">
						<div class="enrollwrap">
							<h4><label for="userId" class="enrollLabel">아이디 *</label></h4>
							<input type="text" name="userId" id="userId"  class="texttype1" placeholder="6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합" required>
							<input type="button" id="checkDuplicate1" class="inputbtn" value="중복확인" >
						</div>

						<div class="enrollwrap">
							<h4><label for="password1" class="enrollLabel">비밀번호 *</label></h4>
							<input type="password" id="password1" class="texttype2"  placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" required>
						</div>
						
						<div class="enrollwrap">
							<h4><label for="password2" class="enrollLabel">비밀번호 확인 *</label></h4>
							<input type="password" id="password2" class="texttype2" placeholder="비밀번호를 한번 더 입력해주세요" required>
						</div>
						
						<div class="enrollwrap">
							<h4><label for="nickname" class="enrollLabel">닉네임 *</label></h4>
							<input type="text" name="nickname" id="nickname" class="texttype1" placeholder="닉네임을 입력해주세요" required>
							<input type="button" id="checkDuplicate2" class="inputbtn" value="중복확인" >
						</div>
						
						<div class="enrollwrap">
							<h4><label for="name" class="enrollLabel">이름 *</label></h4>
							<input type="text" name="name" id="name" class="texttype2" placeholder="이름을 입력해주세요" required>
						</div>

						<div class="enrollwrap">
							<h4><label for="birth" class="enrollLabel">생년월일 *</label></h4>
							<input type="text"  class="texttype3" name="birth1" id="birth1" maxlength="4" placeholder="년(4자)" required>
							
							<select name="birth2" id="birth2" class="selecttype" required>
								<option  value="월" disabled selected>월</option>
								<c:forEach var="i" begin="1" end="12">
    								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>월</option>
								</c:forEach>
							</select>
							
							<select name="birth3" id="birth3" class="selecttype" required>
								<option  value="일" disabled selected>일</option>
								<c:forEach var="i" begin="1" end="31">
    								<option value="<c:out value="${i}"/>"><c:out value="${i}"/>일</option>
								</c:forEach>
							</select>
							
						</div>		

						<div class="enrollwrap">
							<h4><label for="email1" class="enrollLabel">이메일 *</label></h4>
							<input type="text"  class="texttype3" name="email1" id="email1" required> @
							<input type="text"  class="texttype3" name="email2" list="email2"  placeholder="직접입력" required>
							<datalist id="email2">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</datalist>	
							<input type="button" id="checkDuplicate3" class="inputbtn" value="중복확인" >
						</div>

						<div class="enrollwrap">
							
							<h4><label for="phone" class="enrollLabel">휴대폰번호 *</label></h4>
							<input type="text"  class="texttype3" name="phone1" id="phone1" value="010" maxlength="3" required> -
							<input type="text"  class="texttype3" name="phone2" id="phone2" maxlength="4" required> -
							<input type="text"  class="texttype3" name="phone3" id="phone3" maxlength="4" required>
							
						</div>

						<div class="enrollwrap" id="addressArea">
							<label class="enrollLabel">
							<h4>주소</h4>
							<input type="text" name="zipcode" id="zipcode" maxlength="7" class="texttype1" readonly>
							<input type="button" id="findadress" class="inputbtn" value="우편번호 찾기"  onclick="findAddr()">
							<input type="text" name="address" id="address" class="texttype2"  readonly >
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
								<td class="tb_td1"><label><input type="checkbox" id="agree1" class="agree" required><span class="sub">[필수]</span> 회원 가입 및 운영약관 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button" id="agree-modalbtn1" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree2" class="agree" required><span class="sub">[필수]</span> 개인정보 수집 및 이용 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button" id="agree-modalbtn2" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree3" class="agree" required><span class="sub">[필수]</span> 위치정보 이용약관 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button" id="agree-modalbtn3" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree4" class="agree"><span class="sub">[선택]</span> 개인정보 제 3차 제공 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button"  id="agree-modalbtn4" value="보기"></input></td>
							</tr>
							<tr>
								<td class="tb_td1"><label><input type="checkbox" id="agree5" class="agree"><span class="sub">[선택]</span> 마켓팅 광고 활용 및 수신 동의</label></td>
								<td class="tb_td2"><input type="button" class="agreebtn open-modal-button"  id="agree-modalbtn5" value="보기"></input></td>
							</tr>
						</table>
					</div>
					<div id="content6">
						
						<input type="submit" id="enrollSubmit" value="가입하기" onClick="return check()">	
						
					</div>
				</form>
			</div>
		</div> 
	</section>

	<jsp:include page="../member/enrollModal.jsp" />
	<script src="${ path }/js/common/modal.js"></script>

	<script>
		// 주소찾기
		function findAddr(){
			new daum.Postcode({
				oncomplete: function(data) {
					
					console.log(data);
					
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var jibunAddr = data.jibunAddress; // 지번 주소 변수

					document.getElementById('zipcode').value = data.zonecode;
					if(roadAddr !== ''){
						document.getElementById("address").value = roadAddr;
					} 
					else if(jibunAddr !== ''){
						document.getElementById("address").value = jibunAddr;
					}
				}
			}).open();
		}
		
		
		// 생년월일 select 선택시 글자색을 변경해주는 이벤트
		var selectElement = document.querySelector('select');
		selectElement.addEventListener('change', function() {
		  var selectedOption = selectElement.options[selectElement.selectedIndex];
		  if (selectedOption.disabled) {
		  } else {
		    selectElement.style.color = 'black';
		  }
		});
		
		var daySelectElement = document.getElementById('birth3');

		daySelectElement.addEventListener('change', function() {
		  var selectedOption = daySelectElement.options[daySelectElement.selectedIndex];
		  if (selectedOption.disabled) {
		  } else {
		    daySelectElement.style.color = 'black';
		  }
		});
		
		// 약관동의 - 체크박스 전체 선택
		const agreeAllCheckbox = document.getElementById('agreeAll');
		const requiredCheckboxes = document.querySelectorAll('.agree');
		
		agreeAllCheckbox.addEventListener('change', function() {
			  const isChecked = agreeAllCheckbox.checked;
			  requiredCheckboxes.forEach(function(checkbox) {
			    checkbox.checked = isChecked;
			  });
			});
		
		
		</script>
</body>
</html>