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
        .button-position{
        	margin-left: 890px;
        }
        .button-position2{
        	margin-left: 1413px;
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
                        <form id="mypage-form" class="needs-validation" action="/mypage/update.do" method="post">
                            <div class="row">
                                <div class="col-8">
                                    <h1>${empDetail.emp_name} 사원 수정</h1>
                                </div>
                                <div class="col-4 text-end">
                                    <input type="button" onclick= "validateForm()" class="btn btn-success" value="저장" id="save-button">
                                    <input type="button" class="btn btn-secondary" value="취소" id="cancel-button">
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
                                        <div class="mt-3">
                                        <button type="button" id="emp-profile" class="btn btn-info">사진 변경</button>
                                        </div>
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
                                        <div class="col-md-12" >
                                            <dt>새 비밀번호</dt>
                                            <dd><input type="password" class="form-control" id="newPw"></dd>
                                            <dt>새 비밀번호 확인</dt>
                                            <dd><input type="password" class="form-control" id="newPwChk"></dd>
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
                                            <dd><input type="email" class="form-control" id="emp-email" value="${empDetail.emp_email}" onchange="overlayShow()" name="emp_email" required></dd>
                                            <div class="invalid-feedback">이메일을 올바른 형식으로 입력해주세요.</div>
                                            <div>
                        						<button type="button" id="overlay" class="btn btn-primary button-position" style="display: none;">중복확인</button>
                        					</div>
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
                                    <dd><input type="text" class="form-control" id="emp-extension-number" value="${empDetail.emp_extension_number}" name="emp-extension-number" required pattern="^070([0-9]{7,8})$"></dd>
                            </div>
                            </div>
                            <div class="row info-section">
                                <div class="col-md-12">
                                    <dt>주소</dt>
                                    <dd><input type="text" class="form-control" id="emp-add" name = "emp-add" value="${empDetail.emp_add}" readonly></dd>
                                    <dd id="emp-addDetail" style="display: none;"><input type="text" class="form-control"  value="" placeholder="상세주소"></dd>
                                    <div>
                        				<button type="button" id="searchPost" class="btn btn-primary button-position2">주소 검색</button>
                        			</div>
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

<!-- 다음 주소 api  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
var prEmail = '${empDetail.emp_email}';
var overChk = true;

console.log(prEmail);

$('#overlay').click(function overlay(){//이메일 중복 체크
	var email = $('input[name="emp_email"]').val();
	var emailPattern = /^[0-9a-zA-Z]([\-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if (email === '' || !emailPattern.test(email)) {
		
		showAlert('danger', '이메일을 올바른 형식으로 입력해주세요.');
		
	}else{
	$.ajax({
		type:'post', // method 방식
		url:'./emailOverlay.ajax', // 요청한 주소
		data:{'emp_email':email}, // 파라메터
		success:function(data){ // 통신 성공했을경우
		//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
		//여기에 뿌려준다
			console.log(data);
			if(data.use > 0){
				showAlert('danger', '이미 사용중인 이메일입니다.');
				$('input[name="emp_email"]').val('');
				overChk = false;
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
	
	
		
	});

	function overlayShow(){
	
		var email = $('input[name="emp_email"]').val();
		console.log('입력 이메일: ' + email);
		
		if (prEmail == email) {
			$('#overlay').hide();
			overChk = true;
		}else{
			$('#overlay').show();
			overChk = false;
		}
	
	
	};
	
	$('#searchPost').click(function (){
		document.getElementById("emp-add").value = '';
		
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
	             document.getElementById("emp-add").value = roadAddr;
	            
	             
	         }
	     }).open();
		 
			
		 $('#emp-addDetail').show();
		
		 
	 });
	


	
	
	var form = document.getElementById("mypage-form");
	//폼 전송 시 overChk 확인
	function validateForm() {
		var number = $('input[name="emp-extension-number"]').val();
		var numberPattern = /^070([0-9]{7,8})$/;
		var add = $('input[name="emp-add"]').val();
		
    	if (!overChk) {
   	 	showAlert('danger', '이메일 중복을 확인해주세요.');
       
   	 }else if(!numberPattern.test(number)){
   		showAlert('danger', '내선번호를 올바르게 입력해주세요.');
   	 }else if(add === ''){
   		showAlert('danger', '주소를 입력해주세요.');
   	 }else{
   	 	if (confirm("수정하시겠습니까?")) {
    		form.submit(); // 폼 전송 허용
			}else{
			showAlert('danger', '수정을 취소했습니다.');
			return false;
			}
    	}
	};

	
	
	
					
</script>

</html>