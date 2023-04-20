<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>


<div id="modal1" class="modal">
    <div class="modal-backdrop" id="modal-backdrop1"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">회원정보</div>
            </div>
            <div class="modal-body">
			<%-- 	<form name="memberEnrollForm" action=" method="POST" onsubmit="return Validation();">

					    회원가입 <span class="sub">*는 필수 입력사항입니다.</span>
					
                </div>
				
					<div id="content2" >
						<!-- 일반로그인 : 아이디, 비밀번호 필요 -->
							<div class="enrollwrap">
							<h4><label for="userId" class="enrollLabel">아이디 *</label></h4>
							<input type="text" name="id" id="userId" maxlength="12" class="texttype1"  placeholder="영문 혹은 영문과 숫자를 조합 4~12자" required>
							<input type="button" id="checkDuplicate1" class="inputbtn" value="중복확인" >
    						<div id="idsucc">사용 가능한 아이디입니다.</div>
							</div>
							
						<div class="enrollwrap">
							<h4><label for="nickname" class="enrollLabel">닉네임 *</label></h4>
								<input type="text" name="nickname" id="nickname" class="texttype1" maxlength="10" placeholder="영문, 한글, 숫자 2~10자" required>
							<input type="button" id="checkDuplicate2" class="inputbtn" value="중복확인" >
							<div id="nicksucc">사용 가능한 닉네임입니다.</div>
						</div>
						
						
						<div class="enrollwrap">
							<h4><label for="name" class="enrollLabel">이름 *</label></h4>
						</div>

						<div class="enrollwrap">
							<label class="enrollLabel"><h4>생년월일 *</h4>
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
							</label>
						</div>		

							<div class="enrollwrap">
								<h4><label for="email1" class="enrollLabel">이메일 *</label></h4>
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
							</div>
						

						<div class="enrollwrap">
							
							<label class="enrollLabel"><h4>휴대전화번호 *</h4>
								<input type="text"  class="texttype3" name="phone1" id="phone1" value="010" maxlength="3" required> -
								<input type="text"  class="texttype3" name="phone2" id="phone2" maxlength="4" required> -
								<input type="text"  class="texttype3" name="phone3" id="phone3" maxlength="4" required>
								<input type="hidden" id="phone" name="phone" value="">

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
				</form> --%>
            </div>
            <div class="modal-footer">
                <button class="cancel-button" id="cancel-button1">확인</button>
            </div>
        </div>
    </div>
</div>
