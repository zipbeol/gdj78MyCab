<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Gallery - My Cab Bootstrap 5 Dashboard</title>

    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Bootstrap Gallery">
    <link rel="shortcut icon" href="/assets/images/favicon.svg">

    <!-- *************
			************ CSS Files *************
		************* -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">

    <!-- *************
			************ Vendor Css Files *************
		************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">
  </head>
  <style>
  .fixed-size {
    width: 150px;
    height: 40px;
    flex: 1 1 auto; /* flex 속성을 이용하여 크기를 조절 */
    margin-right: 1px;
  }
  .fixed-size2{
  	width: 35px;
  	height: 40px;
  	margin-left: 0.7px;
    margin-right: 0.5px;
  }
  .fixed-size3{
  	width: 180px;
  	height: 40px;
  }
  .fixed-size4{
  	width: 100px;
  	height: 40px;
  
  }
  .fixed-size5{
  	width: 600px;
  	height: 80px;
  }
  .fixed-size6{
  	width: 620px;
  }
  
</style>
  <body>
    <!-- Page wrapper start -->
    <div class="page-wrapper">

      <!-- Main container start -->
      <div class="main-container">

        <!-- Sidebar wrapper start -->
        <nav id="sidebar" class="sidebar-wrapper">

          <!-- App brand starts -->
          <div class="app-brand px-3 py-2 d-flex align-items-center">
            <a href="/">
              <img src="/assets/images/logo.svg" class="logo" alt="Bootstrap Gallery">
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
                    <a href="/emp/emp/create.go">사원 등록</a>
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
                    <a href="emp/orgchart/list.go">조직도</a>
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
                <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="index.go" class="text-decoration-none">메인</a>
              </li>
              <li class="breadcrumb-item">인사 관리</li>
              <li class="breadcrumb-item text-secondary">사원 등록</li>
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
                  <img src="/assets/images/user.png" class="rounded-2 img-3x" alt="Bootstrap Gallery">
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
              <div class="row gx-3">
                <div class="col-xxl-4 col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="was-validated">
                        <label for="validationCustom01" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="validationCustom01" value="Mark" required="">
                        <div class="valid-feedback">Looks good!</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xxl-4 col-lg-6 col-sm-12 col-12 fixed-size6">
                  <div class="card mb-3">
                    <div class="card-body fixed-size5" >
                    <div class="input-group">
                    	<div class="was-validated">
                        <input type="text" class="form-control fixed-size" placeholder="이메일" required="">
                        <div class="invalid-feedback">&nbsp;이메일을 입력해주세요.</div>
                        </div>
                        <span class="input-group-text fixed-size2">@</span>
                        <div class="was-validated">
                        <input type="text" class="form-control fixed-size3"  id="domain-input" placeholder="도메인" required="">
                        <div class="invalid-feedback">&nbsp;도메인을 입력해주세요.</div>
                      </div>
                      &nbsp;&nbsp;
                        <select id="domain-select" class="form-select fixed-size4">
                        <option value="">직접 입력</option>
                        <option value="naver.com">naver.com</option>
          				<option value="gmail.com">gmail.com</option>
          				<option value="daum.net">daum.net</option>
          				<option value="kakao.com">kakao.com</option>
          				<option value="nate.com">nate.com</option>
                        </select>
                        </div>
                    </div>
                  </div>
                </div>
                
                
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="was-validated">
                        <label for="validationTextarea" class="form-label">Textarea</label>
                        <textarea class="form-control is-invalid" id="validationTextarea"
                          placeholder="Required example textarea" required=""></textarea>
                        <div class="invalid-feedback">
                          Please enter a message in the textarea.
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="was-validated">
                        <label for="validationTextarea2" class="form-label">Textarea</label>
                        <textarea class="form-control" id="validationTextarea2"
                          placeholder="Required example textarea"></textarea>
                        <div class="valid-feedback">Looks good!</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="was-validated">
                        <input type="file" class="form-control" aria-label="file example" required="">
                        <div class="invalid-feedback">
                          Example invalid form file feedback
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="was-validated">
                        <input type="file" class="form-control" aria-label="file example">
                        <div class="valid-feedback">Looks good!</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="form-check was-validated">
                        <input type="checkbox" class="form-check-input" id="validationFormCheck1" required="">
                        <label class="form-check-label" for="validationFormCheck1">Check this checkbox</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="form-check was-validated">
                        <input type="checkbox" class="form-check-input" id="validationFormCheck2">
                        <label class="form-check-label" for="validationFormCheck2">Check this checkbox</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="form-check was-validated">
                        <input type="radio" class="form-check-input" id="validationFormCheck3" name="radio-stacked"
                          required="">
                        <label class="form-check-label" for="validationFormCheck3">Toggle this radio</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 col-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="form-check was-validated">
                        <input type="radio" class="form-check-input" id="validationFormCheck4" name="radio-stacked2">
                        <label class="form-check-label" for="validationFormCheck4">Toggle this radio</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row gx-3">
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <form class="row g-3 needs-validation" novalidate>
                        <div class="col-md-4">
                          <label for="validationCustom01" class="form-label">First name</label>
                          <input type="text" class="form-control" id="validationCustom01" value="Mark" required />
                          <div class="valid-feedback">Looks good!</div>
                        </div>
                        <div class="col-md-4">
                          <label for="validationCustom02" class="form-label">Last name</label>
                          <input type="text" class="form-control" id="validationCustom02" value="Otto" required />
                          <div class="valid-feedback">Looks good!</div>
                        </div>
                        <div class="col-md-4">
                          <label for="validationCustomUsername" class="form-label">Username</label>
                          <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                            <input type="text" class="form-control" id="validationCustomUsername"
                              aria-describedby="inputGroupPrepend" required />
                            <div class="invalid-feedback">
                              Please choose a username.
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <label for="validationCustom03" class="form-label">City</label>
                          <input type="text" class="form-control" id="validationCustom03" required />
                          <div class="invalid-feedback">
                            Please provide a valid city.
                          </div>
                        </div>
                        <div class="col-md-3">
                          <label for="validationCustom04" class="form-label">State</label>
                          <select class="form-select" id="validationCustom04" required>
                            <option selected disabled value="">
                              Choose...
                            </option>
                            <option>...</option>
                          </select>
                          <div class="invalid-feedback">
                            Please select a valid state.
                          </div>
                        </div>
                        <div class="col-md-3">
                          <label for="validationCustom05" class="form-label">Zip</label>
                          <input type="text" class="form-control" id="validationCustom05" required />
                          <div class="invalid-feedback">
                            Please provide a valid zip.
                          </div>
                        </div>
                        <div class="col-12">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required />
                            <label class="form-check-label" for="invalidCheck">
                              Agree to terms and conditions
                            </label>
                            <div class="invalid-feedback">
                              You must agree before submitting.
                            </div>
                          </div>
                        </div>
                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">
                            Submit form
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Row end -->

              <!-- Row start -->
              <div class="row gx-3">
                <div class="col-xxl-12">
                  <div class="card mb-3">
                    <div class="card-body">
                      <form class="row g-3 needs-validation" novalidate>
                        <div class="col-md-4 position-relative">
                          <label for="validationTooltip01" class="form-label">First name</label>
                          <input type="text" class="form-control" id="validationTooltip01" value="Mark" required />
                          <div class="valid-tooltip">Looks good!</div>
                        </div>
                        <div class="col-md-4 position-relative">
                          <label for="validationTooltip02" class="form-label">Last name</label>
                          <input type="text" class="form-control" id="validationTooltip02" value="Otto" required />
                          <div class="valid-tooltip">Looks good!</div>
                        </div>
                        <div class="col-md-4 position-relative">
                          <label for="validationTooltipUsername" class="form-label">Username</label>
                          <div class="input-group has-validation">
                            <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                            <input type="text" class="form-control" id="validationTooltipUsername"
                              aria-describedby="validationTooltipUsernamePrepend" required />
                            <div class="invalid-tooltip">
                              Please choose a unique and valid username.
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6 position-relative">
                          <label for="validationTooltip03" class="form-label">City</label>
                          <input type="text" class="form-control" id="validationTooltip03" required />
                          <div class="invalid-tooltip">
                            Please provide a valid city.
                          </div>
                        </div>
                        <div class="col-md-3 position-relative">
                          <label for="validationTooltip04" class="form-label">State</label>
                          <select class="form-select" id="validationTooltip04" required>
                            <option selected disabled value="">
                              Choose...
                            </option>
                            <option>...</option>
                          </select>
                          <div class="invalid-tooltip">
                            Please select a valid state.
                          </div>
                        </div>
                        <div class="col-md-3 position-relative">
                          <label for="validationTooltip05" class="form-label">Zip</label>
                          <input type="text" class="form-control" id="validationTooltip05" required />
                          <div class="invalid-tooltip">
                            Please provide a valid zip.
                          </div>
                        </div>
                        <div class="col-12">
                          <button class="btn btn-primary" type="submit">
                            Submit form
                          </button>
                        </div>
                      </form>
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
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- *************
			************ Vendor Js Files *************
		************* -->

    <!-- Overlay Scroll JS -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/validations.js"></script>
  </body>
  <script>
  	document.getElementById('domain-select').addEventListener('change', function() {
	    var selectedDomain = this.value;
	    document.getElementById('domain-input').value = selectedDomain;
	  }); //이메일 도메인 입력 스크립트
  
  
  
  
  
  </script>

</html>