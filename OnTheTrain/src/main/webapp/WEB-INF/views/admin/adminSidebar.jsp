<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="${path}/"><img src="${path}/images/admin/adminlogo.png" alt="Logo"></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item" id="ad_dashboard">
                            <a href="${path}/admin/dashboard" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>대시보드</span>
                            </a>
                        </li>

                        <li class="sidebar-item" id="ad_memberboard">
                            <a href="${path}/admin/member" class='sidebar-link'>
                                <i class="bi bi-person-lines-fill"></i>
                                <span>회원관리</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item" id="ad_ticketboard">
                            <a href="${path}/admin/ticket" class='sidebar-link'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ticket-fill" viewBox="0 0 16 16">
								  <path d="M1.5 3A1.5 1.5 0 0 0 0 4.5V6a.5.5 0 0 0 .5.5 1.5 1.5 0 1 1 0 3 .5.5 0 0 0-.5.5v1.5A1.5 1.5 0 0 0 1.5 13h13a1.5 1.5 0 0 0 1.5-1.5V10a.5.5 0 0 0-.5-.5 1.5 1.5 0 0 1 0-3A.5.5 0 0 0 16 6V4.5A1.5 1.5 0 0 0 14.5 3h-13Z"/>
								</svg>
                                <span>승차권관리</span>
                            </a>
                        </li>
                        
                        
                        <li class="sidebar-item" id="ad_accommodationboard">
                            <a href="${path}/admin/accommodation" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>숙박예약관리</span>
                            </a>
                        </li>


                        <li class="sidebar-item" id="ad_cuponboard">
                            <a href="${path}/admin/cupon" class='sidebar-link'>
                               <i class="bi bi-gift-fill"></i>
                                <span>쿠폰관리</span>
                            </a>
                        </li>

                        <li class="sidebar-item" id="ad_qnaboard">
                            <a href="${path}/admin/qna" class='sidebar-link'>
                               <i class="bi bi-chat-dots-fill"></i>
                                <span>1:1문의관리</span>
                            </a>
                        </li>
                   </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>