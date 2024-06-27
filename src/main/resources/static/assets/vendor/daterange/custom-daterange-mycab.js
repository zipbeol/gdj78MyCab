// Date Range
$(".datepicker").daterangepicker({
	singleDatePicker: true,
	showOtherMonths: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "YYYY-MM-DD",
		daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	},
	onSelect: function(){
		console.log("데이트피커 클릭됨");
		var startStr = document.getElementsByName('sel-start-date')[0];
	    var endStr = document.getElementsByName('sel-end-date')[0];
	    console.log(startStr);
	    console.log(endStr);
	    if (startStr.value>endStr.value) {
	      alert("시작일보다 종료일이 더 빠릅니다");
	    }
   		startStr.focus;
	}
});

// Date Range Opens Left
$(".datepicker-opens-left").daterangepicker({
	singleDatePicker: true,
	opens: "left",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-week-numbers").daterangepicker({
	singleDatePicker: true,
	showWeekNumbers: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-iso-week-numbers").daterangepicker({
	singleDatePicker: true,
	showISOWeekNumbers: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-time").daterangepicker({
	singleDatePicker: true,
	timePicker: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY hh:mm A",
	},
});

$(".datepicker-time-24").daterangepicker({
	drops: "down",
	singleDatePicker: true,
	timePicker: true,
	timePicker24Hour: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
	ormat: "YYYY/MM/DD",
		daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		format: "YYYY/MM/DD hh:mm A",
	},
});

$(".datepicker-time-seconds").daterangepicker({
	drops: "up",
	singleDatePicker: true,
	timePicker: true,
	timePicker24Hour: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY hh:mm:ss A",
	},
});

$(".datepicker-range").daterangepicker({
	drops: "down",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "YYYY/MM/DD",
	},
});

$(".datepicker-range-week-numbers").daterangepicker({
	drops: "up",
	showWeekNumbers: true,
	opens: "left",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-iso-week-numbers").daterangepicker({
	drops: "up",
	opens: "left",
	showWeekNumbers: true,
	showISOWeekNumbers: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-time").daterangepicker({
	drops: "up",
	timePicker: true,
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY hh:mm A",
	},
});

$(".datepicker-range-time-24").daterangepicker({
	drops: "up",
	timePicker: true,
	timePicker24Hour: true,
	opens: "left",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY hh:mm A",
	},
});

$(".datepicker-range-left").daterangepicker({
	opens: "left",
	drops: "up",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-right").daterangepicker({
	opens: "right",
	drops: "up",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-top-right").daterangepicker({
	opens: "right",
	drops: "up",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-top-left").daterangepicker({
	opens: "left",
	drops: "up",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

$(".datepicker-range-auto-apply").daterangepicker({
	autoApply: true,
	drops: "up",
	opens: "left",
	startDate: moment().startOf("hour"),
	endDate: moment().startOf("hour").add(32, "hour"),
	locale: {
		format: "DD/MM/YYYY",
	},
});

// Custom Date Range
$(function () {
	var start = moment().subtract(29, "days");
	var end = moment();
	function cb(start, end) {
		$(".custom-daterange span").html(
			start.format("MMM D, YYYY") + " - " + end.format("MMM D, YYYY")
		);
	}
	$(".custom-daterange").daterangepicker(
		{
			opens: "right",
			startDate: start,
			endDate: end,
			ranges: {
				Today: [moment(), moment()],
				Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
				"Last 7 Days": [moment().subtract(6, "days"), moment()],
				"Last 30 Days": [moment().subtract(29, "days"), moment()],
				"Last Month": [
					moment().subtract(1, "month").startOf("month"),
					moment().subtract(1, "month").endOf("month"),
				],
			},
		},
		cb
	);
	cb(start, end);
});

// Custom Date Range
$(function () {
	var start = moment().subtract(29, "days");
	var end = moment();
	function cb(start, end) {
		$(".custom-daterange2 span").html(
			start.format("MMM D, YYYY") + " - " + end.format("MMM D, YYYY")
		);
	}
	$(".custom-daterange2").daterangepicker(
		{
			autoApply: true,
			opens: "left",
			startDate: start,
			endDate: end,
			ranges: {
				Today: [moment(), moment()],
				Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
				"Last 7 Days": [moment().subtract(6, "days"), moment()],
				"Last 30 Days": [moment().subtract(29, "days"), moment()],
				"Last Month": [
					moment().subtract(1, "month").startOf("month"),
					moment().subtract(1, "month").endOf("month"),
				],
			},
		},
		cb
	);
	cb(start, end);
});
