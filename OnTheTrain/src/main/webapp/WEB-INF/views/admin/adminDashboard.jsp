<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

    <link rel="stylesheet" href="${path}/bootstrap5/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/bootstrap5/assets/css/app.css">
    <link rel="stylesheet" href="${path}/css/admin/adminDashboard.css">
</head>

<body>
    <div id="app">
    <%@ include file="../admin/adminSidebar.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h4>${ serverTime }</h4>
            </div>
            
            <div class="page-content">
                <section class="row">
                
                    <div class="col-12">
                        <div class="row">
                        
                            <div class="col-6 col-lg-3 col-md-6" style="padding-left:0px;">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon blue">
                                                    <i class="iconly-boldAdd-User"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">가입자수</h6>
                                                <h6 class="font-extrabold mb-0">{ }명</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon purple">
                                                    <i class="iconly-boldChat"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">미답변 문의</h6>
                                                <h6 class="font-extrabold mb-0">{ }건</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6" >
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon green">
                                                    <i class="iconly-boldCalendar"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">숙박 예약</h6>
                                                <h6 class="font-extrabold mb-0">{ }건</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6" style="padding-right:0px;">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon red">
                                                    <i class="iconly-boldTicket"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">승차권 예약</h6>
                                                <h6 class="font-extrabold mb-0">{ }건</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            
                 		</div>
                 	</div>
                 	
                 	
                 	
                 	
                            <div class="col-12">
                        <div class="row">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>가입자 현황</h4>
                                    </div>
                                    <div class="card-body">
                                        <div id="chart-profile-visit"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                            <div class="col-12">
                        <div class="row">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>통계</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-lg">
                                                <tbody>
                                                    <tr>
                                                        <td class="col-3">
                                                            <div class="d-flex align-items-center">
                                                                <p class="font-bold ms-4 mb-0">총가입자수</p>
                                                            </div>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">{}건</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-3">
                                                            <div class="d-flex align-items-center">
                                                                <p class="font-bold ms-4 mb-0">총예약건수</p>
                                                            </div>
                                                        </td>
                                                        <td class="col-auto">
                                                            <p class=" mb-0">{}건</p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                </section>
            </div>
        </div>
    </div>
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>

    <script src="${path}/bootstrap5/assets/vendors/apexcharts.js"></script>
    <script src="${path}/bootstrap5/assets/js/pages/dashboard.js"></script>

    <script>
        // 메뉴바 변경
        window.onload = function() {
			document.getElementById("ad_dashboard").classList.add("active");
		}
        
    </script>
    <script src="${path}/bootstrap5/assets/js/main.js"></script>
</body>

</html>