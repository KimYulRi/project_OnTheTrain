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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 리뷰 작성</title>
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <div class="container">
        <h2>숙소 리뷰 작성</h2>
        <form action="<c:url value='/accommodation/review'/>" method="post" onsubmit="return validateForm()">
            <!-- 숙소 정보 -->
            <div class="accommodation-info">
                <h3><c:out value="${ accommodation.name } "/></h3>
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
            <div class="form-group col-12" >
                <label for="content">내용</label>
                 <textarea  id="content" style="height:300px; resize: none;" maxlength="200" placeholder="텍스트를 입력하세요.">
  				</textarea>	
  				<div class="textLengthWrap">
	                <p class="textCount">0자</p>
    				<p class="textTotal">/200자</p>
                </div>
            </div>
            
			<input type="submit" value="리뷰 작성">
		</form>
		
		
	<script>
    function validateForm() {
        // 평점이 선택되어 있는지 확인
        if ($('#rating').val() === '0') {
            $('#rating-error').text('평점을 선택해주세요.');
            return false;
        }
        return true;
    }

    $(document).ready(function() {
        $('#content').on('input', function() {
            let content = $(this).val();

            // 글자수 세기
            if (content.length == 0 || content == '') {
                $('.textCount').text('0자');
            } else {
                $('.textCount').text(content.length + '자');
            }

            // 글자수 제한
            if (content.length > 200) {
                // 200자 부터는 타이핑 되지 않도록
                $(this).val($(this).val().substring(0, 200));
                // 200자 넘으면 알림창 뜨도록
                alert('글자수는 200자까지 입력 가능합니다.');
            };
        });
    });
</script>

</body>
</html>
