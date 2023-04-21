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
     <link href="${ path }/css/accommodation/accommodationReservation.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="${ path }/css/accommodation/review.css" rel="stylesheet" type="text/css">
	<!-- CDN 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
	  <h5>후기 작성</h5>
	  <hr class="line">
	  <form action="${path}/accommodation/review" method="post" onsubmit="return validateForm()">
	    <!-- 숙소 정보 -->
	    <div class="accommodation-info">
	      <h6><c:out value="${accommodation.name}"/></h6>
	    </div>
	
	    <!-- 숙소 번호 입력(hidden) -->
	    <input type="hidden" name="accommodationNo" value="${accommodation.no}">
	
	    <!-- 작성자 정보 입력 -->
	    <div class="writer-input">
	      <label for="writer"></label>
	      <input name="memberNo" type="hidden" value="${loginMember.no}"/>
	      <c:if test="${not empty loginMember}">
	        <input type="hidden" name="writer" id="writer" value="<c:out value='${loginMember.nickname}'/>">
	      </c:if>
	      ${loginMember.nickname}
	    </div>
	    <div><fmt:formatDate type="date" value="${reviews.createDate}"/></div>
	
	    <!-- 평점 입력 -->
	    <div>
	      <!-- star-rating을 Vue.js로 바인딩 -->
	      <div class="star-rating">
	        <input type="radio" id="5-stars" name="rating" value="5" v-model="rating">
	        <label for="5-stars" class="star pr-4">★</label>
	        <input type="radio" id="4-stars" name="rating" value="4" v-model="rating">
	        <label for="4-stars" class="star">★</label>
	        <input type="radio" id="3-stars" name="rating" value="3" v-model="rating">
	        <label for="3-stars" class="star">★</label>
	        <input type="radio" id="2-stars" name="rating" value="2" v-model="rating">
	        <label for="2-stars" class="star">★</label>
	        <input type="radio" id="1-star" name="rating" value="1" v-model="rating">
	        <label for="1-star" class="star">★</label>
	      </div>
	
	      <!-- 리뷰 내용 입력 -->
	      <div class="form-group col-12">
	        <textarea id="content" name="content" style="width:300px; height:200px; resize: none;" maxlength="300" placeholder="리뷰를 입력하세요." required v-model="content"></textarea>
	        <div class="textLengthWrap">
	          <p class="textCount">${ content.length }자</p>
	          <p class="textTotal">/300자</p>
	        </div>
	      </div>
	      <button class="apply-button" @click.prevent="submitReview">리뷰작성</button>
	      <button class="cancel-button" type="reset">작성취소</button>
	    </div>
	  </form>
	</div>
	
	<script>
	  export default {
	    data() {
	      return {
	        rating: '', // 사용자가 선택한 star-rating을 저장할 변수
	        content: '', // 사용자가 입력한 리뷰 내용을 저장할 변수
	      }
	    },
	    methods: {
	      submitReview() {
	        // 사용자가 선택한

	        // 사용자가 선택한 star-rating과 리뷰 내용
	        axios.post('/accommodation/review', {
	          rating: this.rating,
	          content: this.content,
	        })
	        .then(response => {
	          // 서버로부터 응답을 받으면 적절한 처리를 수행
	        })
	        .catch(error => {
	          // 에러 처리
	        });
	      }
	    }
	  }
	</script>
		
	<script>
    function validateForm() {
    	if ($('#starPoint').val() === '0') {
    	    $('#rating-error').text('평점을 선택해주세요.');
    	    return false;
    	}
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
            if (content.length > 300) {
                // 200자 부터는 타이핑 되지 않도록
                $(this).val($(this).val().substring(0, 200));
                // 200자 넘으면 알림창 뜨도록
                alert('글자수는 300자까지 입력 가능합니다.');
            };
        });
    });
	</script>
	
	<script type="text/javascript">
		axios.post('/accommodation/review', {
			  rating: this.rating,
			  content: this.content,
		})
	</script>
	

</body>
</html>
