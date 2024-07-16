<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">

</head>
<body>
<!-- Sidebar wrapper start -->
<nav id="sidebar" class="sidebar-wrapper">
    <!-- App brand starts -->
    <div class="app-brand px-3 py-2 d-flex align-items-center">
        <a href="/">
            <img src="/assets/images/logo.svg" class="logo" alt="Bootstrap Gallery">
        </a>
    </div>
    <!-- App brand ends -->

    <!-- Sidebar menu starts -->
    <div class="sidebarMenuScroll">
        <ul class="sidebar-menu">
            <li class="active current-page">
            </li>
            <li id="menu-notice">
                <a href="/notice/list">
                    <i class="fs-3 bi bi-pin-angle"></i>
                    <span class="menu-text">공지사항</span>
                </a>
            </li>

            <li id="menu-mypage" class="treeview">
                <a href="#!">
                    <i class="bi bi-postcard"></i>
                    <span class="menu-text">마이페이지</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-mypage-1" href="/mypage/profile.go">프로필</a>
                    </li>
                    <li>
                        <a id="menu-mypage-4" href="/attendance/myAttendance/list.go">근태 관리</a>
                    </li>
                    <li>
                        <a id="menu-mypage-2" href="/mypage/vac/list.go">연차 관리</a>
                    </li>
                    <li>
                        <a id="menu-mypage-3" href="/mypage/vacApply/list.go">연차 승인 및 반려</a>
                    </li>
                    
                </ul>
            </li>
            <li id="menu-chat">
                <a href="/chat/chat.go">
                    <i class="fs-3 bi bi-chat"></i>
                    <span class="menu-text">채팅</span>
                </a>
            </li>
            <li id="menu-mail" class="treeview">
                <a href="#!">
                    <i class="fs-3 bi bi-envelope"></i>
                    <span class="menu-text">메일</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-mail-1" href="/mail/write.go">메일 작성</a>
                    </li>
                    <li>
                        <a id="menu-mail-2" href="/mail/list.go">내가 보낸 메일함</a>
                    </li>
                </ul>
            </li>

            <li id="menu-calendar">
                <a href="/calendar/calendar.go">
                    <i class="bi bi-calendar2"></i>
                    <span class="menu-text">일정 관리</span>
                </a>
            </li>

            <li id="menu-taxi" class="treeview">
                <a href="#!">
                    <i class="bi bi-car-front"></i>
                    <span class="menu-text">택시 관리</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-taxi-1" href="/taxi/list.go">차량 관리</a>
                    </li>
                    <li>
                        <a id="menu-taxi-2" href="/driver/list.go">기사 관리</a>
                    </li>
                    <li>
                        <a id="menu-taxi-3" href="/triprecord/list.go">운행 기록 관리</a>
                    </li>
                </ul>
            </li>
            <li id="menu-approval" class="treeview">
                <a href="#!">
                    <i class="bi bi-layout-text-window-reverse"></i>
                    <span class="menu-text">전자 결재</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-approval-1" href="/approval/approvalWriteForm.go">기안서 작성</a>
                    </li>
                    <li>
                        <a id="menu-approval-2" href="/approval/myapproval.go">내 결재 관리</a>
                    </li>
                    <c:if test="${sessionScope.loginId == 30002}"> <!-- 나중에 변경할 예정 ( 대현 ) -->
                        <li>
                            <a id="menu-approval-3" href="/approval/approvalIntegration.go">결재 통합 관리</a>
                        </li>
                    </c:if>
                </ul>
            </li>

            <li id="menu-emp" class="treeview">
                <a href="#!">
                    <i class="bi bi-person"></i>
                    <span class="menu-text">인사 관리</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-emp-1" href="/attendance/attendance/list.go">근태 관리</a>
                    </li>
                    <li>
                        <a id="menu-emp-2" href="/emp/emp/create.go">사원 등록</a>
                    </li>
                    <li>
                        <a id="menu-emp-3" href="/emp/hremp/list.go">사원 관리</a>
                    </li>
                    <li>
                        <a id="menu-emp-4" href="/emp/vac/list.go">연차 관리</a>
                    </li>
                    <li>
                        <a id="menu-emp-5" href="/emp/vac/finalList.go">연차 승인 및 반려</a>
                    </li>
                    <li>
                        <a id="menu-emp-7" href="/emp/sal/list.go">급여 관리</a>
                    </li>
                    <li>
                        <a id="menu-emp-8" href="/emp/driver/list.go">기사 정산 관리</a>
                    </li>
                    <li>
                        <a id="menu-emp-9" href="/emp/orgchart/list.go">조직도</a>
                    </li>
                    <li>
                        <a href="/emp/emp/list.go">사원 조회</a>
                    </li>
                </ul>
            </li>
            <li id="menu-finance" class="treeview">
                <a href="#!">
                    <i class="bi bi-pie-chart"></i>
                    <span class="menu-text">재무 관리</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-finance-1" href="/finance/profit/list.go">수익</a>
                    </li>
                    <li>
                        <a id="menu-finance-2" href="/finance/expenses/list.go">지출</a>
                    </li>
                    <li>
                        <a id="menu-finance-3" href="/finance/deal/list.go">거래 내역</a>
                    </li>
                    <li>
                        <a id="menu-finance-4" href="/finance/dash.go">대시 보드</a>
                    </li>
                </ul>
            </li>
            <li id="menu-resource" class="treeview">
                <a href="#!">
                    <i class="bi bi-box"></i>
                    <span class="menu-text">자원 관리</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-resource-1" href="/resource/resourceWrite.go">자원 등록</a>
                    </li>
                    <li>
                        <a id="menu-resource-2" href="/resource/list.go">자원 예약</a>
                    </li>
                    <li>
                        <a id="menu-resource-3" href="/resource/myReservationList.go">내 예약</a>
                    </li>
                    
                </ul>
            </li>
            <li id="menu-log" class="treeview">
                <a href="#!">
                    <i class="bi bi-terminal"></i>
                    <span class="menu-text">로그 관리</span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a id="menu-log-1" href="/mail/admin/list.go">메일 로그</a>
                    </li>
                    <li>
                        <a id="menu-log-2" href="/chat/admin/list.go">채팅 로그</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>


    <!-- Sidebar menu ends -->

</nav>
<!-- Sidebar wrapper end -->

</body>