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
        <div class="modal-title">문의 답변 작성하기</div>
      </div>
      <form action="${ path }/myPage/myPageQnaView" method="POST" enctype="multipart/form-data" >
      		
	      <div class="modal-body">
	        <div>
	        	<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
	        	<textarea id="qnamodalreply" name="qnamodalreply" ></textarea>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="apply-button">Apply</button>
	        <button type="button" class="cancel-button">Cancel</button>
	      </div>
      </form>
    </div>
  </div>
</div>
