<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
</head>

<div class="header-actions">
    <div class="dropdown">

        <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
            <div class="country-container">
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                </a>
                <a href="/" class="py-2">
                    <img src="/assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
                </a>
            </div>
        </div>
    </div>
    <div class="dropdown border-start">

        <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-md">
            <!-- Row start -->
            <div class="d-flex gap-2 m-2 flex-wrap">
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-behance.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-google.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-bitcoin.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
                <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                    <img src="/assets/images/brand-dribbble.svg" class="img-3x"
                         alt="IT Dashboard Templates">
                </a>
            </div>
            <!-- Row end -->
            <div class="d-grid">
                <a href="javascript:void(0)" class="btn btn-primary m-2">View All</a>
            </div>
        </div>
    </div>
    <div class="dropdown border-start">
        <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
           data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fs-3 bi bi-bell"></i>
            <span class="count-label info"></span>
        </a>
        
    </div>
    <div class="dropdown border-start">
        <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
           data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fs-3 bi bi-chat"></i>
            <span class="count-label"></span>
        </a>
        
    </div>
    <div class="dropdown ms-2">
        <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
           href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <c:choose>
          <c:when test="${not empty sessionScope.profile}">
          	<img src="/api/imgView/${sessionScope.profile}" class="rounded-2 img-3x" alt="user">
          </c:when>
          <c:when test="${empty sessionScope.profile}">
          	<img src="/assets/user.png" class="rounded-2 img-3x" alt="user">
          </c:when>
          <c:when test="${empty sessionScope.loginId}">
          <img src="/assets/user.png" class="rounded-2 img-3x" alt="user">
          </c:when>
          </c:choose>
        </a>
        <div class="dropdown-menu dropdown-menu-end shadow-sm">
            <div class="p-3 border-bottom mb-2">
                <h6 class="mb-1">${sessionScope.emp_name}</h6>
                <p class="m-0 small opacity-50">${sessionScope.email}</p>
            </div>
            <a class="dropdown-item d-flex align-items-center" href="/mypage/profile.go"><i
                    class="bi bi-person fs-4 me-2"></i>프로필</a>
            
            <div class="d-grid p-3 py-2">
                <a class="btn btn-primary" href="/login/logout.do">로그아웃</a>
                <div class="mt-2"></div>
                <a id="getOff" class="btn btn-danger" onclick="getOff()">로그아웃 및 퇴근</a>
            </div>
        </div>
    </div>
</div>
<script>

var profile = '${sessionScope.profile}';


	function getOff(){
	
		location.href='/login/logoutAndGetOff.do';
	
	};








</script>
</html>
