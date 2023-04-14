<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<script src="${ path }/js/common/jquery-3.6.3.js"></script>
<script src="${ path }/js/common/jquery-3.6.3.min.js"></script>
<meta charset="UTF-8">
<title>station</title>
</head>
<body>
	
	
	<button id="cityBtn">도시선택</button>
    <p id="citycode"></p>
    
	<script src="${ path }/js/trainTable/station.js"></script>
</body>
</html>