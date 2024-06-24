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
		
			console.log(arg)
			var startStr = arg.startStr;
			console.log(startStr);
			showDaySchedule(startStr);
			modal.style.display ='block';
			calendar.unselect();
			
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

function showDaySchedule(startStr){
	$.ajax({
        type: "GET",
        url: "/calendar/dayCalListCall.ajax", // 서버 측 스크립트 URL
        data: {selectedDay : startStr},
        dataType: "json",
        success: function(response) {
        	
            var modal = document.getElementById('cal-modal-content2');
            for (var i = 0; i < response.length; i++) {

				// 날짜 변환
				const isoString = response[i].schedule_start_date;
				const date = new Date(isoString);
				let hours = date.getUTCHours();
				const minutes = date.getUTCMinutes();
				const minutesStr = minutes < 10 ? '0' + minutes : minutes;
				console.log(response[i]);

				// 모달창에 넣기
				/*
				modal.innerHTML += '<p class="cal-modal-content-p">'+
				hours + ':' + minutesStr +'&nbsp;&nbsp;&nbsp;' + 
				'<i class="fs-6 bi bi-circle-fill"></i>'+
				'&nbsp;&nbsp;&nbsp;'+
				response[i].schedule_name+'</p>';
				
				*/
				modal.innerHTML += '<tr class="schedule-event">'+
							  	   '<td>'+hours+':'+minutesStr+'</td>'+
							       '<td><i class="fs-6 bi bi-circle-fill" style="color :'+'red'+'"></i></td>'+
						  	       '<td><a>'+response[i].schedule_name+'</a></td>'+
								   '</tr>'
			}
            console.log(modal);
        },
        error: function(xhr, status, error) {
            // 에러 처리
            $("#result").html("<p>There was an error: " + error + "</p>");
        }
    });
};

function insertSchedule(){

}

