<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${ path }/css/common/common.css">
   <header>
        <div class="header-container">
          <div id="menuwrap">
            <div id="logoArea">
              <a href="${ path }/"><img src="${ path }/images/common/OnTheTrain_Logo.png" alt=""></a>
            </div>
            <div id="searchArea">
              <form class="search-form">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                      </svg></button>
                  </form>
            </div>
            <div id="menuArea">
           
              <div id="login">
                <ul>
                   <c:if test="${ empty loginMember }">
                     <li><a href="${ path }/login">로그인</a></li>
                     <li><a href="#">회원가입</a></li>
                     <li><a href="#">고객센터</a></li>
                    </c:if>
                    <c:if test="${ !empty loginMember }">
                     <li><span id="nickname">${ loginMember.nickname } 님</span></li>
                     <li><a href="${ path }/logout">로그아웃</a></li>
                     <li><a href="#">고객센터</a></li>
                    </c:if>
                </ul>
              </div>
              <div id="menu">
                <ul>
                  <li><a href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" color="black" fill="currentColor" class="bi bi-person" viewBox="1 0 17 16">
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                    </svg>
                    <br>&nbsp마이메뉴</a>
                  </li>
                  <li><a href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" color="black" fill="currentColor" class="bi bi-layout-text-sidebar-reverse" viewBox="0 0 21 16">
                      <path d="M12.5 3a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5zm0 3a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5zm.5 3.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5z"/>
                      <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2zM4 1v14H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h2zm1 0h9a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5V1z"/>
                    </svg>
                    <br>&nbsp결제함</a>
                  </li>
                </ul>
              </div>
            </div>

          </div>
          <nav>
            <div id="nav_items">
              <ul> 
                <li><a href="${ path }/trainTable/main">승차권
                  <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 7">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                  </svg></a></li>
                <li><a href="${ path }/accomodation/list">숙박
                  <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 7">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                  </svg></a></li>
                <li><a href="#">스케줄러
                  <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 7">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                  </svg></a></li>
                <li><a href="#">쿠폰
                  <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 7">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                  </svg></a></li>
              </ul>
            </div>
          </nav>
        </div>
      </header>