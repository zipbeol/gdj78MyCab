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
.imgContainer{
	margin-left: 167px;
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
														onclick="filterReset()" value="초기화"> 
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
												<div class="col-2">
													<select id="filterforsearch"
														class="form-select emp-search-filter">
														<option value="emp_no">사번</option>
														<option value="emp_name">이름</option>
														<option value="title_name">직급</option>
														<option value="dept_name">부서</option>
													</select>
												</div>
												<div class="col-4 text-end">
													<input type="text"
														class="form-control emp-search-filter bg-" id="search-emp"
														placeholder="검색어를 입력해주세요.">
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
	
	
	
						<div class="modal fade" id="empModal" tabindex="-1"
							aria-labelledby="registerModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="registerModalLabel">사원 상세보기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
											<div class="mb-3 imgContainer">
												<label for="register-emp-photo" class="form-label">사진</label>
												<div id="preview-container"
													class="d-flex align-items-center justify-content-center border border-2 mb-3"
													style="height: 150px; width: 150px;">
													<img id="preview-image"  alt="이미지 미리보기"
														style="display: none; width: 140px; height: 140px;">
												</div>										
											</div>
											<div class="row">
											<div class="mb-3 col-6">
												<label for="emp-no" class="form-label">사번</label>
												<input type="text" class="form-control" id="emp-no" readonly>
											</div>
											<div class="mb-3 col-6">
												<label for="emp-name" class="form-label">이름</label>
												<input type="text" class="form-control" id="emp-name" readonly>
											</div>
											</div>
											<div class="row">
											<div class="mb-3 col-6">
												<label for="dept-name" class="form-label">부서</label>
												<input type="text" class="form-control" id="dept-name" readonly>
											</div>
											<div class="mb-3 col-6">
												<label for="title-name" class="form-label">직급</label>
												 <input type="text" class="form-control" id="title-name" readonly>
											</div>
											</div>
											<div class="row">
											<div class="mb-3 col-6">
												<label for="emp-email" class="form-label">이메일</label>
												<input type="text" class="form-control" id="emp-email" readonly>
											</div>
											<div class="mb-3 col-6">
												<label for="emp-extension-number" class="form-label">내선 번호</label>
												<input type="text" class="form-control" id="emp-extension-number" readonly>
											</div>
											</div>
											<div class="button-position">
											<button type="button" class="btn btn-outline-dark" id="chatCall">
                          					<i class="bi bi-chat-left-text"></i> 메세지 보내기
                        					</button>
                        					</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
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
$(document).ready(function() {
    // URL 파라미터 읽기
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? null : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }

    var searchText = getUrlParameter('searchText') || ''; // 기본값을 빈 문자열로 설정
    var filterForSearch = getUrlParameter('filterForSearch') || ''; // 기본값을 빈 문자열로 설정
    var filterIsRetired = getUrlParameter('filterIsRetired') || ''; // 기본값을 빈 문자열로 설정
    var currentPage = 1; // 기본값을 1로 설정
    var sortOrder = 'asc';
    var sortColumn = 'default';
    
    
    	
    console.log(searchText);
    console.log(filterForSearch);
    
    if (searchText !== '') {
		
	$('#filterforsearch').val(filterForSearch);
	$('#search-emp').val(searchText);
	}
    
	
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

    // 검색 이벤트 설정
    $('#search-emp').on('change', function() {
        currentPage = 1;
        getSearchValue();
        getTotalPages();
        getList();
    });

    // 필터 입력 이벤트 설정
    $('.emp-search-filter').on('input', function () {
        currentPage = 1;
        getSearchValue();
        getTotalPages();
        getList();
    });

    // 필터 값 리셋
    function filterReset() {
        $('#filter-emp-is-retired').val('');
        $('#search-emp').val('');
        $('#filterforsearch').val('');
        currentPage = 1; // 페이지 번호 초기화
        getSearchValue();
        getTotalPages();
        getList(); // 목록 새로고침
    }

    // 사원리스트 호출
    function getList() {
    	getSearchValue();
        $.ajax({
            url: '/empList.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
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
            url: '/getEmpTotalPages.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterForSearch': filterForSearch,
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                console.log('총 페이지?'+data.totalPages);
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

                content += '<tr class="emp-list-tbody-tr" id="' + item.emp_no + '">'
                    + '<td class="text-center">' + item.emp_no + '</td>'
                    + '<td class="text-center">' + item.emp_name + '</td>'
                    + '<td class="text-center">' + item.title_name + '</td>'
                    + '<td class="text-center">' + item.dept_name + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#emp-list').html(content);
    }

    // 사원 상세 페이지로 이동
    $(document).on('click', '.emp-list-tbody-tr', function () {
        showModal($(this).attr('id'));
    });

    // 검색 값들 변수에 저장
    function getSearchValue() {
        filterForSearch = $('#filterforsearch').val();
        searchText = $('#search-emp').val();
    }
});


//모달
var myModal = new bootstrap.Modal(document.getElementById('empModal'));


function showModal(emp_no){

 console.log(emp_no); 

	getEmployeeById(emp_no).done(function(employee) {
	var fileName = employee.profile_new;
	
	if (fileName) {
        $('#preview-image').attr('src', '/photo/' + fileName).show();
    } else {
        
    	$('#preview-image').attr('src', '/assets/user.png').show(); // 아이콘으로 대체
    }
	
    $('#emp-no').val(employee.emp_no);
    $('#emp-name').val(employee.emp_name);
    $('#dept-name').val(employee.dept_name);
    $('#title-name').val(employee.title_name);
    $('#emp-email').val(employee.emp_email);
    $('#emp-extension-number').val(employee.emp_extension_number);
    
    
    // 모달을 표시
    myModal.show();
    
    $('#chatCall').on('click', function(){
    	var employeeNo = employee.emp_no;
    	var employeeName = employee.emp_name;
    	var currentUser = '${sessionScope.loginId}';
    	var currentName = '${sessionScope.emp_name}';
    	
    	createChatRoomWithEmployee(employeeNo, employeeName, currentUser, currentName);
    });
});

}


function getEmployeeById(emp_no) {//사원 상세보기 
return $.ajax({
    url: '/getEmpDetail.ajax',
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


function createChatRoomWithEmployee(employeeNo, employeeName, currentUser, currentName) {
	
    if (!employeeNo || !currentUser) {
        alert('유효한 사원 정보가 필요합니다.');
        return;
    }

    var selectedEmployeeIds = new Set([employeeNo]);
    var selectedEmployeeNames = new Set([employeeName]);
    
    // Include current user
    selectedEmployeeIds.add(Number(currentUser));
    selectedEmployeeNames.add(currentName);

    var selectedEmployeeNoArray = Array.from(selectedEmployeeIds).map(id => ({ emp_no: id }));
    var selectedEmployeeNameArray = Array.from(selectedEmployeeNames);
    var roomName = selectedEmployeeNameArray.join(', ');
    
                // Create chat room
                $.ajax({
                    url: '/chat/createChatRoom.ajax',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        roomName: roomName,
                        empList: selectedEmployeeNoArray,
                        roomEmpIdx: currentUser
                    }),
                    success: function (response) {
                        if (response.result) {
                           
                             setTimeout(function() {
                                location.href='/chat/chat.go';
                            }, 1000); 
                           
                        } else {
                            alert('채팅방 생성에 실패했습니다. 다시 시도해주세요.');
                        }
                    },
                    error: function (error) {
                        console.error('Error creating chat room:', error);
                        alert('채팅방 생성에 실패했습니다. 다시 시도해주세요.');
                    }
                });

}
    
    

</script>
</html>
