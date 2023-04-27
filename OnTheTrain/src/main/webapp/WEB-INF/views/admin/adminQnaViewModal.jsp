<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<div id="modal" class="modal">
  <div class="qnamodal-backdrop"></div>
  <div class="qnamodal-dialog">
    <div class="modal-content">
    
		      <div class="modal-header">
		        <div class="modal-title"><h3>문의 답변 작성하기</h3></div>
		      </div>
		      <c:if test="${ not empty qnaReply }">
			      <div class="modal-body">
		      		<form action="${ path }/admin/qna/reply" method="POST" enctype="multipart/form-data" >
			        	<input type="hidden" name="qnaReplyNo" value="${qnaReply.qnaReplyNo}">
			        	<input type="hidden" name="qnaNo" value="${qnaReply.qnaNo}">
			        	<textarea id="qnamodalreply" name="qnaReplyContent" required>${ qnaReply.qnaReplyContent }</textarea>
			        </div>
			      <div class="modal-footer">
			        <button type="submit" class="apply-button">수정하기</button>
			        <button type="button" class="cancel-button">취소</button>
		     		 </form>
		    		</div>
	    		</c:if>
	    		  <c:if test="${ empty qnaReply }">
			      <div class="modal-body">
		      		<form action="${ path }/myPage/myPageQnaView" method="POST" enctype="multipart/form-data" >
			        	<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
			        	<textarea id="qnamodalreply" name="qnamodalreply" required></textarea>
			        </div>
			      <div class="modal-footer">
			        <button type="submit" class="apply-button">작성하기</button>
			        <button type="button" class="cancel-button">취소</button>
		     		 </form>
		    		</div>
	    		</c:if>
  	</div>
  </div>
</div>
