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
  .alert-placeholder {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1050;
            margin: 0;
            padding: 10px;
            text-align: center;
        }
  .input-size{
  	width: 755px;
  }
  .fixed-size {
    width: 150px;
    height: 33.8px;
    flex: 1 1 auto; /* flex 속성을 이용하여 크기를 조절 */
    margin-right: 1px;
  }
  .fixed-size2{
  	width: 35px;
  	height: 33.8px;
  	margin-left: 0.7px;
    margin-right: 0.5px;
  }
  .fixed-size3{
  	width: 180px;
  	height: 33.8px;
  }
  .fixed-size4{
  	width: 120px;
  	height: 33.8px;
  
  }
  .fixed-size5{
  	width: 600px;
  	height: 80px;
  }
  .fixed-size6{
  	width: 620px;
  }
   .fixed-size7{
  	position: fixed;
  	margin-top: 398px;
  }
   .fixed-size8{
  	margin-left: -15px;
  }
  .form-size1	{
  	width: 790px;
  }
  .form-size2 {
  	left: 152px;
  	width: 600;
  }
  .button-size{
  	left: 16px;
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
                <a href="/notice/list.go">
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
                    <a href="/mypage/detail.go">프로필</a>
                  </li>
                  <li>
                    <a href="/mypage/vac/list.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="/mypage/vacApply/list.go">연차 승인 및 반려</a>
                  </li>
                   <li>
                    <a href="/attendance/myAttendance/list.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="/mypage/alarm/list.go">알림</a>
                  </li>
                  
                </ul>
              </li>
               <li>
                <a href="/chat/chat.go">
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
                    <a href="/mail/write.go">메일 작성</a>
                  </li>
                   <li>
                    <a href="/mail/list.go">내가 보낸 메일함</a>
                  </li>
                </ul>
              </li>
              
              <li>
                <a href="/calendar/calendar.go">
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
                    <a href="/taxi/list.go">차량 관리</a>
                  </li>
                  <li>
                    <a href="/driver/list.go">기사 관리</a>
                  </li>
                  <li>
                    <a href="/triprecord/list.go">운행 기록 관리</a>
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
                    <a href="/approval/write.go">기안서 작성</a>
                  </li>
                    <li>
                    <a href="/approval/list.go">내 결재 관리</a>
                  </li>
                  <li>
                    <a href="/approval/list.go">결재 통합 관리</a>
                  </li>
                  <li>
                    <a href="/approval/create.go">공통 양식 등록</a>
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
                    <a href="/attendance/attendance/list.go">근태 관리</a>
                  </li>
                  <li>
                    <a href="/emp/emp/create.go">사원 등록</a>
                  </li>
                  <li>
                    <a href="/emp/hremp/list.go">사원 조회</a>
                  </li>
                  <li>
                    <a href="/emp/vac/list.go">연차 관리</a>
                  </li>
                  <li>
                    <a href="/emp/dept/list.go">부서 관리</a>
                  </li>
                  <li>
                    <a href="/emp/sal/list.go">급여 관리</a>
                  </li>
                  <li>
                    <a href="/emp/driver/list.go">기사 정산 관리</a>
                  </li>
                  <li>
                    <a href="/emp/orgchart/list.go">조직도</a>
                  </li>
                  <li>
                    <a href="/emp/emp/list.go">사원 조회</a>
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
                    <a href="/finance/profit/list.go">수익</a>
                  </li>
                  <li>
                    <a href="/finance/expenses/list.go">지출</a>
                  </li>
                  <li>
                    <a href="/finance/deal/list.go">거래 내역</a>
                  </li>
                   <li>
                    <a href="/finance/dash.go">대쉬 보드</a>
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
                    <a href="/resource/create.go">자원 등록</a>
                  </li>
                   <li>
                    <a href="/resource/list.go">자원 예약</a>
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
                    <a href="/mail/admin/list.go">메일 로그</a>
                  </li>
                   <li>
                    <a href="/chat/admin/list.go">채팅 로그</a>
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
              <a href="/">
                <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
              </a>
            </div>
            <!-- App brand sm end -->

            <!-- Breadcrumb start -->
            <ol class="breadcrumb d-none d-lg-flex ms-3">
              <li class="breadcrumb-item">
                <i class="bi bi-house lh-1"></i>
                <a href="/" class="text-decoration-none">메인</a>
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
                      <img src="/assets/images/brand-behance.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-google.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-bitcoin.svg" class="img-3x" alt="IT Dashboard Templates">
                    </a>
                    <a href="javascript:void(0)" class="g-col-4 p-2 border rounded-2">
                      <img src="/assets/images/brand-dribbble.svg" class="img-3x" alt="IT Dashboard Templates">
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
                      <img src="/assets/images/user.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                      <img src="/assets/images/user2.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                      <img src="/assets/images/user1.png" class="img-3x me-3 rounded-3" alt="Admin Templates">
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
                    <a class="btn btn-danger" href="/login/logout.do">Logout</a>
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
            	<!-- Alert placeholder start -->
					<div id="alertPlaceholder" class="alert-placeholder"></div>
				<!-- Alert placeholder end -->
			
              <!-- Row start -->
              
              <div class="row gx-3">
              
                <div class="col-xxl-12">
                  <div class="card mb-3">
                  
                    <div class="card-body">
                      <form class="row g-3 needs-validation" action="/emp/join.do" method="post" onsubmit="return validateForm()" novalidate>
                      <h2>사원 정보</h2>
                        <div class="col-6 position-relative">
                          <label for="validationTooltip01" class="form-label">사번 (부서를 선택하면 자동 생성됩니다.)</label>
                          <input type="text" class="form-control" name="emp_no" id="emp_no" value="" required readonly />
 
                        </div>
                       
                        <div class="col-6 position-relative">
                          <label for="validationTooltip04" class="form-label">은행명</label>
                          <select class="form-select" id="validationTooltip04" name="bank_name" required>
                            <option selected disabled value="">
                              은행 선택
                            </option>
                            <option value="국민은행">국민은행</option>
                            <option value="신한은행">신한은행</option>
                            <option value="우리은행">우리은행</option>
                            <option value="하나은행">하나은행</option>
                            <option value="카카오뱅크">카카오뱅크</option>
                            <option value="토스뱅크">토스뱅크</option>
                            <option value="케이뱅크">케이뱅크</option>
                          </select>
                          <div class="invalid-feedback">
                            은행을 선택 해주세요.
                          </div>
                        </div>
                        
                        <div class="col-6 position-relative">
                          <label for="validationTooltip02" class="form-label">이름</label>
                          <input type="text" class="form-control" id="emp_name" name="emp_name" value="" required pattern="^[가-힣]+$" minlength="2" />
                          <div class="invalid-feedback" id="name_check">이름은 한글로만 최소 2자 이상 입력해주세요.</div>
                        </div>
                        
                         <div class="col-6 position-relative">
                          <label for="validationTooltip02" class="form-label">예금주 (이름과 동일하게 입력됩니다.)</label>
                          <input type="text" class="form-control" id="acc_name" name="acc_name" value="" required readonly/>
                        </div>
                        
                        <div class="col-6 position-relative">
                          <label for="validationTooltip04" class="form-label">부서</label>
                          <select class="form-select" id="validationTooltip04" name="dept_no" required>
                            <option selected disabled value="">
                              부서 선택
                            </option>
                            <option value="1">인사부</option>
                            <option value="2">영업부</option>
                            <option value="3">영업지원부</option>
                            <option value="4">택시관리부</option>
                          </select>
                          <div class="invalid-feedback">
                            부서를 선택 해주세요.
                          </div>
                        </div>
                        
                        
                        <div class="col-6 position-relative">
                          <label for="validationTooltip02" class="form-label">계좌번호</label>
                          <input type="text" class="form-control" id="validationTooltip02" name="acc_no" value="" required pattern="^[0-9]{12,14}$" minlength="12" maxlength="14" />
                          <div class="invalid-feedback">숫자로만 최소 12자 이상, 최대 14자 미만 입력해주세요. </div>
                        </div>
                        
                        
                        <div class="col-6 position-relative">
                          <label for="validationTooltip04" class="form-label">직급</label>
                          <select class="form-select" id="validationTooltip04" name="title_no" required>
                            <option selected disabled value="">
                              직급 선택
                            </option>
                            <option value="1">대표이사</option>
                            <option value="2">부장</option>
                            <option value="3">과장</option>
                            <option value="4">대리</option>
                            <option value="5">사원</option>
                          </select>
                          <div class="invalid-feedback">
                            직급을 선택 해주세요.
                          </div>
                        </div>
                        
                        <div class="col-6 position-relative">
                          <label for="validationTooltip04" class="form-label">권한</label>
                          <select class="form-select" id="validationTooltip04" name="emp_level" required>
                            <option selected disabled value="">
                              권한 레벨 선택
                            </option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                          </select>
                          <div class="invalid-feedback">
                            레벨을 선택 해주세요.
                          </div>
                        </div>
                   
                  <div class="fixed-size8">
                   
                    <div class="col-6 card-body fixed-size5" >
                    <label for="validationTooltip04" class="form-label">이메일</label>
                    <div class="input-group form-size2">
                    	<div>
                        <input type="text" class="form-control fixed-size" placeholder="이메일" name="email_id" required pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$" minlength="2">
                        <div class="invalid-feedback">&nbsp;이메일을 입력해주세요.</div>
                        </div>
                        <span class="input-group-text fixed-size2">@</span>
                        <div>
                        <input type="text" class="form-control fixed-size3"  id="domain-input" placeholder="도메인" name="domain" required pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$" minlength="2">
                        <div class="invalid-feedback">&nbsp;도메인을 올바른 형식으로 입력해주세요.</div>
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
                        <div>
                        <button type="button" class="btn btn-primary button-size" onclick="overlay()">중복확인</button>
                        </div>
                       
                    </div>
                  </div>
                </div>
                
                      <div class="mt-2"></div>
                        <div class="position-relative form-size1">
                          <label for="validationTooltipUsername" class="form-label">주소</label>
                          <div class="input-size input-group has-validation">
                            <input type="text" class="form-control" id="emp_roadAdd"
                              aria-describedby="validationTooltipUsernamePrepend" name="emp_roadAdd" required readonly/>
                              &nbsp;&nbsp;
                              <input type="text" class="form-control" id="emp_addDetail"
                              aria-describedby="validationTooltipUsernamePrepend" name="emp_addDetail" placeholder="상세주소"/>
                              <button type="button" class="btn btn-primary button-size" onclick="searchAdd()">주소 검색</button>
                            <div class="invalid-feedback">
                              주소를 입력해주세요.
                            </div>
                          </div>
                        </div>
                        
                         <div class="mt-2"></div>
                        <div class="position-relative form-size1">
                          <label for="validationTooltipUsername" class="form-label">생일</label>
                          <div class="input-group has-validation">
                            <input type="date" class="form-control" id="validationTooltipUsername"
                              aria-describedby="validationTooltipUsernamePrepend" name="emp_bday" required />
                            <div class="invalid-feedback">
                              생일을 입력해주세요.
                            </div>
                          </div>
                        </div>
                        
                         <div class="position-relative form-size1">
                          <label for="validationTooltipUsername" class="form-label">내선번호</label>
                          <div class="input-group has-validation">
                            <input type="text" class="form-control" id="validationTooltipUsername"
                              aria-describedby="validationTooltipUsernamePrepend" name="emp_extension_number" required pattern="^070([0-9]{7,8})$">
                            <div class="invalid-feedback">
                              내선번호는 070으로 시작하는 숫자로만 입력해주세요.
                            </div>
                          </div>
                        </div>
                        
                        <div class="mt-2"></div>
                        
                        <div class="col-12 ">
                        <div class="position-absolute bottom-0 end-0 mb-3 mx-3">
                          <button class="btn btn-primary" type="submit">
                            사원 등록
                          </button>
                        </div>
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
                <span>GDJ78FINALPROJECTMYCAB</span>
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

	<!-- 다음 주소 api  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
    <!-- *************
			************ Vendor Js Files *************
		************* -->

    <!-- Overlay Scroll JS -->
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/validations.js"></script>
    <script src="/assets/js/localStorage.js"></script>
    <script src="/assets/js/showAlert.js"></script>
  </body>
  <script>
  document.getElementById('domain-select').addEventListener('change', function() {
      var selectedDomain = this.value;
      var domainInput = document.getElementById('domain-input');
      domainInput.value = selectedDomain;
      
    });//이메일 입력 스크립트
  
    var message = "${message}";
    if (message) {
        alert(message);
    }
    
    $(document).ready(function(){
    	
    	$('select[name="dept_no"]').change(function(){
    		var deptNo = $(this).val();
    		
    		$.ajax({
    			type:'post', // method 방식
    			url:'./getNextEmpNo.ajax', // 요청한 주소
    			data:{'deptNo':deptNo}, // 파라메터
    			success:function(data){ // 통신 성공했을경우
    			//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
    			//여기에 뿌려준다
    				console.log(data);
    				console.log(data.nextEmpNo);
    				$('#emp_no').val(data.nextEmpNo);
    			}, 
    			error:function(error){ // 통신 실패 시
    				console.log(error);
    			} 
    		});
    		
    		
    	});
    		
    });
    
    
    var overChk = false;
    
    function overlay() {//이메일 중복 체크
		console.log('click');
		
		var email_id = $('input[name="email_id"]').val();
		var domain = $('input[name="domain"]').val();
		
		if (email_id === '' || domain === '') {
			
			showAlert('danger', '이메일 또는 도메인을 입력해주세요.');
			
		}else{
			
			var email = email_id +'@'+ domain;
			
		$.ajax({
			type:'post', // method 방식
			url:'./emailOverlay.ajax', // 요청한 주소
			data:{'email':email}, // 파라메터
			success:function(data){ // 통신 성공했을경우
			//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
			//여기에 뿌려준다
				console.log(data);
				if(data.use > 0){
					showAlert('danger', '이미 사용중인 이메일입니다.');
					$('input[name="email_id"]').val('');
					$('input[name="domain"]').val('');
				}else{
					showAlert('success', '사용 가능한 이메일입니다.');
					overChk = true;
				}
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
			
		}
	}
    
 //이름을 예금주명에 넣기
 
 var emp_name = $('input[name="emp_name"]').val();
 var acc_name = $('input[name="acc_name"]').val();
 
 document.getElementById('emp_name').addEventListener('keyup', function() {
	 console.log(this.value);
     var emp_name = this.value;
     var acc_name = document.getElementById('acc_name');
     acc_name.value = emp_name;
     
   });
 
 
 //우편검색
 
 function searchAdd(){
	 new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var roadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("emp_roadAdd").value = roadAddr;
            
             
         }
     }).open();
	 
 }
 
 
 
 
 
 // 폼 전송 시 overChk 확인
 function validateForm() {
     if (!overChk) {
    	 showAlert('danger', '이메일 중복을 확인해주세요.');
         return false; // 폼 전송 취소
     }else{
    	 if (confirm("사원을 등록하시겠습니까?")) {
     		return true; // 폼 전송 허용
		}else{
			showAlert('danger', '사원 등록을 취소했습니다.');
		}
     }
 }
 
 
 
 
  
  
  </script>

</html>