<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@ page session="false" %>


<%@ include file="../views/common/header.jsp" %>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button onclick="location.href='${ path }/login'">로그인페이지</button>
</body>
</html>
