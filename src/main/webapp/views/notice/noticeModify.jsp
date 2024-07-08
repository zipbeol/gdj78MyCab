<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Notice Edit</title>
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

<!-- CSS Files -->
<link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- Vendor Css Files -->
<link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">

<!-- Toast UI Editor CSS -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">

<style>
    body {
        font-size: 1.1rem;
        background-color: #f4f6f9; /* 배경색 추가 */
    }
    .card {
        border: none; /* 카드 테두리 제거 */
        border-radius: 8px; /* 카드 모서리 둥글게 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 카드 그림자 */
    }
    .card-header {
        background-color: #007bff; /* 카드 헤더 배경색 */
        color: white; /* 카드 헤더 글자색 */
        border-bottom: none; /* 카드 헤더 테두리 제거 */
        border-radius: 8px 8px 0 0; /* 카드 헤더 모서리 둥글게 */
    }
    .card-body {
        background-color: white; /* 카드 바디 배경색 */
        border-radius: 0 0 8px 8px; /* 카드 바디 모서리 둥글게 */
    }
    .detail-label {
        font-weight: bold;
        background-color: #e9ecef; /* 라벨 배경색 */
        padding: 10px;
        vertical-align: middle;
        text-align: center;
    }
    .detail-content {
        padding: 10px;
        border: 1px solid #dee2e6;
        background-color: #f8f9fa; /* 내용 배경색 */
    }
    .content-height {
        height: 500px;
        overflow: auto;
    }
    .no-border {
        border: none;
    }
    .action-buttons {
        text-align: right;
    }
    .action-buttons .btn {
        margin-left: 5px;
        min-width: 60px;
        border-radius: 50px;
        border: none;
        color: white;
    }
    .action-buttons .btn-primary {
        background-color: #007bff; /* 기본 버튼 배경색 */
    }
    .action-buttons .btn-primary:hover {
        background-color: #0056b3; /* 기본 버튼 호버 색상 */
    }
    .action-buttons .btn-secondary {
        background-color: #6c757d; /* 보조 버튼 배경색 */
    }
    .action-buttons .btn-secondary:hover {
        background-color: #5a6268; /* 보조 버튼 호버 색상 */
    }
</style>
</head>

<body>
    <div class="page-wrapper">
        <div class="main-container">
            <jsp:include page="../sidebar.jsp" />
            <div class="app-container">
                <div class="app-header d-flex align-items-center">
                    <div class="d-flex">
                        <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                            <i class="bi bi-list fs-5"></i>
                        </button>
                        <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                            <i class="bi bi-list fs-5"></i>
                        </button>
                    </div>
                    <div class="app-brand-sm d-lg-none d-sm-block">
                        <a href="/"> <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                        </a>
                    </div>
                    <ol class="breadcrumb d-none d-lg-flex ms-3">
                        <li class="breadcrumb-item"><a href="/"><i class="bi bi-house lh-1"></i></a> <a href="/" class="text-decoration-none">메인</a></li>
                        <li class="breadcrumb-item"><a href="./list" class="text-decoration-none">공지사항</a></li>
                        <li class="breadcrumb-item"><a href="./detail.go?notice_idx=${noticeModi.notice_idx}" class="text-decoration-none">상세보기</a></li>
                        <li class="breadcrumb-item"><a href="./modify.go?notice_idx=${noticeModi.notice_idx}" class="text-decoration-none">공지사항 수정</a></li>
                    </ol>
                    <jsp:include page="../appHeader.jsp" />
                </div>
                <div class="app-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <h4 class="card-title">공지사항 수정</h4>
                                    </div>
                                    <div class="card-body">
                                        <form id="noticeForm" action="/notice/noticeUpdate.ajax" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="notice_id" value="${noticeModi.notice_idx}" />
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="detail-label" style="width: 15%">작성자</td>
                                                            <td class="detail-content" style="width: 85%">
                                                                <input type="text" name="notice_writer" value="${noticeModi.notice_writer}" class="form-control" readonly/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="detail-label">제목</td>
                                                            <td class="detail-content">
                                                                <div class="input-group">
                                                                    <input type="text" id="noticeTitle" name="notice_title" value="${noticeModi.notice_title}" class="form-control" />
                                                                    <div class="input-group-text">
                                                                        <input class="form-check-input mt-0" type="checkbox" id="importantCheckbox" name="importantCheckbox" ${noticeModi.notice_imp ? 'checked' : ''}>
                                                                        <label class="form-check-label ms-2" for="importantCheckbox">중요</label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <!-- 공지사항 대상 선택란 추가 -->
                                                        <tr>
                                                            <td class="detail-label">공지사항 대상</td>
                                                            <td class="detail-content">
                                                                <select id="noticeTarget" name="noticeTarget" class="form-select" required>
                                                                    <option value="all" ${noticeModi.notice_field == 'all' ? 'selected' : ''}>전체</option>
                                                                    <option value="humanResources" ${noticeModi.notice_field == 'humanResources' ? 'selected' : ''}>인사부</option>
                                                                    <option value="sales" ${noticeModi.notice_field == 'sales' ? 'selected' : ''}>영업부</option>
                                                                    <option value="salesSupport" ${noticeModi.notice_field == 'salesSupport' ? 'selected' : ''}>영업지원부</option>
                                                                    <option value="TaxiManagement" ${noticeModi.notice_field == 'TaxiManagement' ? 'selected' : ''}>택시관리부</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="detail-label">첨부 파일</td>
                                                            <td class="detail-content">
                                                                <c:if test="${list.size() > 0}">
                                                                    <c:forEach items="${list}" var="path">
                                                                        <div class="d-flex align-items-center existing-file">
                                                                            <a href="download/${path.notice_attach_file}" class="me-2">${path.notice_attach_file} 다운로드</a>
                                                                            <button type="button" class="btn btn-danger btn-sm delete-file-btn" id="${path.notice_attach_file_idx}">삭제</button>
                                                                            <input type="hidden" name="existingFiles" value="${path.notice_attach_file}">
                                                                        </div>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <input type="file" id="fileAttachment" name="fileAttachment" class="form-control mt-2" multiple />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="detail-label">내용</td>
                                                            <td class="detail-content content-height">
                                                                <div id="noticeContent"></div>
                                                                <textarea name="notice_content" id="noticeContentTextArea" class="form-control d-none">${noticeModi.notice_content}</textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="detail-label" style="text-align: right;">작성 일시</td>
                                                            <td class="detail-content" style="text-align: right;">${noticeModi.notice_date}</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="detail-label" style="text-align: right;">비활성화</td>
                                                            <td class="detail-content" style="text-align: right;">
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name="disabled" ${noticeModi.notice_stat == '비활성화' ? 'checked' : ''}>
                                                                    <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="action-buttons mt-3">
                                                <button type="button" id="noticeUpdate" class="btn btn-primary">등록</button>
                                                <a href="./list" class="btn btn-secondary">취소</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="app-footer">
                    <span>GDJ78FINALPROJECTMYCAB</span>
                </div>
            </div>
        </div>
    </div>

    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/LocalStorage.js"></script>
    <script src="/assets/js/jquery.twbsPagination.min.js"></script>
    <script>
    $(document).ready(function() {
        const editor = new toastui.Editor({
            el: document.querySelector('#noticeContent'),
            height: '500px',
            initialEditType: 'wysiwyg',
            previewStyle: 'vertical',
            initialValue: $('#noticeContentTextArea').val() // 기존 내용을 에디터에 로드
        });

        // 툴바에서 코드와 코드 블록 제거
        editor.removeToolbarItem('code');
        editor.removeToolbarItem('codeblock');

        // 폼 제출 이벤트
        $('form').submit(function() {
            const noticeContent = editor.getHTML().trim();
            if (!noticeContent) {
                alert('공지 내용을 작성해 주세요.');
                return false;
            }

            // 내용 용량 확인
            const MAX_CONTENT_SIZE = 5 * 1024 * 1024; // 5MB
            if (new Blob([noticeContent]).size > MAX_CONTENT_SIZE) {
                alert('내용의 용량이 초과되었습니다. 이미지의 크기나 갯수를 줄여 주세요.');
                return false;
            }

            $('#noticeContentTextArea').val(noticeContent);
            return true;
        });

        var deleteList = [];
        
        // 첨부 파일 삭제 버튼 클릭 이벤트
        $('.delete-file-btn').click(function() {
            const noticeDeleteBtn = $(this).attr('id');
            const $fileDiv = $(this).closest('.existing-file');
            deleteList.push(noticeDeleteBtn);
            $fileDiv.remove(); // 파일 항목을 DOM에서 제거
            
        });

        $('#noticeUpdate').on('click', function() {
        	console.log(deleteList);
        	if(!confirm('해당 공지사항을 수정 하시겠습니까?')){
        		return ;
        	}
        	for (var dele of deleteList) {
        		console.log(deleteList[i]);
        	$.ajax({
                url: '/notice/deleteAttachment.ajax',
                type: 'POST',
                data: {
                    'notice_attach_file_idx' : dele
                },
                success: function(response) {
                },
                error: function(xhr, status, error) {
                    alert("파일 삭제에 실패하였습니다.");
                }
            });
			}
        	
            var noticeTitle = $('#noticeTitle').val();
            var noticeContent = editor.getHTML().trim();
            var noticeImp = $('#importantCheckbox').prop('checked') ? 'true' : 'false';
            var noticeTarget = $('#noticeTarget').val();
            var isDisabled = $('#flexSwitchCheckDefault').prop('checked') ? '비활성화' : '공개';
            
            if (!noticeTitle) {
                alert('공지 제목을 작성해주세요.');
                return;
            }

            var tempElement = document.createElement('div');
            tempElement.innerHTML = noticeContent;
            if (!tempElement.textContent.trim()) {
                alert('공지 내용을 작성해 주세요.');
                return;
            }

            // 내용 용량 확인
            const MAX_CONTENT_SIZE = 5 * 1024 * 1024; // 5MB
            if (new Blob([noticeContent]).size > MAX_CONTENT_SIZE) {
                alert('내용의 용량이 초과되었습니다. 이미지의 크기나 갯수를 줄여 주세요.');
                return;
            }

            var formData = new FormData();
            formData.append('notice_idx', ${noticeModi.notice_idx});
            formData.append('notice_title', noticeTitle);
            formData.append('notice_imp', noticeImp);
            formData.append('notice_field', noticeTarget);
            formData.append('notice_stat', isDisabled);
            formData.append('notice_content', noticeContent);

            // 파일 추가
            var uploadFile = document.getElementById('fileAttachment');
            if (uploadFile.files.length > 0) {
                for (var i = 0; i < uploadFile.files.length; i++) {
                    formData.append('fileAttachment', uploadFile.files[i]);
                }
            }

            // AJAX 요청 전송
            $.ajax({
                url: '/notice/noticeUpdate.ajax',
                type: 'POST',
                dataType: 'json',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    if (response.status === 'error') {
                        alert(response.message); // 경고 메시지 표시
                    } else {
                        alert(response.message); // 성공 메시지 표시
                        window.location.href = './detail.go?notice_idx=' + ${noticeModi.notice_idx};
                    }
                },
                error: function() {
                    alert("수정에 실패 하였습니다. 다시 시도해 주세요.");
                }
            });
        });
    });
    </script>
</body>
</html>
