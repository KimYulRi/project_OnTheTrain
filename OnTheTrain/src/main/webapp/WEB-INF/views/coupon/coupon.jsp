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
<title>쿠폰 다운로드</title>
	<%@ include file="../common/header.jsp" %>
	<script src="${ path }/js/common/jquery-3.6.3.js"></script>
	<link rel="stylesheet" type="text/css" href="${ path }/css/coupon/coupon.css">
	<script>
		// path 변수를 자바스크립트에서 사용할 수 있는 형태로 변환
		var path = '<%=request.getContextPath()%>';
		var loginMember = '<%=session.getAttribute("loginMember")%>';
	</script>
	<script src="${ path }/js/coupon/coupon.js"></script>
</head>
<body>
	<div id="container">
		<div id="coupon_Banner">
			<img src="${ path }/images/coupon/couponBanner.png">
		</div>
		<div class="coupon_explanation">
			<h2>쿠폰 다운로드</h2>
			<h4>나에게 맞는 쿠폰을 확인하고 다운로드 받아 할인 혜택을 즐겨보세요 !</h4>
		</div>
		<div>
			<hr id="divider">
		</div>
			
			<div class="coupon_explanation">
				<h3>마니아라</h3>
			</div>
			<div class="content_box">
				<div class="content"> 
					<div id="season_coupon" class="coupon_container">
					  <div class="coupon_content">
					    <div class="coupon_left">
					      <div class="coupon_title">낄꿀낭농눙닝냉캥</div>
					      <div class="coupon_discount">5%</div>
					      <div class="coupon_date">사용기간: ~ 2023.05.31</div>
					      <div id="season_coupon_info_modal">
						      <img id="info_icon" src="${ path }/images/coupon/info.png">
						      <p class="coupon_info">쿠폰정보</p>
					      </div>
					    </div>
					    <div class="coupon_right">
					      <div class="coupon_icon">
					        <div id="coupon_download">
					        	<button id="season_coupon_download_btn" class="coupon_download_btn">
					        	<img src="${ path }/images/coupon/download.png">
					        	</button>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				
				<div class="content">
					<div id="season_coupon" class="coupon_container">
					  <div class="coupon_content">
					    <div class="coupon_left">
					      <div class="coupon_title">${ loginMember.no }</div>
					      <div class="coupon_discount">5%</div>
					      <div class="coupon_date">사용기간: ~ 2023.05.31</div>
					    </div>
					    <div class="coupon_right">
					      <div class="coupon_icon">
					        <div id="coupon_download">
					        	<button id="season_coupon_download_btn" class="coupon_download_btn">
					        	<img src="${ path }/images/coupon/download.png">
					        	</button>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
			
			<div class="coupon_explanation">
				<h3>시즌 쿠폰</h3>
			</div>
			<div class="content_box">
				<div class="content">
					<div id="season_coupon" class="coupon_container">
					  <div class="coupon_content">
					    <div class="coupon_left">
					      <div class="coupon_title">봄 시즌 할인 쿠폰</div>
					      <div class="coupon_discount">5%</div>
					      <div class="coupon_date">사용기간: ~ 2023.05.31</div>
					    </div>
					    <div class="coupon_right">
					      <div class="coupon_icon">
					        <div id="coupon_download">
					        	<button id="season_coupon_download_btn" class="coupon_download_btn">
					        	<img src="${ path }/images/coupon/download.png">
					        	</button>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				
				<div class="content">
				<div id="season_coupon" class="coupon_container">
				  <div class="coupon_content">
				    <div class="coupon_left">
				      <div class="coupon_title">봄 시즌 할인 쿠폰</div>
				      <div class="coupon_discount">5%</div>
				      <div class="coupon_date">사용기간: ~ 2023.05.31</div>
				    </div>
				    <div class="coupon_right">
				      <div class="coupon_icon">
				        <div id="coupon_download">
				        	<button id="season_coupon_download_btn" class="coupon_download_btn">
				        	<img src="${ path }/images/coupon/download.png">
				        	</button>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				</div>
				
			</div>
				
			<div class="content_box">
				<div class="content">
					<div id="season_coupon" class="coupon_container">
					  <div class="coupon_content">
					    <div class="coupon_left">
					      <div class="coupon_title">봄 시즌 할인 쿠폰</div>
					      <div class="coupon_discount">5%</div>
					      <div class="coupon_date">사용기간: ~ 2023.05.31</div>
					    </div>
					    <div class="coupon_right">
					      <div class="coupon_icon">
					        <div id="coupon_download">
					        	<button id="season_coupon_download_btn" class="coupon_download_btn">
					        	<img src="${ path }/images/coupon/download.png">
					        	</button>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				
				
			</div>	

			
	
	</div>
	


   <%@ include file="../common/footer.jsp"%>
</body>
</html>