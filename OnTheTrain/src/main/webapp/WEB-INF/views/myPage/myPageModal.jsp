<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    

<div id="memberShipModal" class="modal">
	<div class="modal-backdrop"></div>
	<div class="memberShipmodal-dialog">
		<div class="modal-content">
<!-- 			<div class="modal-header"> -->
<!-- 				<div class="modal-title">Modal Title</div> -->
<!-- 			</div> -->
			<div class="modal-body">
								<div id="modallogo"><img width="100px" height="100px" src="${ path }/images/common/OnTheTrain_Logo.png" alt=""></div>

             	   <div>
                    <div id="vipbody" class="body">
                        <div id="viptitle" class="bodymargin">VIP</div>
                        <div id="vipcontent" class="bodymargin">
                            누적 결제금액<br>
                            150만원 이상 적용
                        </div>
                        <div id="vipsale" class="bodymargin">결제시 추가 할인 5%</div>
                    </div>
                    <div id="goldbody" class="body">
                        <div id="goldtitle" class="bodymargin">GOLD</div>
                        <div id="goldcontent" class="bodymargin">
                            누적 결제금액<br>
                            100만원 이상 적용
                        </div>
                        <div id="goldsale" class="bodymargin">결제시 추가 할인 3%</div>
                    </div>
                    <div id="silverbody" class="body">
                        <div id="silvertitle" class="bodymargin">SILVER</div>
                        <div id="silvercontent" class="bodymargin">
                            누적 결제금액<br>
                            50만원 이상 적용
                        </div>
                        <div id="silversale" class="bodymargin">결제시 추가 할인 2%</div>
                    </div>
                    <div id="bronzebody" class="body">
                        <div id="bronzetitle" class="bodymargin">BRONZE</div>
                        <div id="bronzecontent" class="bodymargin">
                            가입 즉시 혜택을 <br>
                            받으실수 있습니다.
                        </div>
                        <div id="bronzesale" class="bodymargin">결제시 추가 할인 1%</div>
                    </div>

                </div>
			<div class="modal-footer">
				<button class="cancel-button">확인</button>
			</div>
		</div>
	</div>
	</div>
</div>

<div id="pwdModal" class="modal">
    <div class="modal-backdrop"></div>
    <div class="pwdmodal-dialog">
        <div class="modal-content">
				<form action="${ path }/myPage/myPageInfoPwd" method="POST" id="pwdForm">
				  <div class="modal-body">
				    <div id="modallogo">
				      <img width="100px" height="100px" src="${ path }/images/common/OnTheTrain_Logo.png" alt="">
				    </div>
				    <div id="pwdbody">
				      <label for="currentPwd">현재 비밀번호 : </label>
				      <input type="password" id="currentPwd" name="currentPwd" >
				      <br>
				      <label for="newPwd">새로운 비밀번호 : </label>
				      <input type="password" id="newPwd" name="newPwd">
				      <br>
				      <label for="newPwd">비밀번호 확인 : </label>				
				      <input type="password" id="checkPwd" name="checkPwd">
				    </div>
				  </div>
				  <div class="modal-footer">
				    <button id="pwdbtn" type="submit" class="cancel-button" onclick="return Validation();">확인</button>
				  </div>
				</form>

        </div>
    </div>
</div>




<div id="qnaModal" class="modal">
	<div class="modal-backdrop"></div>
	<div class="qnamodal-dialog">
		<div class="modal-content">
<!-- 			<div class="modal-header"> -->
<!-- 				<div class="modal-title">Modal Title</div> -->
<!-- 			</div> -->
			<div class="modal-body">
								<div id="modallogo"><img width="100px" height="100px" src="${ path }/images/common/OnTheTrain_Logo.png" alt=""></div>

             	   <div>
                    <div id="vipbody" class="body">
                        <div id="viptitle" class="bodymargin">VIP</div>
                        <div id="vipcontent" class="bodymargin">
                            누적 결제금액<br>
                            150만원 이상 적용
                        </div>
                        <div id="vipsale" class="bodymargin">결제시 추가 할인 5%</div>
                    </div>
                    <div id="goldbody" class="body">
                        <div id="goldtitle" class="bodymargin">GOLD</div>
                        <div id="goldcontent" class="bodymargin">
                            누적 결제금액<br>
                            100만원 이상 적용
                        </div>
                        <div id="goldsale" class="bodymargin">결제시 추가 할인 3%</div>
                    </div>
                    <div id="silverbody" class="body">
                        <div id="silvertitle" class="bodymargin">SILVER</div>
                        <div id="silvercontent" class="bodymargin">
                            누적 결제금액<br>
                            50만원 이상 적용
                        </div>
                        <div id="silversale" class="bodymargin">결제시 추가 할인 2%</div>
                    </div>
                    <div id="bronzebody" class="body">
                        <div id="bronzetitle" class="bodymargin">BRONZE</div>
                        <div id="bronzecontent" class="bodymargin">
                            누적 결제금액<br>
                            10만원 이상 적용
                        </div>
                        <div id="bronzesale" class="bodymargin">결제시 추가 할인 1%</div>
                    </div>

                </div>
			<div class="modal-footer">
				<button class="cancel-button">확인</button>
			</div>
		</div>
	</div>
	</div>
</div>