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
    <title>Document</title>
    
    <link href="${ path }/css/trainTable/trainMain.css" rel="stylesheet"
	type="text/css">
	
	<link href="${ path }/css/trainTable/calendar.css" rel="stylesheet"
	type="text/css">
	
	<link href="${ path }/css/common/modal.css" rel="stylesheet"
	type="text/css">
  </head>
  <script src="${ path }/js/common/jquery-3.6.3.js"></script>
  <script src="${ path }/js/common/jquery-3.6.3.min.js"></script>
  
  <body>
    <div id="banner">
      <div id="banner_text">승차권 조회</div>
</div>
<div class="field">
<fieldset id="ttable" style="width: 900px;">  
  <table align="center">
    <tr id="topTable">
      <th colspan="2" width="100px" style="font-size: 20px">출발</th>
      <td><input style="height: 25px;" type="text" name="" id="depPlaceId"></td>
      <td>
        <button id="depId">
        <a href="javascript:openPopup()">조회</a>  
        </button>
      </td>
      <th colspan="2" width="100px">인원</th>
      <td><input type="text" style="width: 200px;"></td>
      <td><select name="" id=""></select></td>
    </tr>
    <tr>
      <td colspan="2"></td>
      <td> <img src="${ path }/resources/images/trainTable/cross.png" style="width: 30px; height: 30px;"></td>
    </tr>
    <tr>
      <th colspan="2" width="100px" style="font-size: 20px;">도착</th>
      <td><input style="height: 25px;" type="text" name="" id="arrPlaceId"></td>
      <td><input type="submit" value="조회" id="arId"></td>
      <td></td>
      <td></td>
      <td colspan="2" rowspan="3">
        <div id="calcal">
          <table class="Calendar">
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

      </td>
    </tr>
    <tr>
      <th colspan="2" width="100px" style="font-size: 20px;">출발일시</th>
      <td><input style="height: 25px;" type="text" name="" id="depPlandTime"></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>

</fieldset>
</div>

        <div align="center">
        <button type="button" id="traintable_btn">조회하기</button>
        </div>
        
        <br>
        
        <div id="charge">
          <button id="charge_btn">요금표</button>
        </div>
        <div id="modal" class="modal">
          <div class="modal-backdrop"></div>
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <div class="modal-title">운임 요금표</div>
              </div>
              <div class="modal-body">
                <p id="chargetable"></p>
              </div>
              <div class="modal-footer">
                <button class="apply-button">확인</button>
                <button class="cancel-button">닫기</button>
              </div>
            </div>
          </div>
        </div> 

        <p id="chargetable"></p>
        <p id="train"></p>
        
	<script src="${ path }/js/trainTable/popUp.js"></script>
	<script src="${ path }/js/trainTable/chargeModal.js"></script>
    <script src="${ path }/js/trainTable/trainMain.js"></script>
    <script src="${ path }/js/trainTable/calendar.js"></script>
  </body>
</html>