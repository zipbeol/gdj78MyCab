<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Finance</title>
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
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>

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

.filter-btn {
	background-color: #f8f9fa;
	color: #6c757d;
	border: 1px solid #ced4da;
	padding: 8px 16px;
	margin-right: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease, border-color
		0.3s ease;
}

/* 호버 효과 */
.filter-btn:hover {
	background-color: #e9ecef;
}

/* 액티브(선택된) 상태 */
.filter-btn.active {
	background-color: #0d6efd;
	color: #fff;
	border-color: #0d6efd;
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
						<li class="breadcrumb-item"><a href="notice/list.go"
							class="text-decoration-none">공지사항</a></li>
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
										<h4 class="card-title">공지사항 작성</h4>
									</div>
										<div class="card-body">
							                <!-- 공지사항 제목 -->
							                <div class="form-group">
											    <label for="noticeTitle" class="form-label">제목</label>
											    <div class="input-group">
											        <input type="text" id="noticeTitle" name="noticeTitle" class="form-control" required>
											        <div class="input-group-text">
											            <div class="form-check">
											                <input class="form-check-input" type="checkbox" id="importantCheckbox" name="importantCheckbox">
											                <label class="form-check-label" for="importantCheckbox">중요</label>
											            </div>
											        </div>
											    </div>
											</div>
							
							                <!-- 공지사항 대상 선택란 -->
							                <div class="form-group">
							                    <label for="noticeTarget" class="form-label">공지사항 대상</label>
							                    <select id="noticeTarget" name="noticeTarget" class="form-select" required>
							                        <option value="all">전체</option>
							                        <option value="humanResources">인사부</option>
							                        <option value="sales">영업부</option>
							                        <option value="salesSupport">영업지원부</option>
							                        <option value="TaxiManagement">택시관리부</option>
							                    </select>
							                </div>
							
							                <!-- 파일 첨부 -->
							                <div class="form-group">
							                    <label for="fileAttachment" class="form-label">파일 첨부</label>
							                    <input type="file" id="fileAttachment" name="fileAttachment" class="form-control" multiple>
							                </div>
							
							                <!-- 공지 내용 -->
							                <div class="form-group">
							                    <label for="noticeContent" class="form-label">공지 내용</label>
							                    <div id="noticeContent"></div>
							                </div>
							
							                <!-- 등록 버튼 -->
							                <div class="text-end mt-3">
							                    <button id="registerButton" class="btn btn-primary">등록</button>
							                </div>
							            </div>
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
    
	var category = '';
    
	
    
    // CKEditor 초기화

	ClassicEditor
        .create(document.querySelector('#noticeContent'), {
            toolbar: [
                'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote', 
                'imageUpload' // 이미지 업로드 버튼 추가
            ],
            language: 'ko',
            ckfinder: {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images&responseType=json',
            },
            image: {
                toolbar: [
                    'imageTextAlternative', 'imageStyle:full', 'imageStyle:side'
                ]
            }
        })
        .then(editor => {
            editorInstence = editor;
            editor.ui.view.editable.element.style.height = '400px';  // 여기서 높이를 설정합니다.
            console.log('Editor was initialized', editor);
        })
        .catch(error => {
            console.error(error);
        });


 

    $(document).ready(function() {
    	
        // 등록 버튼 클릭 시 등록 로직 실행
        $('#registerButton').click(function() {
            var formData = new FormData();
            formData.append('notice_title', $('#noticeTitle').val());
            formData.append('notice_field', $('#noticeTarget').val());
            var files = $('#fileAttachment')[0].files;
            for (var i = 0; i < files.length; i++) {
                formData.append('fileAttachment', files[i]);
            }
            formData.append('notice_content', editorInstence.getData());
            formData.append('notice_imp', $('#importantCheckbox').prop('checked'));
            

            $.ajax({
                url: '/notice/register.ajax',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                dateType: 'JSON',
                success: function(response) {
                    alert('등록이 성공적으로 완료되었습니다.');
                    window.location.href = '/notice/list';
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('등록에 실패하였습니다. 다시 시도해 주세요.');
                    console.error('Error:', textStatus, errorThrown);
                }
            });
        });
    });


        // 카테고리 이름을 출력하는 함수
        function categoryName(category) {
            console.log('Selected category:', category);
            // refreshNoticeList();
        }

    </script>
</body>
</html>
