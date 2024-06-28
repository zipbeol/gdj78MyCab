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
         .info-section {
            border: 1px solid lightgray;
            border-radius: 20px;
            padding: 10px;
            margin: 5px;
            font-size: 16px;
        }
        .info-section input{
            font-size: 16px;
        }
        .info-section dt, .info-section dd {
            margin: 0;
            padding: 5px;
            
        }
        .profile-section {
            border-radius: 20px;
            text-align: center;
            padding: 20px;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .profile-pic {
            
            margin-top:30px;
            border-radius: 10%;
            width: 400px;
            height: 350px;
            /* margin: 0 auto; */
        }
        .form-control[readonly] {
            
            border: none;
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
							class="text-decoration-none">마이페이지</a></li>
						<li class="breadcrumb-item"><a href="/mypage/profile.go"
							class="text-decoration-none">프로필</a></li>
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
                                    <input type="button" class="btn btn-primary" value="수정" id="edit-button"> 
                                    <input type="button" class="btn btn-success" value="저장" id="save-button" style="display: none;">
                                    <input type="button" class="btn btn-secondary" value="취소" id="cancel-button" style="display: none;">
                                </div>
                            </div>
                            <div class="row">
                                <hr />
                            </div>
                            <div class="row">
                                <div class="col-md-4 profile-section">
                                    <div>
                                        <c:choose>
                                            <c:when test="${not empty empDetail.profile_new}">
                                                <img src="/photo/${empDetail.profile_new}" class="profile-pic" id="emp-photo">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/assets/user.png" class="profile-pic" id="emp-photo">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="mt-3"></div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row info-section">
                                        <div class="col-md-6">
                                            <dt>사번</dt>
                                            <dd><input type="text" class="form-control" id="emp-no" value="${empDetail.emp_no}" readonly></dd>
                                        </div>
                                        <div class="col-md-6">
                                            <dt>입사일</dt>
                                            <dd><input type="date" class="form-control" id="emp-hired-date" value="${empDetail.emp_hired_date}" readonly></dd>
                                        </div>
                                    </div>
                                    <div class="row info-section">
                                        <div class="col-md-12">
                                            <dt>비밀번호</dt>
                                            <dd><input type="text" class="form-control" id="emp-extension-number" value=""></dd>
                                        </div>
                                    </div>
                                    <div class="row info-section">
                                        <div class="col-md-12">
                                            <dt>이름</dt>
                                            <dd><input type="text" class="form-control" id="emp-name" value="${empDetail.emp_name}" readonly></dd>
                                        </div>
                                    </div>
                                    <div class="row info-section">
                                        <div class="col-md-12">
                                            <dt>이메일</dt>
                                            <dd><input type="email" class="form-control" id="emp-email" value="${empDetail.emp_email}" readonly></dd>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="row info-section">
                                <div class="col-md-6">
                                    <dt>부서</dt>
                                    <dd><input type="text" class="form-control" id="dept-name" value="${empDetail.dept_name}" readonly></dd>
                                </div>
                                <div class="col-md-6">
                                    <dt>직급</dt>
                                    <dd><input type="text" class="form-control" id="title-name" value="${empDetail.title_name}" readonly></dd>
                                </div>
                            </div>
                            <div class="row info-section">
                                <div class="col-md-6">
                                    <dt>권한레벨</dt>
                                    <dd><input type="text" class="form-control" id="emp-level" value="${empDetail.emp_level}" readonly></dd>
                                </div>
                                <div class="col-md-6">
                                    <dt>내선번호</dt>
                                    <dd><input type="text" class="form-control" id="emp-extension-number" value="${empDetail.emp_extension_number}" readonly></dd>
                            </div>
                            </div>
                            <div class="row info-section">
                                <div class="col-md-12">
                                    <dt>주소</dt>
                                    <dd><input type="text" class="form-control" id="emp-add" value="${empDetail.emp_add}" readonly></dd>
                                </div>
                            </div>
                             
                        </form>
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
	
	// 수정
	 $('#edit-button').click(function () {
		 
		
	});


	// 저장
	$('#save-button').click(function() {
		
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
			
     		$('#edit-button').show();
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