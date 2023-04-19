<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    
    <title>숙소 리뷰 작성</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
    
    <!-- JavaScript -->
    <script src="<c:url value='/resources/js/review.js'/>"></script>
    
</head>
<body>
    <div class="container">
        <h2>숙소 리뷰 작성</h2>
        <form action="<c:url value='/accommodation/review'/>" method="post" onsubmit="return validateForm()">
            <!-- 숙소 정보 -->
            <div class="accommodation-info">
                <h3><c:out value="${ accommodation.name } "/></h3>
            </div>
            <!-- 평점 입력 -->
            <div class="rating-input">
                <label for="rating">평점</label>
                <select name="rating" id="rating">
                    <option value="1">1점</option>
                    <option value="2">2점</option>
                    <option value="3">3점</option>
                    <option value="4">4점</option>
                    <option value="5">5점</option>
                </select>
                <p id="rating-error" class="error"></p>
            </div>
            <!-- 리뷰 내용 입력 -->
            <div class="review-input">
                <label for="content">리뷰 내용</label>
                <textarea name="content" id="content"></textarea>
                <p id="content-error" class="error"></p>
            </div>
            <!-- 숙소 번호 입력(hidden) -->
            <input type="hidden" name="accommodationNo" value="<c:out value='${accommodation.no}'/>">
            <!-- 작성자 정보 입력 -->
            <div class="writer-input">
                <label for="writer">작성자</label>
                <c:if test="${not empty loginMember }">
                    <input type="hidden" name="writer" id="writer" value="<c:out value='${ loginMember.nickname}'/>">
                </c:if>
                ${ loginMember.nickname }
			</div>	
			<input type="submit" value="리뷰 작성">
		</form>
</body>
</html>
