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
						<li class="breadcrumb-item"><a href="/emp/hremp/list.go"
							class="text-decoration-none">사원 조회</a></li>
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
										<h4 class="card-title">사원 조회</h4>
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
													<label for="filter-emp-is-retired" class="form-label">재직여부
														필터</label>
														
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-6"></div>
												<div class="col-1">
													<select id="filterforsearch"
														class="form-select emp-search-filter">
														<option value="emp_no">사번</option>
														<option value="emp_name">이름</option>
														<option value="title_name">직급</option>
														<option value="dept_name">부서</option>
													</select>
												</div>
												<div class="col-3 text-end">
													<input type="text"
														class="form-control emp-search-filter bg-" id="search-emp"
														placeholder="검색어를 입력해주세요.">
												</div>
												<div class="col-2">
													<select id="filter-emp-is-retired"
														class="form-select emp-search-filter">
														<option value="">재직 여부</option>
														<option value="1">재직중</option>
														<option value="0">퇴사</option>
													</select>
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
																style="width: 10%;" data-value="emp-no">사번</th>
															<th class="text-center sortable" id="th-emp-name"
																style="width: 20%;" data-value="emp-name">이름</th>
															<th class="text-center sortable" id="th-title-name"
																style="width: 20%;" data-value="title-name">직급</th>
															<th class="text-center sortable" id="th-dept-name"
																style="width: 20%;" data-value="dept-name">부서</th>
															<th class="text-center" id="th-employment-status"
																style="width: 10%;" data-value="employment-status">재직
																여부</th>
														</tr>
													</thead>
													<tbody id="emp-list">
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
						<!-- Row end -->
						<!-- 정들었지만 죽은 모달 -->
						<!-- <div class="modal fade" id="empModal" tabindex="-1"
							aria-labelledby="registerModalLabel" aria-hidden="true">
							Alert placeholder start
							<div id="alertModalPlaceholder" class="alert-placeholder"></div>
							Alert placeholder end
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="registerModalLabel">사원 상세보기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
											<div class="mb-3">
												<label for="register-emp-photo" class="form-label">사진</label>
												<div id="preview-container"
													class="d-flex align-items-center justify-content-center border border-2 mb-3"
													style="height: 108px; width: 108px;">
													<img id="preview-image"  alt="이미지 미리보기"
														style="display: none; width: 100px; height: 100px;">
												</div>										
											</div>
											<div class="mb-3">
												<label for="emp-no" class="form-label">사번</label>
												<input type="text" class="form-control" id="emp-no" readonly>
											</div>
											<div class="mb-3">
												<label for="emp-name" class="form-label">이름</label>
												<input type="text" class="form-control" id="emp-name" readonly>
											</div>
											<div class="mb-3">
												<label for="dept-name" class="form-label">부서</label>
												<input type="text" class="form-control" id="dept-name" readonly>
												<select id="sdept-name" class="form-select dept-select" name="dept_name">
												<option value="1">인사부</option>
												<option value="2">영업부</option>
												<option value="3">영업지원부</option>
												<option value="4">택시관리부</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="title-name" class="form-label">직급</label>
												 <input type="text" class="form-control" id="title-name" readonly>
												 <select id="stitle-name" class="form-select title-select" name = "title_name">
												 <option value="5">사원</option>
												 <option value="4">대리</option>
												 <option value="3">과장</option>
												 <option value="2">부장</option>
												 <option value="1">대표이사</option>
												 </select>
											</div>
											<div class="mb-3">
												<label for="emp-level" class="form-label">권한 레벨</label>
												<input type="text" class="form-control" id="emp-level" readonly>
												<select id="semp-level" class="form-select level-select" name="emp_level">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="emp-email" class="form-label">이메일</label>
												<input type="text" class="form-control" id="emp-email" readonly>
											</div>
											<div class="mb-3">
												<label for="emp-employment_status" class="form-label">재직 여부</label>
												<input type="text" class="form-control" id="emp-employment-status" readonly>
												<select id="semp-employment-status" class="form-select status-select" name="emp_employment_status">
												<option value="true">재직중</option>
												<option value="false">퇴사</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="emp-hired-date" class="form-label">입사일</label>
												<input type="text" class="form-control" id="emp-hired-date" readonly>
											</div>
											<div class="mb-3">
												<label for="emp-retired-date" class="form-label" id="retired-label">퇴사일</label>
												<input type="text" class="form-control" id="emp-retired-date" readonly>
											</div>
											<div class="mb-3">
												<label for="emp-add" class="form-label">주소</label>
												<input type="text" class="form-control" id="emp-add" readonly>
											</div>
											<div class="mb-3">
												<label for="vac-left" class="form-label">잔여 연차</label>
												<input type="text" class="form-control" id="vac-left" readonly>
											</div>
											<div class="mb-3">
												<label for="emp-extension-number" class="form-label">내선 번호</label>
												<input type="text" class="form-control" id="emp-extension-number" readonly>
											</div>
											<div class="button-position">
											<button type="button" class="btn btn-outline-dark">
                          					<i class="bi bi-chat-left-text"></i> 메세지 보내기
                        					</button>
                        					</div>
									</div>
									<div class="modal-footer">
										<button type="button" id="editButton"
											class="btn btn-primary">수정</button>
											<button type="button" id="editButton2"
											class="btn btn-primary">수정</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
 -->

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
    var filterIsRetired = '';
    var filterforsearch = '';
    var currentPage = 1; // 현재 페이지 번호
    var sortOrder = 'asc';
    var sortColumn = 'default';

    
    

    getTotalPages();
    getList();

   

    // 테이블 헤더 클릭 이벤트 설정
    $('th.sortable').click(function () {
        sortColumn = $(this).data('value');
        // 현재 정렬 상태 확인
        if ($(this).hasClass('asc')) {
            $(this).removeClass('asc').addClass('desc');
            sortOrder = 'desc';
        } else if ($(this).hasClass('desc')) {
            $(this).removeClass('desc').addClass('asc');
            sortOrder = 'asc';
        } else {
            $('th.sortable').removeClass('asc desc');
            $(this).addClass('asc');
            sortOrder = 'asc';
        }
        getList();
    });
    
    
    
    
    $('#search-emp').on('change', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
    });

   
    $('.emp-search-filter').on('input', function () {
        currentPage = 1;
        getTotalPages();
        getList();
    });


    // 필터 값 리셋
    function filterReset() {
        $('#filter-emp-is-retired').val('');
        $('#search-emp').val('');
        $('#filterforsearch').val('');
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
    }

    // 사원리스트 호출
    function getList() {
        getSearchValue();
        $.ajax({
            url: '/emp/hremp/hrEmpList.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterIsRetired': filterIsRetired,
                'filterForSearch': filterForSearch,
                'page': currentPage,
                'sortColumn': sortColumn,
                'sortOrder': sortOrder
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
    function getTotalPages() {
        getSearchValue();
        $.ajax({
            url: '/emp/hremp/getTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterForsearch': filterForSearch,
                'filterIsRetired': filterIsRetired
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
            	console.log(item.emp_employment_status);
                var emp_employment_status = item.emp_employment_status === true ? '재직중' : '퇴사';
                
                content += '<tr class="emp-list-tbody-tr" id="' + item.emp_no + '">'
                	+ '<td class="text-center">' + item.emp_no + '</td>'
                    + '<td class="text-center">' + item.emp_name + '</td>'
                    + '<td class="text-center">' + item.title_name + '</td>'
                    + '<td class="text-center">' + item.dept_name + '</td>'
                    + '<td class="text-center">' + emp_employment_status + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#emp-list').html(content);
    }
    
    $(document).on('click', '.emp-list-tbody-tr', function () {
        location.href = './empDetail.go?emp_no=' + $(this).attr('id');
    });
    
    
    

    // 검색 값들 변수에 저장
    function getSearchValue() {
        filterIsRetired = $('#filter-emp-is-retired').val();
		filterForSearch = $('#filterforsearch').val();
        searchText = $('#search-emp').val();
    }
    
    
    
    
    /*정들었지만 죽은 모달*/
   /*  var myModal = new bootstrap.Modal(document.getElementById('empModal'));
    
    
    
    	$('#empModal').on('shown.bs.modal', function(){
    		$('#sdept-name').hide();
         	$('#stitle-name').hide();
         	$('#semp-level').hide();
         	$('#semp-employment-status').hide();
        	$('#editButton2').hide();
         	
         	$('#dept-name').show();
        	$('#title-name').show();
        	$('#emp-level').show();
        	$('#emp-employment-status').show();
        	$('#editButton').show()
        	
        	
         	
            $('#editButton').on('click',function(){
            	
            	$('#dept-name').hide();
            	$('#title-name').hide();
            	$('#emp-level').hide();
            	$('#emp-employment-status').hide();
            	$('#editButton').hide();
            	
            	 $('#sdept-name').show();
             	$('#stitle-name').show();
             	$('#semp-level').show();
             	$('#semp-employment-status').show();
             	$('#editButton2').show();
             	
            	
            });
    	});
    
    function showModal(emp_no){
    	
    	 console.log(emp_no); 
    	
    	getEmployeeById(emp_no).done(function(employee) {
    		var fileName = employee.profile_new;
    		
    		if (fileName) {
                $('#preview-image').attr('src', '/photo/' + fileName).show();
            } else {
                $('#preview-image').hide();
                $('#preview-image').attr('src', ''); // 이미지 소스 비우기
                $('#preview-image').parent().html('<i class="fs-3 bi bi-person-fill"></i>'); // 아이콘으로 대체
            }
    		
            $('#emp-no').val(employee.emp_no);
            $('#emp-name').val(employee.emp_name);
            $('#dept-name').val(employee.dept_name);
            $('#title-name').val(employee.title_name);
            $('#emp-level').val(employee.emp_level);
            $('#emp-email').val(employee.emp_email);
            $('#emp-hired-date').val(employee.emp_hired_date);
        	$('#emp-retired-date').val(employee.emp_retired_date);
        	$('#sdept-name').val(employee.dept_no);
          	$('#stitle-name').val(employee.title_no);
          	$('#semp-level').val(employee.emp_level);
            
            $('#emp-employment-status').val(employee.emp_employment_status ? '재직중' : '퇴사');
            $('#emp-add').val(employee.emp_add);
            $('#vac-left').val(employee.vac_left);
            $('#emp-extension-number').val(employee.emp_extension_number);
            $('#sdept-name').hide();
        	$('#stitle-name').hide();
        	$('#semp-level').hide();
        	$('#semp-employment-status').hide();
        	$('#editButton2').hide();
        	
        	var isEmp = employee.emp_employment_status;
        	
        	
        	if (isEmp) {
     		console.log('재직 직원');
			$('#emp-retired-date').hide();
			$('#retired-label').hide();
			
			}else {
			console.log('퇴사 직원');
			console.log(employee.emp_retired_date);
        	$('#editButton').hide();
			$('#retired-label').show();
        	$('#emp-retired-date').show();
        	
			} 
        	console.log('이건 뭘까? : '+employee.emp_retired_date);
            
            
            // 모달을 표시
            myModal.show();
        });
    	
    }
    
    $('#editButton2').on('click', function(){
    	
    		var emp_no = $('#emp-no').val();
    		var dept_no = $('#sdept-name').val();
    		var title_no = $('#stitle-name').val();
    		var emp_level = $('#semp-level').val();
    		var emp_employment_status = $('#semp-employment-status').val();
    		
    		var isEmployed = emp_employment_status === 'true';
    		
    		console.log('재직여부는? :'+emp_employment_status);
    		
    		if (!isEmployed) {		
    			console.log('재직여부는? :'+emp_employment_status);
    			alert('재직 여부가 퇴사입니다. 한번 더 확인 부탁드립니다.');
			}
    		
    	
    	if (confirm('수정 하시겠습니까?')) {
    		
    		
    		console.log('여기다 : '+emp_no);
    		console.log('부서번호는? :'+dept_no);
    		console.log('재직여부는? :'+emp_employment_status);
    		updateEmp(emp_no, dept_no, title_no, emp_level, emp_employment_status);
    				
    	
			}else{
				showAlert('danger', '수정이 취소되었습니다.');
				myModal.hide();
			
		}
    	

    });
    
    function getEmployeeById(emp_no) {//사원 상세보기 
        return $.ajax({
            url: './getEmpDetail.ajax',
            type: 'GET',
            data: {
                'emp_no': emp_no     
            },
            dataType: 'JSON',           
            success: function(data) {
                return data;
            },
            error: function(xhr, status, error) {
                console.error('직원 데이터를 가져오는 중 오류 발생:', status, error);
            }
        });
    }
    
    
    function updateEmp(emp_no, dept_no, title_no, emp_level, emp_employment_status) {//사원 수정
    	console.log('ajax: '+emp_no);
        return $.ajax({
            url: './updateEmp.ajax',
            type: 'GET',
            data: {
                'emp_no': emp_no,
                'dept_no': dept_no, 
                'title_no' : title_no, 
                'emp_level' : emp_level, 
                'emp_employment_status' : emp_employment_status      
            },
            dataType: 'JSON',           
            success: function(data) {
            	if (data.isSuccess) {
                    $('#empModal').modal('hide');
                    showAlert('success', '사원 수정에 성공했습니다.');
                    getTotalPages();
                    getList();
                } else {
                    showAlert('danger', '사원 수정에 실패했습니다.');
                }  
            },
            error: function(xhr, status, error) {
                console.error('사원 수정 오류 발생:', status, error);
            }
        });
    }
    
     */

    





</script>
</html>
