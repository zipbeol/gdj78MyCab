<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Finance Expenses</title>
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

<!-- CSS Files -->
<link rel="stylesheet"
	href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- Vendor Css Files -->
<link rel="stylesheet"
	href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<style>
.detail-row {
	display: none;
	transition: all 0.3s ease;
}

.detail-row.active {
	display: table-row;
}


/* 리셋 버튼 스타일 */
.reset-btn {
	background-color: #dc3545;
	color: #fff;
	border-color: #dc3545;
}

/* 리셋 버튼 호버 효과 */
.reset-btn:hover {
	background-color: #c82333;
	border-color: #bd2130;
}

td:hover {
	cursor: pointer;
}

.custom-table {
    width: 100%;
    table-layout: fixed; /* 테이블 너비 고정 */
}

.custom-table th,
.custom-table td {
    text-align: center; /* 텍스트 가운데 정렬 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    word-wrap: break-word; /* 텍스트 줄바꿈 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.custom-table thead th {
    background-color: #f8f9fa;
    font-weight: bold;
}

.custom-table tbody tr:hover {
    background-color: #e9ecef;
}

.custom-table .detail-row {
    background-color: #f1f1f1;
}
</style>
</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="../sidebar.jsp" />
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
						<li class="breadcrumb-item"><a href="#!"
							class="text-decoration-none">재무 관리</a></li>
						<li class="breadcrumb-item"><a
							href="/finance/expenses/list.go" class="text-decoration-none">지출</a>
						</li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="../appHeader.jsp" />
					<!-- App header actions end -->

				</div>
				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">
					<!-- Container starts -->
					<div class="container-fluid">
					
						<!-- Row start -->
						<div class="row">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h4 class="card-title">지출</h4>
									</div>
									<div class="card-body">
										<!-- 검색창 시작 -->
										<div class="border border-2 p-3 rounded mb-3">
											<div class="row mb-3">
                                                <div class="col-md-8 offset-md-4"></div>
                                            </div>
											<!-- 날짜 필터링 입력 -->
											<div class="row mb-3">
												<div class="col-2">
													<label for="startDate" class="form-label">시작 날짜</label>
                                                    <input type="date" id="startDate" class="form-control">
												</div>
												<div class="col-2">
                                                    <label for="endDate" class="form-label">종료 날짜</label>
                                                    <input type="date" id="endDate" class="form-control">
                                                </div>
												<div class="col-2">
													<label for="filter" class="form-label">정렬</label>
													<select id="filter" name="filter" class="form-select">
														<option value="" selected disabled>필터 선택</option>
														<option value="orderByName">이름 순</option>
														<option value="manyExpenses">많은 지출 순</option>
														<option value="lessExpenses">적은 지출 순</option>
													</select>
												</div>
												<div class="col-4"></div>
												<div class="col-2">
													<label for="searchQuery" class="form-label">검색</label>
													<div class="input-group">
														<input type="text" id="searchQuery"  class="form-control" placeholder="검색 내용을 입력하세요.">
														<button id="go" class="btn btn-outline-info">찾기</button>
													</div>
												</div>
											</div>
										</div>
										
										<div class="d-flex align-items-center mb-2">
										<button class="btn btn-secondary me-2" onclick="resetFilters()">초기화</button>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-primary filter-btn" data-category="택시">택시 지출</button>
												<button type="button" class="btn btn-primary filter-btn" data-category="사내">사내 지출</button>
												<button type="button" class="btn btn-primary filter-btn" data-category="기타">기타 지출</button>
											</div>
										</div>
										
										<!-- 지출 등록 버튼 -->
										<div class="text-end mb-2">
											<button id="myBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">지출 등록</button>
										</div>
										
										<!-- 지출 리스트 테이블 -->
										<div class="table-outer mt-3">
											<table class="table table-hover align-middle custom-table m-0">
												<thead>
													<tr>
														<th>지출 발생일</th>
														<th>지출자</th>
														<th>지출 금액</th>
													</tr>
												</thead>
												<tbody id="expensesTableBody">
													<!-- AJAX 요청으로 항목들이 여기에 추가됩니다 -->
												</tbody>
											</table>
											<!-- 페이지 네이션 시작 -->
											<nav aria-label="Page navigation example" class="mt-3">
												<ul class="pagination justify-content-center"
													id="pagination"></ul>
											</nav>
											<!-- 페이지 네이션 종료 -->
										</div>

										<!-- 모달 창 -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">지출 등록</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form id="expensesForm" class="needs-validation"
															novalidate>
															<div class="mb-3">
																<label for="exp_category" class="form-label">지출
																	종류:</label> <select id="exp_category" name="exp_category"
																	class="form-select" required>
																	<option value="" selected disabled>지출 종류 선택</option>
																	<option value="택시">택시 지출</option>
																	<option value="사내">사내 지출</option>
																	<option value="기타">기타 지출</option>
																</select>
																<div class="invalid-feedback">지출 종류를 입력해주세요</div>
															</div>
															<div class="mb-3">
																<label for="exp_actual_date" class="form-label">지출
																	발생일:</label> <input type="date" id="exp_actual_date"
																	name="exp_actual_date" class="form-control" required>
																<div class="invalid-feedback">지출 발생일을 입력해주세요</div>
															</div>
															<div class="mb-3">
																<label for="exp_who" class="form-label">지출자:</label> <input
																	type="text" id="exp_who" name="exp_who"
																	class="form-control" required>
																<div class="invalid-feedback">지출자를 입력해주세요</div>
															</div>
															<div class="mb-3">
																<label for="exp_cash" class="form-label">지출 금액:</label>
																<input type="text" id="exp_cash" name="exp_cash"
																	class="form-control" maxlength="10" required>
																<div class="invalid-feedback">지출 금액을 입력해주세요</div>
															</div>
															<div class="mb-3">
																<label for="exp_content" class="form-label">지출
																	내용:</label>
																<textarea id="exp_content" name="exp_content"
																	class="form-control" rows="3" maxlength="500" required></textarea>
																<div class="invalid-feedback">지출 내용을 입력해주세요</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">취소</button>
																<button type="button" class="btn btn-primary"
																	id="submitBtn">등록</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
										<!-- 모달 창 끝 -->
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

	<!-- Required jQuery first, then Bootstrap Bundle JS -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Vendor Js Files -->
	<script
		src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
	<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

	<!-- Custom JS files -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/LocalStorage.js"></script>
	<!-- 페이지네이션 -->
	<script src="/assets/js/jquery.twbsPagination.min.js"></script>
	<!-- AJAX 및 모달 스크립트 -->
	<script>
    
    var currentPage = 1;
	var searchFlag = false;
	var category = '';
    
    getTotalPages();
    refreshExpensesList();
    
    $('#filter').on('change',function(){
    	currentPage = 1;
        getTotalPages();
        refreshExpensesList();
    });

    $('#go').on('click',function(){
    	currentPage = 1;
        getTotalPages();
        refreshExpensesList();
    });
    
 // 날짜 변경 이벤트 핸들러 추가
    $('#startDate').on('change', function() {
    	currentPage=1;
        getTotalPages();
        refreshExpensesList();
    });

    $('#endDate').on('change', function() {
    	currentPage=1;
        getTotalPages();
        refreshExpensesList();
    });
    
 // 리셋 버튼 클릭 시 호출되는 함수
    function resetFilters() {
        // 선택된 버튼의 active 클래스 제거
        $('.filter-btn').removeClass('active');

        // 날짜 입력 필드 초기화
        $('#startDate').val('');
        $('#endDate').val('');

        // 필터링 선택 필드 초기화
        $('#filter').val('');

        // 검색 입력 필드 초기화
        $('#searchQuery').val('');

        // 카테고리 변수 초기화
        category = '';

        // 총 페이지
        currentPage = 1;
        getTotalPages();
        
        // 지출 리스트 다시 불러오기
        refreshExpensesList();

        // 필터링 버튼 위치로 스크롤 이동 (선택하지 않은 경우)
        $('html, body').animate({
            scrollTop: $(".mt-3").offset().top
        }, 500);
    }

    document.getElementById('startDate').addEventListener('change', function() {
        var startDate = this.value;
        var endDateInput = document.getElementById('endDate');
        endDateInput.min = startDate;
    });

        // 모든 버튼 요소를 선택합니다.
        const buttons = document.querySelectorAll('.filter-btn');

        // 각 버튼에 클릭 이벤트 리스너를 추가합니다.
        buttons.forEach(button => {
            button.addEventListener('click', function() {
                // 클릭된 버튼에만 active 클래스를 추가하고, 다른 버튼들은 active 클래스를 제거합니다.
                buttons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');

                // 클릭된 버튼의 데이터를 기반으로 필터링된 결과를 표시
                category = this.getAttribute('data-category');
                categoryName(category); // categoryName 함수 호출
                getTotalPages();
                refreshExpensesList();
            });
        });

        // 카테고리 이름을 출력하는 함수
        function categoryName(category) {
            console.log('Selected category:', category);
        }
        
        // 등록 버튼 클릭 이벤트 처리
        $('#submitBtn').click(function(event) {
            var form = document.querySelector('.needs-validation');
            if (!form.checkValidity()) {
                form.classList.add('was-validated');

                return;
            }
            $.ajax({
                url: '/finance/expenses/add.ajax', // 서버의 폼 처리 엔드포인트
                type: 'POST',
                data: {
                	exp_category: $('#exp_category').val(),
                	exp_date: $('#exp_date').val(),
                	exp_actual_date: $('#exp_actual_date').val(),
                	exp_who: $('#exp_who').val(),
                	exp_cash: $('#exp_cash').val().replace(/,/g, ''),
                	exp_content: $('#exp_content').val()
                },
                success: function(response) {
                    // 성공적으로 저장되었음을 사용자에게 알리고 모달을 닫음
                    alert('지출이 등록되었습니다.');
                    $('#exampleModal').modal('hide');
                    // 지출 리스트를 다시 불러옵니다
                    refreshExpensesList();
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                    alert('지출 등록 중 오류가 발생했습니다.');
                }
            });
        });

        // 숫자를 세 자리마다 쉼표가 포함된 형식으로 포맷하는 함수
        function formatNumberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // 지출 금액 입력 필드에서 키 입력 시 호출되는 함수
        $('#exp_cash').on('input', function() {
            var value = $(this).val(); // 입력된 값 가져오기
            var number = parseInt(value.replace(/[^\d]/g, '')); // 숫자만 추출하여 정수로 변환

            if (!isNaN(number)) {
                var formattedValue = formatNumberWithCommas(number); // 포맷 함수 호출
                $(this).val(formattedValue); // 포맷된 값으로 입력 필드 업데이트
            }
        });

        // AJAX로 받은 지출 리스트를 테이블에 표시하는 함수
		function displayExpensesList(expensesList) {
		    var tbody = $('#expensesTableBody');
		    console.log(expensesList);
		    tbody.empty(); // 테이블 본문을 비웁니다.
		    var row = '';
		    for (item of expensesList) {
		        row += '<tr class="clickable-row">' +
		            '<td>' + item.exp_actual_date + '</td>' +
		            '<td>' + item.exp_who + '</td>' +
		            '<td>' + formatNumberWithCommas(item.exp_cash) + '&nbsp;<strong>원</strong></td>' +
		            '</tr>'+
		            '<tr class="detail-row">'+
		            '<td colspan="3" class="detail-content gap-2">'+
		            '<div class="mb-2 mt-2"><strong>지출 발생일:</strong> ' + item.exp_actual_date + '</div>'+
		            '<div class="mb-2"><strong>지출 등록일:</strong> ' + item.exp_date + '</div>'+
		            '<div class="mb-2"><strong>지출 종류:</strong> ' + item.exp_category + '</div>'+
		            '<div class="mb-2"><strong>지출 내용:</strong> ' + item.exp_content + '</div>'+
		            '<div class="mb-2"><strong>지출 금액:</strong> ' + formatNumberWithCommas(item.exp_cash) +
		            '<strong>원</strong></div> ' +
		            '</td>'+
		            '</tr>';
		    }
		    tbody.html(row);
		    // 각 행에 클릭 이벤트 추가
		    $('.clickable-row').on('click', function() {
		        $(this).next('.detail-row').toggleClass('active');
		    });
		}

        
        
        // 지출 리스트 갱신 함수
        function refreshExpensesList() {
            // 카테고리 값이 없으면 기본 값을 설정 (예: 모든 카테고리)
            
            $.ajax({
                type: 'POST',
                url: '/finance/expenses/list.ajax',
                data: {
                    'category': category,
                    'filterStartDate': $('#startDate').val(),
                    'filterEndDate': $('#endDate').val(),
                    'exp_filter': $('#filter').val(),
                    'searchText': $('#searchQuery').val(),
                    'page' : currentPage
                },
                dataType : 'json',
                success: function(data) {
                    displayExpensesList(data.expenses); // 갱신된 지출 리스트 표시
                    console.log($('#searchQuery').val());
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        }


        // 모달이 닫힐 때 폼 초기화
        $('#exampleModal').on('hidden.bs.modal', function (e) {
            $('#expensesForm')[0].reset();
        });
        



        // 토탈 페이지 호출
        function getTotalPages() {
            $.ajax({
                url: './getTotalPages.ajax',
                type: 'GET',
                data: {
                    'category': category,
                    'filterStartDate': $('#startDate').val(),
                    'filterEndDate': $('#endDate').val(),
                    'searchText': $('#searchQuery').val(),
                    'page' : currentPage
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
                            refreshExpensesList();
                        }
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    </script>
</body>
</html>
