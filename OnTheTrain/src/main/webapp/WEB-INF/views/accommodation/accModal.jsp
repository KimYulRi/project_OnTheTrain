<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

	
	<div id="modal" class="modal">
		<div class="modal-backdrop"></div>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">후기작성</div>
					</div>
					<div class="modal-body">
						<div>
		                     <div class="left userImg"></div>
		                     <div class="left">
			                     <div class="reviewNick">${ member.nickname }</div>
			                     <div class="cDate">2023.03.20</div>
		                 	</div>
                    	</div>
                    	
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
						<label for="1-star" class="star">★</label>
					</div>
						<input class="keyword" type="text" placeholder="리뷰를 입력하세요" id="searchKeyword" name="searchKeyword">
						<input type="text" id="textLengthCheck" disabled> 
					<div class="modal-footer">
						<button class="apply-button">Apply</button>
						<button class="cancel-button">Cancel</button>
					</div>
				</div>
			</div>
	</div>
