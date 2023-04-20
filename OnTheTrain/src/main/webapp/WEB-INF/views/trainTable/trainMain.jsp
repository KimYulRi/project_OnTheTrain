<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>온더테이블</title>
    
    <link href="${ path }/css/trainTable/trainMain.css" rel="stylesheet"
	type="text/css">
	
	<link href="${ path }/css/trainTable/calendar.css" rel="stylesheet"
	type="text/css">
	
	<link href="${ path }/css/trainTable/seatModal.css" rel="stylesheet"
	type="text/css">
	
	<%@ include file="../common/header.jsp" %>
  </head>
  <script src="${ path }/js/common/jquery-3.6.3.js"></script>
  <script src="${ path }/js/common/jquery-3.6.3.min.js"></script>
  
  <body>
    <div id="banner">
      <div id="banner_text">승차권 조회</div>
</div>
<div id="field">
<fieldset id="ttable">  
  <table align="center"  id="ftable">
    <tr id="topTable">
      <th colspan="2" width="100px" style="font-size: 20px">출발</th>
      <td>
      <input style="height: 25px;" type="text" class="depPlaceText">
      <input style="height: 25px;" type="hidden" id="depPlaceId">
      </td>
      <td>
        <button id="depId">
        <a href="javascript:openPopup()">조회</a>  
        </button>
      </td>
    </tr>
    
    <tr>
      <td colspan="2"></td>
      <td> <img src="${ path }/resources/images/trainTable/cross.png" style="width: 20px; height: 20px;"></td>
    </tr>
    <tr>
      <th colspan="2" width="100px" style="font-size: 20px;">도착</th>
      <td>
      <input style="height: 25px;" type="text" class="arrPlaceText">
      <input style="height: 25px;" type="hidden" id="arrPlaceId">
      </td>
      <td>
        <button id="depId">
        <a href="javascript:openPopup1()">조회</a>  
        </button>
      </td>

    </tr>
    <tr>
      <th colspan="2" width="100px" style="font-size: 20px;">출발일시</th>
      <td><input style="height: 25px;" type="text" name="" id="depPlandTime"></td>
    </tr>
 
  </table>
	<div id="calcal" style="margin-left: 100px;">
          <table class="Calendar"">
              <thead>
                  <tr>
                      <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                      <td colspan="5">
                          <span id="calYear"></span>년
                          <span id="calMonth"></span>월
                      </td>
                      <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                  </tr>
                  <tr>
                      <td>일</td>
                      <td>월</td>
                      <td>화</td>
                      <td>수</td>
                      <td>목</td>
                      <td>금</td>
                      <td>토</td>
                  </tr>
              </thead>
  
              <tbody>
              </tbody>
          </table>
      </div>
</fieldset>

<fieldset id="ptable">
    <table align="center">
      <tr>
        <th  width="100px" style="font-size: 20px; text-align: left;">인원정보</th>
      </tr>
      <tr>
        <td>
          <select name="adult" id="adult" style="width:190px; height: 40px; cursor: pointer;" >
            <option value="0" selected="selected">어른 0명</option>
            <option value="1">어른 1명</option>
            <option value="2">어른 2명</option>
            <option value="3">어른 3명</option>
            <option value="4">어른 4명</option>
            <option value="5">어른 5명</option>
            <option value="6">어른 6명</option>
            <option value="7">어른 7명</option>
            <option value="8">어른 8명</option>
            <option value="9">어른 9명</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <select name="child" id="child" style="width:190px; height: 40px; cursor: pointer;">
            <option value="0" selected="selected">어린이 0명</option>
            <option value="1">어린이 1명</option>
            <option value="2">어린이 2명</option>
            <option value="3">어린이 3명</option>
            <option value="4">어린이 4명</option>
            <option value="5">어린이 5명</option>
            <option value="6">어린이 6명</option>
            <option value="7">어린이 7명</option>
            <option value="8">어린이 8명</option>
            <option value="9">어린이 9명</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <select name="senior" id="senior" style="width:190px; height: 40px; cursor: pointer;">
            <option value="0" selected="selected">경로 0명</option>
            <option value="1">경로 1명</option>
            <option value="2">경로 2명</option>
            <option value="3">경로 3명</option>
            <option value="4">경로 4명</option>
            <option value="5">경로 5명</option>
            <option value="6">경로 6명</option>
            <option value="7">경로 7명</option>
            <option value="8">경로 8명</option>
            <option value="9">경로 9명</option>
          </select>
        </td>
      </tr>
    </table>
    
    <h3 align="left">도우미 서비스</h3>
    <p>
      * 휠체어 대여, 휠체어리프트 사용, 시각장애인 동행 서비스 이용을 희망하시는 고객님께선 역사 내 안내센터를 방문하여 직원에게 말씀해주세요. 친절하게 도와드리겠습니다.
    </p>
  
  </fieldset>
  
</div>

        <div align="center" id="searchTrain">
        <button type="button" id="traintable_btn">조회하기</button>
        </div>
        
        <br>
        
        

        <p id="train"></p>
        
	<script src="${ path }/js/trainTable/popUpDep.js"></script>
	<script src="${ path }/js/trainTable/popUpArr.js"></script>
    <script src="${ path }/js/trainTable/trainMain.js"></script>
    <script src="${ path }/js/trainTable/calendar.js"></script>
    
    <jsp:include page="./seatModal.jsp" />
  </body>
</html>