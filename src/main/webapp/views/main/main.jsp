<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>

    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Bootstrap Gallery">
    <link rel="shortcut icon" href="assets/images/favicon.svg">

    <!-- *************
			************ CSS Files *************
		************* -->
    <link rel="stylesheet" href="assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/main.min.css">

    <!-- *************
			************ Vendor Css Files *************
		************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

    <!-- Toastify CSS -->
    <link rel="stylesheet" href="assets/vendor/toastify/toastify.css">

  </head>

  <body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

      <!-- Main container start -->
      <div class="main-container">

        <!-- Sidebar wrapper start -->
        <nav id="sidebar" class="sidebar-wrapper">

          <!-- App brand starts -->
          <div class="app-brand px-3 py-2 d-flex align-items-center">
            <a href="index.go">
              <img src="assets/images/logo.svg" class="logo" alt="Bootstrap Gallery">
            </a>
          </div>
          <!-- App brand ends -->

          <!-- Sidebar menu starts -->
          <div class="sidebarMenuScroll">
            <ul class="sidebar-menu">
              <li class="active current-page">
              </li>
              <li>
                <a href="notice/list.go">
                  <i class="fs-3 bi bi-pin-angle"></i>
                  <span class="menu-text">공지사항</span>
                </a>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-postcard"></i>
                  <span class="menu-text">마이페이지</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="mypage/detail.go">프로필</a>
                  </li>
                  <li>
                    <a href="mypage/vac/list.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="mypage/vacApply/list.go">연차 승인 및 반려</a>
                  </li>
                   <li>
                    <a href="attendance/myAttendance/list.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="mypage/alarm/list.go">알림</a>
                  </li>
                  
                </ul>
              </li>
               <li>
                <a href="chat/chat.go">
                  <i class="fs-3 bi bi-chat"></i>
                  <span class="menu-text">채팅</span>
                </a>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="fs-3 bi bi-envelope"></i>
                  <span class="menu-text">메일</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="mail/write.go">메일 작성</a>
                  </li>
                   <li>
                    <a href="mail/list.go">내가 보낸 메일함</a>
                  </li>
                </ul>
              </li>
              
              <li>
                <a href="calendar/calendar.go">
                  <i class="bi bi-calendar2"></i>
                  <span class="menu-text">일정 관리</span>
                </a>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-car-front"></i>
                  <span class="menu-text">택시 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="taxi/list.go">차량 관리</a>
                  </li>
                  <li>
                    <a href="driver/list.go">기사 관리</a>
                  </li>
                  <li>
                    <a href="triprecord/list.go">운행 기록 관리</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-layout-text-window-reverse"></i>
                  <span class="menu-text">전자결재</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="approval/write.go">기안서 작성</a>
                  </li>
                    <li>
                    <a href="approval/list.go">내 결재 관리</a>
                  </li>
                  <li>
                    <a href="approval/list.go">결재 통합 관리</a>
                  </li>
                  <li>
                    <a href="approval/create.go">공통 양식 등록</a>
                  </li>
                </ul>
              </li>
              
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-person"></i>
                  <span class="menu-text">인사 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="attendance/attendance/list.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="emp/emp/create.go">사원 등록</a>
                  </li>
                  <li>
                    <a href="emp/hremp/list.go">사원 조회</a>
                  </li>
                  <li>
                    <a href="emp/vac/list.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="emp/dept/list.go">부서 관리</a>
                  </li>
                  <li>
                    <a href="emp/sal/list.go">급여 관리</a>
                  </li>
                  <li>
                    <a href="emp/driver/list.go">기사 정산 관리</a>
                  </li>
                  <li>
                    <a href="emp/emp/list.go">사원 조회</a>
                  </li>
                </ul>
              </li>
               <li class="treeview">
                <a href="#!">
                  <i class="bi bi-pie-chart"></i>
                  <span class="menu-text">재무 관리</span>
                </a>
                <ul class="treeview-menu">
                  <li>
                    <a href="finance/profit/list.go">수익</a>
                  </li>
                  <li>
                    <a href="finance/expenses/list.go">지출</a>
                  </li>
                  <li>
                    <a href="finance/deal/list.go">거래 내역</a>
                  </li>
                   <li>
                    <a href="finance/dash.go">대쉬 보드</a>
                  </li>
                </ul>
              </li>
               <li class="treeview">
                <a href="#!">
                  <i class="bi bi-box"></i>
                  <span class="menu-text">자원 관리</span>
                </a>
                <ul class="treeview-menu">
                   <li>
                    <a href="resource/create.go">자원 등록</a>
                  </li>
                   <li>
                    <a href="resource/list.go">자원 예약</a>
                  </li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#!">
                  <i class="bi bi-terminal"></i>
                  <span class="menu-text">로그 관리</span>
                </a>
                <ul class="treeview-menu">
                   <li>
                    <a href="mail/admin/list.go">메일 로그</a>
                  </li>
                   <li>
                    <a href="chat/admin/list.go">채팅 로그</a>
                  </li>
                </ul>
              </li>
              
              
          <!-- Sidebar menu ends -->

        </nav>
        <!-- Sidebar wrapper end -->

        <!-- App container starts -->
        <div class="app-container">

          <!-- App header starts -->
          <div class="app-header d-flex align-items-center">

            <!-- Toggle buttons start -->
            <div class="d-flex">
              <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                <i class="bi bi-list fs-5"></i>
              </button>
              <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                <i class="bi bi-list fs-5"></i>
              </button>
            </div>
            <!-- Toggle buttons end -->

            <!-- App brand sm start -->
            <div class="app-brand-sm d-lg-none d-sm-block">
              <a href="index.go">
                <img src="assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="index.go" class="text-decoration-none">메인</a>
              </li>
            </ol>
            <!-- Breadcrumb end -->

            <!-- App header actions start -->
            <div class="header-actions">
              <div class="dropdown">
                
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-mini">
                  <div class="country-container">
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/us.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/in.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/br.svg" alt="Business Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/tr.svg" alt="IT Dashboard Templates">
                    </a>
                    <a href="index.go" class="py-2">
                      <img src="assets/images/flags/1x1/id.svg" alt="IT Dashboard Templates">
                    </a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                
                <div class="dropdown-menu dropdown-menu-end shadow-sm dropdown-menu-md">
                  <!-- Row start -->
                  <div class="d-flex gap-2 m-2 flex-wrap">
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-behance.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-google.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-bitcoin.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="assets/images/brand-dribbble.svg" class="img-3x" alt="IT Dashboard Templates">
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
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$35,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Revenue</span>
                        <span class="text-primary">+2%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 25%" aria-valuenow="25"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">$48,000</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Income</span>
                        <span class="text-primary">+7%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-flex flex-column p-3 mx-3 my-2 border">
                    <a href="javascript:void(0)" class="text-decoration-none">
                      <h3 class="mb-1">3400</h3>
                      <div class="mb-1 d-flex justify-content-between">
                        <span class="text-secondary">Sales</span>
                        <span class="text-danger">+3%</span>
                      </div>
                      <div class="progress small">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75"
                          aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </a>
                  </div>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown border-start">
                <a class="dropdown-toggle d-flex px-3 py-4 position-relative" href="#!" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="fs-3 bi bi-chat"></i>
                  <span class="count-label"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md shadow-sm">
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Stacy Macdonald</h5>
                        <p class="mb-1 text-secondary">
                          Got a new review. Congratulations!
                        </p>
                        <p class="small m-0 text-secondary">Today, 07:30pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user2.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Harriet Orozco</h5>
                        <p class="mb-1 text-secondary">
                          Happy Customer.
                        </p>
                        <p class="small m-0 text-secondary">Today, 08:00pm</p>
                      </div>
                    </div>
                  </a>
                  <a href="javascript:void(0)" class="dropdown-item">
                    <div class="d-flex py-2">
                      <img src="assets/images/user1.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
                      <div class="m-0">
                        <h5 class="mb-1">Grady Baxter</h5>
                        <p class="mb-1 text-secondary">
                          Grady wrote a new comment!
                        </p>
                        <p class="small m-0 text-secondary">Today, 09:30pm</p>
                      </div>
                    </div>
                  </a>
                  <div class="d-grid mx-3 my-3">
                    <a href="javascript:void(0)" class="btn btn-primary">View all</a>
                  </div>
                </div>
              </div>
              <div class="dropdown ms-2">
                <a id="userSettings" class="dropdown-toggle d-flex py-2 align-items-center text-decoration-none"
                  href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery">
                </a>
                <div class="dropdown-menu dropdown-menu-end shadow-sm">
                  <div class="p-3 border-bottom mb-2">
                    <h6 class="mb-1">Ella Lindsey</h6>
                    <p class="m-0 small opacity-50">info@testing.com</p>
                  </div>
                  <a class="dropdown-item d-flex align-items-center" href="profile.go"><i
                      class="bi bi-person fs-4 me-2"></i>Profile</a>
                  <a class="dropdown-item d-flex align-items-center" href="settings.go"><i
                      class="bi bi-gear fs-4 me-2"></i>Settings</a>
                  <div class="d-grid p-3 py-2">
                    <a class="btn btn-danger" href="login/logout.do">Logout</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- App header actions end -->

          </div>
          <!-- App header ends -->

          <!-- App body starts -->
          <div class="app-body">

            <!-- Container starts -->
            <div class="container-fluid">

              <!-- Row start -->
              <div class="row">
                <div class="col-xl-4 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-up-fill text-success me-1 fs-3"></i><span class="text-success me-2">8%
                            </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">7,500</h1>
                          <h6 class="m-0 fw-normal opacity-50">Trips</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-sm-6 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-up-fill text-success me-1 fs-3"></i><span
                              class="text-success me-2">23% </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">3,900</h1>
                          <h6 class="m-0 fw-normal opacity-50">Passengers</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
                  <div class="card mb-4">
                    <div class="card-body">
                      <div class="d-flex flex-row">
                        <div class="icon-box lg rounded-3 bg-light mb-4">
                          <i class="bi bi-car-front-fill text-primary fs-2"></i>
                        </div>
                        <div class="ms-4">
                          <p class="mb-2 lh-1 d-flex align-items-center">
                            <i class="bi bi-caret-down-fill text-danger me-1 fs-3"></i><span
                              class="text-danger me-2">18% </span> from
                            last week.
                          </p>
                          <h1 class="fw-bold mb-2">$9,300</h1>
                          <h6 class="m-0 fw-normal opacity-50">Earnings</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row">
                <div class="col-xxl-8 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Trips Overview</h4>
                    </div>
                    <div class="card-body">
                      <!-- Row start -->
                      <div class="row">
                        <div class="col-lg-4">
                          <div class="text-center">
                            <div class="text-center mb-3">
                              <p class="text-muted mb-1">This Month</p>
                              <div class="text-center">
                                <h2 class="mb-0">$86,990</h2>
                                <div class="badge bg-success mt-2">
                                  + 21.68%
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-bottom border-end p-3">
                                  <p class="text-muted mb-1">Booked</p>
                                  <h5 class="m-0">3,690</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="border-bottom p-3">
                                  <p class="text-muted mb-1">Trips</p>
                                  <h5 class="m-0">6065</h5>
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-bottom border-end p-3">
                                  <p class="text-muted mb-1">Growth</p>
                                  <h5 class="m-0">18.9%</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="border-bottom p-3">
                                  <p class="text-muted mb-1">Signups</p>
                                  <h5 class="m-0">560</h5>
                                </div>
                              </div>
                            </div>
                            <div class="row g-0">
                              <div class="col-sm-6">
                                <div class="border-end p-3">
                                  <p class="text-muted mb-1">Ratings</p>
                                  <h5 class="m-0">$9,984</h5>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="p-3">
                                  <p class="text-muted mb-1">Earnings</p>
                                  <h5 class="m-0">$6,443</h5>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-8">
                          <div id="overview"></div>
                        </div>
                      </div>
                      <!-- Row end -->
                    </div>
                  </div>
                </div>
                <div class="col-xxl-4 col-12">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h4 class="card-title">Passengers</h4>
                    </div>
                    <div class="card-body">
                      <div class="auto-align-graph">
                        <div id="reachedAudience"></div>
                      </div>
                      <div class="grid text-center">
                        <div class="g-col-4">
                          <i class="bi bi-caret-up-fill text-primary"></i>
                          <h3 class="m-0 mt-1">54%</h3>
                          <p class="text-secondary m-0">Male</p>
                        </div>
                        <div class="g-col-4">
                          <i class="bi bi-caret-up-fill text-primary"></i>
                          <h3 class="m-0 mt-1">36%</h3>
                          <p class="text-secondary m-0">Female</p>
                        </div>
                        <div class="g-col-4">
                          <i class="bi bi-caret-down-fill text-danger"></i>
                          <h3 class="m-0 mt-1">10%</h3>
                          <p class="text-secondary m-0">Other</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              

            </div>
            <!-- Container ends -->

          </div>
          <!-- App body ends -->

          <!-- App footer start -->
          <div class="app-footer">
            <span>Â© Bootstrap Gallery 2024</span>
          </div>
          <!-- App footer end -->

        </div>
        <!-- App container ends -->

      </div>
      <!-- Main container end -->

    </div>
    <!-- Page wrapper end -->

    <!-- *************
			************ JavaScript Files *************
		************* -->
    <!-- Required jQuery first, then Bootstrap Bundle JS -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- *************
			************ Vendor Js Files *************
		************* -->

    <!-- Overlay Scroll JS -->
    <script src="assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Toastify JS -->
    <script src="assets/vendor/toastify/toastify.js"></script>
    <script src="assets/vendor/toastify/custom.js"></script>

    <!-- Apex Charts -->
    <script src="assets/vendor/apex/apexcharts.min.js"></script>
    <script src="assets/vendor/apex/custom/home/overview.js"></script>
    <script src="assets/vendor/apex/custom/home/reachedAudience.js"></script>
    <script src="assets/vendor/apex/custom/home/social.js"></script>
    <script src="assets/vendor/apex/custom/home/sparkline.js"></script>
    <script src="assets/vendor/apex/custom/home/sparkline2.js"></script>
    <script src="assets/vendor/apex/custom/home/visitors.js"></script>

    <!-- Custom JS files -->
    <script src="assets/js/custom.js"></script>
  </body>

</html>