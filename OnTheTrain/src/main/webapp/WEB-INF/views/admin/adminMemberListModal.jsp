<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
	
	    <div class="modal-content">
	        <div class="modal-header">
	            <h4>회원정보</h4>
	            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	                <i data-feather="x"></i>
	            </button>
	        </div>
	        
	        <div class="modal-body">
	        
	            <form name="memberUpdateForm" id="memberUpdateForm" action="#" method="POST" onsubmit="return Validation();">

					<!-- 일반로그인 : 아이디, 비밀번호 필요 -->
						<div class="memberwrap">
							<h6><label for="userId" class="memberLabel">아이디</label></h6>
							<input type="text" name="id" id="userId" maxlength="12" class="texttype1" placeholder="영문 혹은 영문과 숫자를 조합 4~12자" required>
							<input type="button" id="checkDuplicate1" class="inputbtn" value="중복확인" >
							<div id="idsucc">사용 가능한 아이디입니다.</div>
						</div>
				
						<div class="memberwrap">
							<h6><label for="password1" class="memberLabel">새 비밀번호</label></h6>
							<input type="password" id="password1" name="password" class="texttype2" maxlength="15" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" >
						</div>
						
						<div class="memberwrap">
							<h6><label for="password2" class="memberLabel">비밀번호 확인</label></h6>
							<input type="password" id="password2" class="texttype2" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요" >
						</div>
					
					
						<div class="memberwrap">
							<h6><label for="nickname" class="memberLabel">닉네임</label></h6>
								<input type="text" name="nickname" id="nickname" class="texttype1" maxlength="10" placeholder="영문, 한글, 숫자 2~10자" required>
							<input type="button" id="checkDuplicate2" class="inputbtn" value="중복확인" >
							<div id="nicksucc">사용 가능한 닉네임입니다.</div>
						</div>
						
						
						<div class="memberwrap">
							<h6><label for="name" class="memberLabel">이름</label></h6>
							<input type="text" name="name" id="name" class="texttype2" maxlength="10" placeholder="이름을 입력해주세요" required>
						</div>
				
				
						<div class="memberwrap">
							<label class="memberLabel">
								<h6>생년월일</h6>
								
								<select name="birth1" id="birth1" class="selecttype" required>
									<option  value="년" disabled selected>년</option>
									<c:forEach var="i" begin="1900" end="2023">
										<option value="<c:out value="${i}"/>"><c:out value="${i}"/>년</option>
									</c:forEach>
								</select>
					
					
								<select name="birth2" id="birth2" class="selecttype" required>
									<option  value="월" disabled selected>월</option>
									<c:forEach var="i" begin="1" end="12">
										<option value="<c:out value="${i}"/>"><c:out value="${i}"/>월</option>
									</c:forEach>
								</select>
					
								<select name="birth3" id="birth3" class="selecttype" required>
									<option  value="일" disabled >일</option>
									<c:forEach var="i" begin="1" end="31">
										<option value="<c:out value="${i}"/>"><c:out value="${i}"/>일</option>
									</c:forEach>
								</select>
								
								<input type="hidden" id="birth" name="birth" value="">
							</label>
						</div>		
				
						<div class="memberwrap">
							<h6><label for="email1" class="memberLabel">이메일</label></h6>
								<input type="text"  class="texttype3" name="email1" id="email1" required>&nbsp;&nbsp;@&nbsp;
								<input type="text"  class="texttype4" name="email2" list="email3"  id="email2" placeholder="직접입력" required>
								<datalist id="email3">
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</datalist>	
								<input type="button" id="checkDuplicate3" class="inputbtn" value="중복확인" >
								<div id="emailsucc">사용 가능한 이메일입니다.</div>
								
								<input type="hidden" id="email" name="email" value="">
						</div>
					
				
					<div class="memberwrap">
						<label class="memberLabel"><h6>휴대전화번호</h6>
							<input type="text"  class="texttype3" name="phone1" id="phone1" value="010" maxlength="3" required> -
							<input type="text"  class="texttype3" name="phone2" id="phone2" maxlength="4" required> -
							<input type="text"  class="texttype3" name="phone3" id="phone3" maxlength="4" required>
							<input type="hidden" id="phone" name="phone" value="">
						</label>
					</div>
				
					<div class="memberwrap">
						<label class="memberLabel">
						<h6>주소</h6>
						<input type="text" name="address" id="address" class="texttype1">
						<input type="button" id="findaddress" class="inputbtn" value="찾기"  onclick="findAddr()"><br>
						</label>
						</div>
						
					<div class="memberwrap">
						<label class="memberLabel"><h6>회원등급</h6>
							 <select id="membership" name="membership" class="texttype3">
	                             <option value="M1">Bronze</option>
	                             <option value="M2">Silver</option>
	                             <option value="M3">Gold</option>
	                             <option value="M4">Vip</option>
				             </select>
			             </label>
					</div>
						
					<div class="memberwrap">
						<label class="memberLabel"><h6>회원상태</h6>
							 <select id="status" name="status" class="texttype3">
                                 <option value="Y">정상</option>
                                 <option value="N">정지</option>
                             </select>
                        </label>
					</div>
			
					<input type="button" id="updateSubmit"  value="수정하기" >	
					<input type="button" id="terminatebtn"  value="탈퇴" >	
					
				</form>
			</div>
			
            <div class="modal-footer">
                <button type="button" class="btn adminmodalbtnClose"
                    data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
                <button type="button" class="btn ml-1 adminmodalbtnokay"
                    data-bs-dismiss="modal">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">확인</span>
                </button>
            </div>
        </div>
    </div>
</div>