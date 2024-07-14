<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인</title>
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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- js  -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">

<!-- 켈린더 -->
<link rel="stylesheet" href="/assets/vendor/calendar/css/main.min.css">
<link rel="stylesheet" href="/assets/vendor/calendar/css/custom.css">
    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
.cardH {
	min-height: 400px;
}

.news-item {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.news-item img {
	width: 50px;
	height: 50px;
	margin-right: 10px;
	object-fit: cover;
}

.news-item a {
	display: block;
	font-size: 1rem;
	color: #000;
	text-decoration: none;
}

.news-item p {
	margin: 0;
	font-size: 0.8rem;
	color: #666;
}

.st {
	margin-left: -28px;
}

.moreNews-container {
	text-align: right;
	margin-top: 20px;
}

.moreNews {
	font-size: 1rem;
	color: #007bff;
	text-decoration: none;
}

.moreNews:hover {
	text-decoration: underline;
}
	.map-container {
        position: relative;
	    width: 100%;
	    height: 326px;
	    background-image: url(/assets/images/mapimg.png);
	    background-size: cover;
	    background-repeat: round;
	    overflow: hidden;
     }
     .data-point {
		position: absolute;
	    background-color: rgba(255, 255, 255, 0.8);
	    padding: 0px;
	    border-radius: 10px;
	    font-size: 11px;
	    text-align: center;
	    width: 10%;
		}
     /* Example positions for the data points */
     .data-point.seoul {
         top: 100px;
         left: 300px;
     }
     .data-point.busan {
         top: 600px;
         left: 500px;
     }
     .up, .down{
     
     }
     #selectableCalendar{
     	height: 500px;
     }
     .appTable{
     	border: 1px solid lightgray;
     	font-size: 10px;
     }


      .table th, .table td {
          border-top: 1px solid #dee2e6;
          border-bottom: 1px solid #dee2e6;
          padding: 12px;
          text-align: left;       /* 줄 바꿈을 하지 않습니다. */
          overflow: hidden;          /* 넘치는 내용을 숨깁니다. */
          text-overflow: ellipsis;   /* 넘치는 텍스트에 "..."을 추가합니다. */
      }

.carousel-inner img {
	height: 330px;
}

.time-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.time-info {
	text-align: center;
	flex: 1;
	font-size: 1.5em; /* 글자 크기 조절 */
}

.clock {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 2.5em;
	color: #333;
	font-weight: bold;
}

.clock div {
	margin: 0 5px;
	padding: 10px;
	background: #f0f0f0;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
							class="text-decoration-none">메인</a> <!-- 여기에 경로 추가 --></li>
					</ol>
					<!-- Bread
                <!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
					<!-- App header actions end -->

				</div>

				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">

					<div class="container-fluid">
						<div class="row">
							<!-- 왼쪽 상단 공지 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">공지사항</h2>
										<!-- 여기에 공지 내용을 넣으세요 -->
										<div id="carouselExampleIndicators" class="carousel slide"
											data-bs-ride="carousel" data-bs-interval="2000">
											<div class="carousel-indicators">
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="0" class="active" aria-current="true"
													aria-label="Slide 1"></button>
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="1" aria-label="Slide 2"></button>
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="2" aria-label="Slide 3"></button>
											</div>
											<div class="carousel-inner">
												<div class="carousel-item active">
													<a href="/notice/detail.go?notice_idx=58"> <img
														src="/assets/notice1.png" id="img1" class="d-block w-100">
													</a>
												</div>
												<div class="carousel-item">
													<a href="/notice/detail.go?notice_idx=56"> <img
														src="/assets/notice2.png" id="img2" class="d-block w-100">
													</a>
												</div>
												<div class="carousel-item">
													<a href="/notice/detail.go?notice_idx=57"> <img
														src="/assets/notice3.png" id="img3" class="d-block w-100">
													</a>
												</div>
											</div>
											<button class="carousel-control-prev" type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 왼쪽 상단 뉴스 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">택시 뉴스</h2>
										<hr />
										<c:if test="${not empty newsList}">
											<ul class="st">
												<c:forEach var="news" items="${newsList}">
													<li class="news-item"><img src="${news.image}"
														alt="${news.title}">
														<div>
															<a href="${news.link}" target="_blank"> <c:choose>
																	<c:when test="${fn:length(news.title) > 8}">

                                    ${fn:substring(news.title, 0, 25)}...
                                </c:when>
																	<c:otherwise>
									                                    ${news.title}
									                                </c:otherwise>
																</c:choose>
															</a>
															<p>${news.date}</p>
														</div></li>
												</c:forEach>
											</ul>
										</c:if>
										<div class="moreNews-container">
											<a class="moreNews"
												href="http://taxi-news.co.kr/bbs/board.php?bo_table=board_01"
												target="_blank">뉴스 더보기</a>

										</div>
									</div>
								</div>
							</div>
							<!-- 오른쪽 상단 월 별 수익 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">전국 유가 정보</h2>
										 <div class="map-container">
									        <div class="main_map" id="all_img_map">
											    <div class="main_map" id="all_img_map">
												    <div class="data-point Seoul up" id="m_11" style="top: 11%; left: 25%;">
							                            <span class="title">서울</span>
							                            <span class="price" id="SIDO01_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Incheon up" id="m_28" style="top: 12%; left: 12%;">
							                            <span class="title">인천</span>
							                            <span class="price" id="SIDO15_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Gyeonggi up" id="m_41" style="top: 6%; left: 36%;">
							                            <span class="title">경기</span>
							                            <span class="price" id="SIDO02_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Gangwon up" id="m_42" style="top: 10%; left: 60%;">
							                            <span class="title">강원</span>
							                            <span class="price" id="SIDO03_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Chungbug up" id="m_43" style="top: 26%; left: 47%;">
							                            <span class="title">충북</span>
							                            <span class="price" id="SIDO04_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Chungnam down" id="m_44" style="top: 32%; left: 19%;">
							                            <span class="title">충남</span>
							                            <span class="price" id="SIDO05_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Jeonbuk down" id="m_45" style="top: 49%; left: 21%;">
							                            <span class="title">전북</span>
							                            <span class="price" id="SIDO06_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Jeonam down" id="m_46" style="top: 71%; left: 12%;">
							                            <span class="title">전남</span>
							                            <span class="price" id="SIDO07_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Gyeongbuk down" id="m_47" style="top: 34%; left: 74%;">
							                            <span class="title">경북</span>
							                            <span class="price" id="SIDO08_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Gyeongnam down" id="m_48" style="top: 59%; left: 53%;">
							                            <span class="title">경남</span>
							                            <span class="price" id="SIDO09_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Jeju up" id="m_50" style="top: 88%; left: 17%;">
							                            <span class="title">제주</span>
							                            <span class="price" id="SIDO11_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Busan down" id="m_26" style="top: 60%; left: 77%;">
							                            <span class="title">부산</span>
							                            <span class="price" id="SIDO10_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Daegu down" id="m_27" style="top: 46%; left: 71%;">
							                            <span class="title">대구</span>
							                            <span class="price" id="SIDO14_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Gwangju down" id="m_29" style="top: 60%; left: 19%;">
							                            <span class="title">광주</span>
							                            <span class="price" id="SIDO16_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Daejeon up" id="m_30" style="top: 39%; left: 36%;">
							                            <span class="title">대전</span>
							                            <span class="price" id="SIDO17_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Ulsan down" id="m_31" style="top: 50%; left: 88%;">
							                            <span class="title">울산</span>
							                            <span class="price" id="SIDO18_AVG_P">loading</span>
							                        </div>
							                        <div class="data-point Saison up" id="m_36" style="top: 28%; left: 32%;">
							                            <span class="title">세종</span>
							                            <span class="price" id="SIDO19_AVG_P">loading</span>
							                        </div>
												</div>
											</div>
									    </div>
									</div>
								</div>
							</div>
							<!-- 오른쪽 상단 월 별 지출 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">내 결재현황</h2>
				                        <table class="table appTable">
				                            <thead>
				                                <tr>
				                                    <th>기안일자</th>
				                                    <th>제목</th>
				                                    <th>기안자</th>
				                                    <th>결재일</th>
				                                    <th>결재상태</th>
				                                </tr>
				                            </thead>
				                                <tbody id="approvalDataBody">
				        						<!-- 데이터가 동적으로 추가될 부분 -->
				   								</tbody>
				                        </table>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 왼쪽 하단 공지 및 이벤트 -->
							<div class="col-md-6">
								<div class="card mb-3">
									<div class="card-body">
										<h2 class="chart-title"></h2>
										<div class="time-section">
											<div class="time-info">
												<span>오늘의 출근 시간</span>
												<br/>
												<div class="clock">
													<div>${att_hour}</div>
													시
													<div>${att_minute}</div>
													분
												</div>
											</div>
											<div class="time-info">
												<span>퇴근까지 남은 시간</span>
												<br/>
												<div class="clock">
													<div id="remainingHours">00</div>
													시
													<div id="remainingMinutes">00</div>
													분
												</div>
											</div>
										</div>
										<hr/>
										
										<canvas id="attendanceChart"></canvas>
										
										
										
										
									</div>
								</div>
							</div>
							<!-- 오른쪽 하단 기타 -->
							<div class="col-md-6">
								<div class="card mb-3">
									<div class="card-body">
										<h2 class="chart-title">주간일정</h2>
										<div id="selectableCalendar"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

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


	<!-- Custom JS files -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/localStorage.js"></script>
	
	<!-- 캘린더 js -->
	<script src="/assets/vendor/calendar/js/main.min.js"></script>
	<script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>
</body>
<script>
	// 스크립트
	var calendar;
	
	
	var message = "${message}";
	if (message) {
		alert(message);
	}
	
	$(document).ready(function(){
		getFuelInfo();
		getCalendar();
		getMyappList();
			
	});
	
	function getFuelInfo(){
		$.ajax({
            type: "POST",
            url: "/main/getFuelInfo.ajax", //  Update with your server endpoint
            data: {},
        	dataType : 'json',
            success: function(response) {
            	console.log("유가정보 가져옴");
                var fuelInfo = response.getFuelList;
                for (let fuel of fuelInfo) {
                	console.log("유가정보 가져온거",fuel);
					var fuelId = document.getElementById(fuel.priceId);
					console.log(fuelId);
					fuelId.innerHTML = fuel.priceText;
				}
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
		
	}
	
	function getCalendar(){
		
		var calendarEl = document.getElementById("selectableCalendar");
		
		 calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar: {
				left: "prev,next today",
				center: "title",
				right: false,
			},
			initialView: 'timeGridWeek', 
			locale: 'ko',
			slotEventOverlap: true, // Allow events to overlap
			initialDate: new Date(),
			navLinks: true, // can click day/week names to navigate views
			selectable: false,
			selectMirror: true,
			select: function (arg) {	
				
			},
			
			events: function(fetchInfo, successCallback, failureCallback){
				console.log(fetchInfo);
				console.log(successCallback);
				console.log(failureCallback);
				$.when(
					    $.ajax({
					        type: "GET",
					        url: "/calendar/listCall.ajax",
					        data: {
					            'schedule_editor': "${sessionScope.loginId}"
					        },
					        dataType: "json"
					    }),
					    $.ajax({
					        type: "GET",
					        url: "/calendar/shareCalListCall.ajax",
					        data: {
					            'schedule_editor': "${sessionScope.loginId}"
					        },
					        dataType: "json"
					    })
					).done(function(response1, response2) {
						console.log("요청 끝났지롱");
					    var events = [];
					    
					    // 첫 번째 AJAX 호출의 응답 처리
					    var listResponse = response1[0]; // response1[0]에 실제 응답 데이터가 들어 있습니다.
					    for (var i = 0; i < listResponse.length; i++) {
					        var res = listResponse[i];
					        var event = {
					            id: res.schedule_idx,
					            title: res.schedule_name,
					            content: res.schedule_content,
					            start: res.schedule_start_date,
					            end: res.schedule_end_date,
					            color: res.schedule_color,
					            category: res.schedule_category
					        };
					        events.push(event);
					    }

					    // 두 번째 AJAX 호출의 응답 처리
					    var shareCalListResponse = response2[0]; // response2[0]에 실제 응답 데이터가 들어 있습니다.
					    for (var i = 0; i < shareCalListResponse.length; i++) {
					        var res = shareCalListResponse[i];
					        var event = {
					            id: res.schedule_idx,
					            title: res.schedule_name,
					            content: res.schedule_content,
					            start: res.schedule_start_date,
					            end: res.schedule_end_date,
					            color: res.calendar_color,
					            category: res.schedule_category,
					            shareIdx: res.calendar_idx,
					            calName: res.calendar_name
					        };
					        events.push(event);
					    }

					    console.log('Events:', events);
					    successCallback(events);

					}).fail(function() {
					    alert("캘린더 불러오기에 실패했습니다.");
					});
			}
		});
	
		calendar.render();
	}
	
	function getMyappList(){
		        $.ajax({
		            url: '/getApprovalData.ajax',
		            type: 'POST',
		            data: {
		            	page: '1'
		            },
		            dataType: 'json',
		            success: function(response) {
		                $('#approvalDataBody').empty();
						var count = 0;
						response.data.forEach(function(item) {
						        const row = `
						            <tr>
						        		<td>\${formatDate(item.approval_doc_write_date) || ''}</td>
						                <td> <a href = approval/myapproval.go> \${item.approval_doc_title}</a></td>
						                <td>\${item.approval_doc_id}</td>
						                <td>\${item.approval_doc_udt_dt || ''}</td>
						                <td>\${getApprovalStateText(item.approval_doc__state)}</td>
						            </tr>
						        `;
						        $('#approvalDataBody').append(row);
						    
						});
		            },
		            error: function(xhr, status, error) {
		                console.error('데이터를 가져오는 중 오류 발생:', error);
		            }
		        });
		
	}
	
    function getApprovalStateText(state) {
        if (state === 1) return '중간 결재 완료';
        if (state === 2) return '결재 완료';
        return '진행 중';
    }
    function formatDate(dateTime) {
        return dateTime.split(' ')[0];
    }

    
    
	function updateRemainingTime() {
        var now = new Date();
        var endTime = new Date();
        endTime.setHours(18, 0, 0, 0);

        var diff = endTime - now;
        if (diff > 0) {
            var hours = Math.floor(diff / (1000 * 60 * 60));
            var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

            document.getElementById("remainingHours").innerText = hours.toString().padStart(2, '0');
            document.getElementById("remainingMinutes").innerText = minutes.toString().padStart(2, '0');
        } else {
            document.getElementById("remainingHours").innerText = "00";
            document.getElementById("remainingMinutes").innerText = "00";
        }
    }

    window.onload = updateRemainingTime;
    setInterval(updateRemainingTime, 60000);
    
    
    
    // Chart.js 막대 차트 설정
    var ctx = document.getElementById('attendanceChart').getContext('2d');
    var attendanceChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels:  ["5월", "6월", "7월"],
            datasets: [
                {
                    label: '지각',
                    data: ${late},
                    backgroundColor: '#FF7E9D',
                    borderColor: 'white',
                    borderWidth: 1
                },
                {
                    label: '출근',
                    data: ${present},
                    backgroundColor: '#3CB4FF',
                    borderColor: 'white',
                    borderWidth: 1
                },
                {
                    label: '연차/반차',
                    data: ${absent},
                    backgroundColor: '#9696FF',
                    borderColor: 'white',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</html>