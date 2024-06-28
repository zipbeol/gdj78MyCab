<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
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
    </style>

</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="../sidebar.jsp"/>
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
						<li class="breadcrumb-item"><a href="/"><i
								class="bi bi-house lh-1"></i></a> <a href="/"
							class="text-decoration-none">메인</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">인사 관리</a></li>
						<li class="breadcrumb-item"><a href="/emp/hremp/list.go"
							class="text-decoration-none">사원 조회</a></li>
							<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">사원 상세 보기</a></li>
					</ol>
                <!-- Breadcrumb end -->

                <!-- App header actions start -->
                <jsp:include page="../appHeader.jsp"/>
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
						<div class="row justify-content-center">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-body">
										<form id="driver-form" class="needs-validation" novalidate>
											<div class="row">
												<div class="col-8">
													<h1>${empDetail.emp_name} 사원 상세보기</h1>
												</div>
												<div class="col-4 text-end">
													<input type="button" class="btn btn-primary" value="수정"
														id="edit-button" style="display: none;"> 
														<input type="button"
														class="btn btn-success" value="저장" id="save-button"
														style="display: none;">
														<input type="button"
														class="btn btn-secondary" value="취소" id="cancel-button"
														style="display: none;">
												</div>
											</div>
											<div class="row">
												<hr />
											</div>
											<div class="row justify-content-center">
												<div class="col-md-8 offset-md-2">
													<div class="row">
														<div class="col-md-4 text-center">
															<c:choose>
																<c:when test="${not empty empDetail.profile_new}">
																	<img src="/photo/${empDetail.profile_new}"
																		style="width: 300px; height: 300px;" id="emp-photo">
																	<div class="mb-3"></div>
																	<dt class="col-12">프로필 사진</dt>
																	<div class="mb-3"></div>
																	<div>
																		<button type="button" class="btn btn-outline-dark">
																			<i class="bi bi-chat-left-text"></i> 메세지 보내기
																		</button>
																	</div>
																</c:when>
																<c:otherwise>
																	<img src="/assets/user.png"
																		style="width: 300px; height: 300px;" id="emp-photo">
																	<br />
																	<br />
																	<dt class="col-12">프로필 사진</dt>
																	<br />
																	<div>
																		<button type="button" class="btn btn-outline-dark">
																			<i class="bi bi-chat-left-text"></i> 메세지 보내기
																		</button>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="col-md-8">
															<dl class="row">
																<dt class="col-12">사번</dt>
																<dd class="col-12 info-value mb-3" id="emp-no"
																	data-value="${empDetail.emp_no}">${empDetail.emp_no}</dd>
																<dt class="col-12">입사일</dt>
																<dd class="col-12 info-value mb-3" id="emp-hired-date"
																	data-value="${empDetail.emp_hired_date}">${empDetail.emp_hired_date}</dd>
																<c:choose>
																	<c:when
																		test="${empDetail.emp_employment_status == false}">
																		<dt class="col-12">퇴사일</dt>
																		<dd class="col-12 info-value mb-3"
																			id="emp-retired-date"
																			data-value="${empDetail.emp_retired_date}">${empDetail.emp_retired_date}</dd>
																	</c:when>
																</c:choose>
																<dt class="col-12">이름</dt>
																<dd class="col-12 info-value mb-3" id="emp-name"
																	data-value="${empDetail.emp_name}">${empDetail.emp_name}</dd>
																<dt class="col-12">부서</dt>
																<dd class="col-12 info-value mb-3" id="dept-name"
																	data-value="${empDetail.dept_name}">${empDetail.dept_name}</dd>
																	<select id="sdept-name" class="form-select dept-select" name="dept_name" style="display: none;">
																	<option value="1">인사부</option>
																	<option value="2">영업부</option>
																	<option value="3">영업지원부</option>
																	<option value="4">택시관리부</option>
																	</select>
																<dt class="col-12">직급</dt>
																<dd class="col-12 info-value mb-3" id="title-name"
																	data-value="${empDetail.title_name}">${empDetail.title_name}</dd>
																	<select id="stitle-name" class="form-select title-select" name = "title_name" style="display: none;">
												 					<option value="5">사원</option>
												 					<option value="4">대리</option>
												 					<option value="3">과장</option>
												 					<option value="2">부장</option>
												 					<option value="1">대표이사</option>
																	</select>
																<dt class="col-12">권한 레벨</dt>
																<dd class="col-12 info-value mb-3" id="emp-level"
																	data-value="${empDetail.emp_level}">${empDetail.emp_level}</dd>
																	<select id="semp-level" class="form-select level-select" name="emp_level" style="display: none;">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	</select>
																<dt class="col-12">사원 재직 여부</dt>
																<dd class="col-12 info-value mb-3"
																	id="emp-employment-status"
																	data-value="${empDetail.emp_employment_status}">
																	<c:choose>
																		<c:when
																			test="${empDetail.emp_employment_status == true}">재직중</c:when>
																		<c:otherwise>퇴사</c:otherwise>
																	</c:choose>
																</dd>
																<select id="semp-employment-status" class="form-select status-select" name="emp_employment_status" style="display: none;">
																<option value="true">재직중</option>
																<option value="false">퇴사</option>
																</select>
																<dt class="col-12">이메일</dt>
																<dd class="col-12 info-value mb-3" id="emp-email"
																	data-value="${empDetail.emp_email}" style="display: none;">${empDetail.emp_email}</dd>
																<dt class="col-12">주소</dt>
																<dd class="col-12 info-value mb-3" id="emp-add"
																	data-value="${empDetail.emp_add}" style="display: none;">${empDetail.emp_add}</dd>
																<dt class="col-12">내선번호</dt>
																<dd class="col-12 info-value mb-3"
																	id="emp-extension-number"
																	data-value="${empDetail.emp_extension_number}" style="display: none;">${empDetail.emp_extension_number}</dd>
															</dl>
														</div>
													</div>
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

</body>
<!-- *************
        ************ JavaScript Files *************
    ************* -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>

<!-- *************
        ************ Vendor Js Files *************
    *************

 -->

<!-- Overlay Scroll JS -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$('#sdept-name').hide();
	$('#stitle-name').hide();
	$('#semp-level').hide();
	$('#semp-employment-status').hide();
	$('#save-button').hide();
	var isRetired = '${empDetail.emp_employment_status}' === 'false';

	console.log('회사 다녀?? '+isRetired)

	if (isRetired) {
		
		$('#emp-email').show();
		$('#emp-add').show();
        $('#emp-extension-number').show();
		$('#emp-email').text('개인정보 보호법에 의거하여 열람 할 수 없습니다.');
		$('#emp-add').text('개인정보 보호법에 의거하여 열람 할 수 없습니다.');
        $('#emp-extension-number').text('존재하지 않는 내선번호입니다.');
	}else if(!isRetired){
		$('#edit-button').show();
		$('#emp-email').show();
		$('#emp-add').show();
        $('#emp-extension-number').show();
	}




	// 수정
	 $('#edit-button').click(function () {
		 
		$('#dept-name').hide();
     	$('#title-name').hide();
     	$('#emp-level').hide();
     	$('#emp-employment-status').hide();
     
     	
     	$('#sdept-name').show();
      	$('#stitle-name').show();
      	$('#semp-level').show();
      	$('#semp-employment-status').show();
      	$('#edit-button').hide();
        $('#save-button').show();
        $('#cancel-button').show();
        
        $('#sdept-name').val(${empDetail.dept_no});
      	$('#stitle-name').val(${empDetail.title_no});
      	$('#semp-level').val(${empDetail.emp_level});
        
	});


	// 저장
	$('#save-button').click(function() {
		
		var emp_employment_status = $('#semp-employment-status').val() === 'true';
		var emp_no =  '${empDetail.emp_no}';
		var dept_no = $('#sdept-name').val();
		var title_no = $('#stitle-name').val();
		var emp_level = $('#semp-level').val();
		
		console.log('재직여부는? :'+ emp_employment_status);
		if (!emp_employment_status) {
			if (confirm("재직 여부가 퇴사가 맞습니까?")) {
				if (confirm('수정 하시겠습니까?')) {
    				console.log('여기다 : '+emp_no);
    				console.log('부서번호는? :'+dept_no);
    				console.log('직위는? :'+title_no);
    				console.log('재직여부는? :'+emp_employment_status);
    				updateEmp(emp_no, dept_no, title_no, emp_level, emp_employment_status);
    				
			}else{
				$('#cancel-button').click();
			}
		}else{
			showAlert('warning', '재직 여부를 확인 부탁드립니다.');
		}
		}else{
			if (confirm('수정 하시겠습니까?')) {
				console.log('여기다 : '+emp_no);
				console.log('부서번호는? :'+dept_no);
				console.log('직위는? :'+title_no);
				console.log('재직여부는? :'+emp_employment_status);
				updateEmp(emp_no, dept_no, title_no, emp_level, emp_employment_status);
				
		}else{
			$('#cancel-button').click();
		}
		}
	});
	
	//취소
	$('#cancel-button').click(function() {
		
		if (confirm('수정을 취소하겠습니까?')) {
		
			showAlert('danger', '수정이 취소되었습니다.');
			$('#dept-name').show();
     		$('#title-name').show();
     		$('#emp-level').show();
     		$('#emp-employment-status').show();
     		$('#edit-button').show();
     	
     	 	$('#sdept-name').hide();
      		$('#stitle-name').hide();
      		$('#semp-level').hide();
      		$('#semp-employment-status').hide();
        	$('#save-button').hide();
        	$('#cancel-button').hide();
			
		}
		
	});
	
	
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
            		$('#dept-name').show();
             		$('#title-name').show();
             		$('#emp-level').show();
             		$('#emp-employment-status').show();
             		$('#edit-button').show();
             	
             	 	$('#sdept-name').hide();
              		$('#stitle-name').hide();
              		$('#semp-level').hide();
              		$('#semp-employment-status').hide();
                	$('#save-button').hide();
                	$('#cancel-button').hide();
                	
                    showAlert('success', '사원 수정에 성공했습니다.');
                    
                    location.reload(true);
                    
                } else {
                    showAlert('danger', '사원 수정에 실패했습니다.');
                }  
            },
            error: function(xhr, status, error) {
                console.error('사원 수정 오류 발생:', status, error);
            }
        });
    }
					
</script>

</html>