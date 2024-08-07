<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자원등록</title>

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

    <!-- EDITOR -->
    <link rel="stylesheet" href="/assets/editor/ckeditorstyle.css" />
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/42.0.0/ckeditor5.css" />
    <!-- 폰트 -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 따로 적용한 CSS -->

    <link rel="stylesheet" href="/assets/css/default.css">

    <!-- 데이트 피커 -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    
    <style >



    	
    </style>
   
  </head>

  <body>
    <!-- Page wrapper start -->
    
    <div>
    	<input type="text" id="test11">
    </div>
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
							class="text-decoration-none">자원 관리</a></li>
						<li class="breadcrumb-item"><a href="/resource/resourceWrite.go"
							class="text-decoration-none">자원 등록</a></li>
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

						<!-- Row start -->

						<div class="container mt-5">
	    <div class="row">
	        <div class="col-12">
	            <div class="card mb-3">
	                <div class="card-header">
	                    <h4 class="card-title">자원 등록</h4>
	                </div>
	                <div class="card-body">
	                    <!-- 기본 정보 -->
	                    <div class="card mb-4">
	                        <div class="card-body">
	                            <form id="resourceForm" action="/resource/resourceWrite.do" method="post" enctype="multipart/form-data">
	                                <div class="row mb-3">
	                                    <div class="col-md-6">
	                                        <label for="resourceName" class="form-label">자원명</label>
	                                        <input type="text" class="form-control" id="resourceName" name="resource_name" required>
	                                    </div>
	                                    <div class="col-md-6">
	                                        <label for="location" class="form-label">위치</label>
	                                        <input type="text" class="form-control" id="resourceLocation" name="resource_location" required>
	                                    </div>
	                                </div>
	                                <div class="row mb-3">
	                                    <div class="col-md-6">
	                                        <label for="resourceType" class="form-label">타입</label>
	                                        <select class="form-select" id="resourceType" name="resource_category" required>
	                                            <option value="">선택</option>
	                                            <option value="차량">차량</option>
	                                            <option value="회의실">회의실</option>
	                                            <option value="비품">비품</option>
	                                        </select>
	                                    </div>
	                                    <div class="col-md-6">
	                                        <label for="status" class="form-label">사용 가능 여부</label>
	                                        <div>
	                                            <div class="form-check form-check-inline">
	                                                <input class="form-check-input" type="radio" name="resource_state" id="statusUse" value="사용가능" checked>
	                                                <label class="form-check-label" for="statusUse">사용가능</label>
	                                            </div>
	                                            <div class="form-check form-check-inline">
	                                                <input class="form-check-input" type="radio" name="resource_state" id="statusNotUse" value="사용불가">
	                                                <label class="form-check-label" for="statusNotUse">사용불가</label>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="row">
										<div class="form-group col-md-6">
											<div id="dynamic-fields"></div>
										</div>
									</div>
	                              	<div class="row mb-3">
	                                    <div class="col-12">
	                                        <label for="detail" class="form-label">세부사항</label>
	                                        <div class="main-container main-container-custom">
	                                            <div class="editor-container" id="editor-container">
	                                                <div class="editor-container__editor">
	                                                    <div id="editor"></div>
	                                                </div>
	                                            </div>
	                                            <input type="hidden" name="resource_content" id="content">
	                                        </div>
	                                    </div>
                                	</div>
	
	                                <div class="d-flex justify-content-end">
	                                    <button type="button" class="btn btn-secondary me-2">취소</button>
	                                    <button type="button" class="btn btn-primary" onclick="submitClk()" id="submitBtn">저장</button>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	
	                    <!-- 버튼 -->
	                    
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
					<span>Â© Bootstrap Gallery 2024</span>
				</div>
				<!-- App footer end -->

			</div>
			<!-- App container ends -->

		</div>
		<!-- Main container end -->

	</div>

</body>

    <!-- Page wrapper end -->

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
    <script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
    <script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

    <!-- Calendar JS -->
    <script src="/assets/vendor/calendar/js/main.min.js"></script>
    <script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>

    
    <script src="/assets/js/localStorage.js"></script>
    <!-- 모멘트 -->
    <script src="/assets/js/moment.min.js"></script>
    
    <!-- 데이터 피커 -->
   <script src="/assets/vendor/daterange/daterange.js"></script>
   <script src="/assets/vendor/daterange/custom-daterange-mycab.js"></script>
    
    <!-- Custom JS files -->
    <script src="/assets/js/custom.js"></script>

 <script type="importmap">
    {
        "imports": {
            "ckeditor5": "https://cdn.ckeditor.com/ckeditor5/42.0.0/ckeditor5.js",
            "ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/42.0.0/"
        }
    }	
	</script>
	 <script type="module" src="/assets/editor/ckeditorjs.js"></script>
	<!--  
<script type="module" >
	import { makeEditor } from '/assets/editor/ckeditorjs.js'

	 makeEditor('#editor').catch(error => {
		    console.error('There was a problem initializing the editor:', error);
		});	

</script>
-->
    
  <script>

  $(document).ready(function() {
	  

	  
	    $('#resourceType').change(function() {
	        var type = $(this).val();
	        var dynamicFields = $('#dynamic-fields');
	        dynamicFields.empty();

	        if (type === '차량') {
	            dynamicFields.append(`
	                <div class="row">
	                    <div class="col-md-2 form-group">
	                        <label for="carLicencePlate">차량 번호</label>
	                        <input type="text" class="form-control" id="carLicencePlate" name="company_car_license_plate" required>
	                    </div>
	                    <div class="col-md-2 form-group">
	                        <label for="CarType">차종</label>
	                        <select class="form-control" id="carType" name="company_car_category" required>
		                        <option value="소형">소형</option>
		                        <option value="중형">중형</option>
		                        <option value="대형">대형</option>		            
                    		</select>
	                    </div>
	                    <div class="col-md-2 form-group">
	                        <label for="seatCount">좌석 수</label>
	                        <input type="number" class="form-control" id="seatCount" name="company_car_capacity" required>
	                    </div>
	                   
	                    <div class="col-md-5 form-group">
	                        <label for="mr-Photo">차량 사진</label>
	                        <input type="file" class="form-control" id="mr-Photo" name="photo" multiple="multiple">
              			</div>             			
	                </div>

	            `);
	        } else if (type === '회의실') {
	            dynamicFields.append(`
	                <div class="row">
	                    <div class="col-md-3 form-group">
	                        <label for="capacity">수용 인원</label>
	                        <input type="number" class="form-control" id="meetRoomCapacity" name="meeting_room_capacity" required>
	                    </div>
	                    <div class="col-md-5 form-group">
	                        <label for="car-Photo">좌석 배치도</label>
	                        <input type="file" class="form-control" id="car-Photo" name="photo" multiple="multiple">
          				</div> 
	                </div>	                
	            `);
	        } else if (type === '비품') {
	            dynamicFields.append(`
	                <div class="row">
	                    <div class="col-md-3 form-group">
	                        <label for="equipmentType">비품 종류</label>
	                        <select class="form-control" id="equipmentCategory" name="resource_equipment_category" required>
		                        <option value="">선택하세요</option>
		                        <option value="컴퓨터">컴퓨터</option>
		                        <option value="프린터">프린터</option>
		                        <option value="프로젝터">프로젝터</option>
		                        <option value="책상">책상</option>
		                        <option value="의자">의자</option>
		                        <option value="전화기">전화기</option>
		                        <option value="파일 캐비닛">파일 캐비닛</option>
	                    	</select>
	                    </div>
	                    <div class="col-md-5 form-group">
	                        <label for="eq-Photo">비품 사진</label>
	                        <input type="file" class="form-control" id="eq-Photo" name="photo" multiple="multiple">
      					</div> 
	                </div>
	            `);
	        }
	    });
	});
  
  function submitClk(){
	  console.log("에디터 작성된거", editor.getData());
	  var btn = document.getElementById("submitBtn")
	  document.getElementById("content").value = editor.getData();
	  btn.setAttribute("type","submit");
	  btn.click;
  }
	
  	
</script>



</html>