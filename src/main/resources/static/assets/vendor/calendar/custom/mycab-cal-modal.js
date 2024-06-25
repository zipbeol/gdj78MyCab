document.addEventListener("DOMContentLoaded", function(){
	$.ajax({
        type: "GET",
        url: "/calendar/listCall.ajax",
        data: {},
        dataType: "json",
		success: function(response) {
			var events = [];
            
          	for (var i = 0; i < response.length; i++) {
                var res = response[i];
                var event = {
                	title: res.schedule_name,
                    content: res.schedule_content,
                    start: res.schedule_start_date,
                    end: res.schedule_end_date
                    }
			events.push(event)
		 };
		 console.log('Events:', events);
         showCalendar(events);
             
        },
        error: function(xhr, status, error) {
            // 에러 처리
            $("#result").html("<p>There was an error: " + error + "</p>");
        }
    });
});




function showCalendar(getEvent) {
	var modal = document.getElementById('mycab-cal-modal');
	var calendarEl = document.getElementById("selectableCalendar");

	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: "prev,next today",
			center: "title",
			right: 'insertScheduleButton'
		},
		customButtons: {
          insertScheduleButton: {
            text: '일정추가',
            click: function() {
              alert('Custom button clicked!');
            }
          }
        },
		 locale: 'ko',
		initialDate: new Date(),
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,
		select: function (arg) {
		/*
			console.log(arg)
			var startStr = arg.startStr;
			console.log(startStr);
			showDaySchedule(startStr);
			modal.style.display ='block';
			calendar.unselect();
		*/
		var startStr = arg.startStr;
		 var moreLink = calendarEl.querySelector('.fc-daygrid-day[data-date="' + startStr + '"] .fc-daygrid-more-link');

        if (moreLink) {
          moreLink.click();  // "More" 링크를 클릭하여 이벤트를 트리거합니다.
        } else {
          alert('No "More" link found for the specified date.');
        }
			
		},
		eventClick: function (arg) {
			console.log(arg);
		},
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
		events: getEvent
	});

	calendar.render();
};



function insertSchedule(){

}

