<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<link
  href="${ path }/css/common/noResult.css"
  rel="stylesheet"
  type="text/css"
/>

<div class="noResult">
  <div class="noResultImg"></div>
  <div class="line-break"></div>
  <div class="noResultMsg">조회된 결과가 없습니다.</div>
</div>
