<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<!-- Meta -->
<meta name="description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta name="author" content="Bootstrap Gallery">
<link rel="canonical" href="https://www.bootstrap.gallery/">
<meta property="og:url" content="https://www.bootstrap.gallery">
<meta property="og:title"
	content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
<meta property="og:description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta property="og:type" content="Website">
<meta property="og:site_name" content="Bootstrap Gallery">
<link rel="shortcut icon" href="/assets/images/favicon.svg">
<!-- *************
            ************ CSS Files *************
        ************* -->
<link rel="stylesheet"
	href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- *************
            ************ Vendor Css Files *************
        ************ -->

<!-- Scrollbar CSS -->
<link rel="stylesheet"
	href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

<!-- Date Range CSS -->
<link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<!-- FontAwesome 추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
th.sortable {
	position: relative;
	cursor: pointer;
}

th.sortable::after {
	content: '\f0dc'; /* FontAwesome 기본 sort 아이콘 */
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
	position: absolute;
	right: 8px;
	opacity: 0;
	transition: opacity 0.3s;
}

th.sortable:hover::after {
	opacity: 0.3; /* 흐릿하게 설정 */
}

th.sortable.asc::after {
	content: '\f0de'; /* FontAwesome sort up 아이콘 */
	opacity: 1;
}

th.sortable.desc::after {
	content: '\f0dd'; /* FontAwesome sort down 아이콘 */
	opacity: 1;
}
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
.button-position{
	margin-left: 346px;
}
.chk{
	margin-bottom: 4px;
}

</style>


</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="/views/sidebar.jsp" />
			<!-- Sidebar wrapper end -->

			<!-- App container starts -->
			<div class="app-container">

				<!-- App header starts -->

				<div class="app-header d-flex align-items-center">

					<!-- Toggle buttons start -->
					<div class="d-flex">
						<button class="btn btn-outline-primary me-2 toggle-sidebar"
							id="toggle-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
						<button class="btn btn-outline-primary me-2 pin-sidebar"
							id="pin-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
					</div>
					<!-- Toggle buttons end -->

					<!-- App brand sm start -->
					<div class="app-brand-sm d-lg-none d-sm-block">
						<a href="/"> <img src="/assets/images/logo-sm.svg"
							class="logo" alt="Bootstrap Gallery">
						</a>
					</div>
					<!-- App brand sm end -->

					<!-- Breadcrumb start -->
					<ol class="breadcrumb d-none d-lg-flex ms-3">
						<li class="breadcrumb-item"><a href="/"><i
								class="bi bi-house lh-1"></i></a> <a href="/"
							class="text-decoration-none">메인</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">인사 관리</a></li>
						<li class="breadcrumb-item"><a href="/emp/vac/list.go"
							class="text-decoration-none">연차 관리</a></li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
					<!-- App header actions end -->

				</div>

				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">

					<!-- Container starts -->
					<div class="container-fluid">
						<!-- Alert placeholder start -->
						<div id="alertPlaceholder"></div>
						<!-- Alert placeholder end -->
						<!-- Row start -->
						<div class="row">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h4 class="card-title">연차 관리</h4>
									</div>
									<div class="card-body">
										<!-- 여기에 코딩 -->
										<!-- 검색창 시작 -->
										<div class="search-filter-container border border-2 p-3 rounded mb-3">
										 <div class="row mb-3">
                                            <div class="col-10">
                                            </div>
                                            <div class="col-2 text-end d-md-flex justify-content-md-end gap-2">
													<input type="button" class="btn btn-secondary resetPosition"
														onclick="filterReset()" value="초기화"> <input
														type="button" class="btn btn-primary" onclick="getList()"
														value="검색" style="display: none">
												</div>
											<div class="row">
												<div class="col-4"></div>
												<div class="col-2"></div>
												<div class="col-2">
												
													<label for="filter-emp" class="form-label">사원 검색</label>
												</div>
												<div class="col-2"></div>
												<div class="col-1">
													
														
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-6"></div>
												<div class="col-1">
													<select id="filterforsearch"
														class="form-select emp-search-filter">
														<option value="emp_no">사번</option>
														<option value="emp_name">이름</option>
													</select>
												</div>
												<div class="col-3 text-end">
													<input type="text"
														class="form-control emp-search-filter bg-" id="search-emp"
														placeholder="검색어를 입력해주세요.">
												</div>
												<div class="col-2">
													<input type="button" class="btn btn-primary resetPosition"
														onclick="" value="연차 지급">
														<input type="button" class="btn btn-secondary resetPosition"
														onclick="" value="연차 수정"> 
												</div>
											</div>
										</div>
										<!-- 검색창 종료 -->
										<!-- 리스트 테이블 시작 -->
										<div class="table-outer">
											<div class="table-responsive">
												<table class="table align-middle table-hover m-0">
													<thead>
														<tr>
														<th class="text-center" id="th-emp-no"
																style="width: 10%;" ><input class="form-check-input chk" type="checkbox"  id="allCheck"></th>
															<th class="text-center" id="th-emp-no"
																style="width: 10%;" >사번</th>
																<th class="text-center" id="th-emp-no"
																style="width: 10%;" >이름</th>
															<th class="text-center" id="th-emp-name"
																style="width: 10%;" >근속년수</th>
															<th class="text-center" id="th-title-name"
																style="width: 20%;" >지급 연차</th>
															<th class="text-center" id="th-dept-name"
																style="width: 20%;" >잔여 연차</th>
														</tr>
													</thead>
													<tbody id="vac-list">
													</tbody>
												</table>
											</div>
										</div>

										<!-- 리스트 테이블 종료 -->
										<!-- 페이지 네이션 시작 -->
										<nav aria-label="Page navigation example" class="mt-3">
											<ul class="pagination justify-content-center" id="pagination"></ul>
										</nav>
										<!-- 페이지 네이션 종료 -->
									</div>
								</div>
							</div>
						</div>
						

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

</body>
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
<script
	src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>

<script>
    var searchText = '';
    var filterforsearch = '';
    var currentPage = 1; // 현재 페이지 번호

    
    

    getVacTotalPages();
    getList();

   
    $('#search-emp').on('change', function(){
    	currentPage = 1;
    	getVacTotalPages();
        getList();
    });

   
    $('.emp-search-filter').on('input', function () {
        currentPage = 1;
        getVacTotalPages();
        getList();
    });


    // 필터 값 리셋
    function filterReset() {
        $('#search-emp').val('');
        $('#filterforsearch').val('');
        currentPage = 1; // 페이지 번호 초기화
        getVacTotalPages();
        getList(); // 목록 새로고침
    }

    // 사원리스트 호출
    function getList() {
        getSearchValue();
        $.ajax({
            url: '/vacList.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterForSearch': filterForSearch,
                'page': currentPage
            },
            dataType: 'JSON',
            success: function (data) {
                drawList(data.empList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    // 토탈 페이지 호출
    function getVacTotalPages() {
        getSearchValue();
        $.ajax({
            url: '/getVacTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterForsearch': filterForSearch
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                    visiblePages: 5,
                    startPage: currentPage,
                    paginationClass: 'pagination align-items-center',
                    onPageClick: function (event, page) {
                        currentPage = page;
                        getList();
                    }
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
    
    

    // 리스트 보여주기
    function drawList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
            	
                console.log('근속년수?'+item.work_yaer);
                content += '<tr class="emp-list-tbody-tr" id="' + item.emp_no + '">'
               		+ '<td class="text-center">' + '<input class="form-check-input chk" type="checkbox"  id="check">' + '</td>'
                	+ '<td class="text-center">' + item.emp_no + '</td>'
                	+ '<td class="text-center">' + item.emp_name + '</td>'
                    + '<td class="text-center">' + item.work_year + '</td>'
                    + '<td class="text-center">' + item.vac_add + '</td>'
                    + '<td class="text-center">' + item.vac_left + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#vac-list').html(content);
    }
    
    $(document).on('click', '.emp-list-tbody-tr', function () {
        
    });
    
    $('#allCheck').on('click', function(){
    	
    	if ($('#allCheck').prop("checked")) {
			$('.chk').prop("checked", true);
		}else{
			$('.chk').prop("checked", false);
		}
    	
    	
    });
    

    // 검색 값들 변수에 저장
    function getSearchValue() {
       
		filterForSearch = $('#filterforsearch').val();
        searchText = $('#search-emp').val();
    }
    
    
    
    
   
</script>
</html>
