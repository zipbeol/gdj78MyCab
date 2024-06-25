
document.addEventListener("DOMContentLoaded", function(){

		var modal = document.getElementById('mycab-cal-modal');
		var calendarEl = document.getElementById("selectableCalendar");
	
		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar: {
				left: "prev,next today",
				center: "title",
				right: 'insertScheduleButton'
			},
			customButtons: {
	          insertScheduleButton: {
	            text: '일정추가',
	            click: function(arg) {
	              addScheduleModal(arg);
	            }
	          }
	        },
			locale: 'ko',
			initialDate: new Date(),
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectMirror: true,
			select: function (arg) {
				var adjustedEnd = moment(arg.end).subtract(1, 'days');
				var adjustedEnd = adjustedEnd.format("YYYY-MM-DD");
				addScheduleModal(arg,adjustedEnd);		
			},
			eventClick: function (arg) {
				scheduleDetail(arg);
			},
			editable: true,
			dayMaxEvents: true,
			
			events: function(start,end,timezone,callback){
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
				            	id: res.schedule_idx,
				            	title: res.schedule_name,
				                content: res.schedule_content,
				                start: res.schedule_start_date,
				                end: res.schedule_end_date,
				                color:res.schedule_color
				                }
						events.push(event)
					 };
					 callback(events);
					 console.log('Events:', events);
				         
				    },
				    error: function(xhr, status, error) {
				        // 에러 처리
				        $("#result").html("<p>There was an error: " + error + "</p>");
				    }
				});			
			}
		});
	
		calendar.render();
});



function addScheduleModal(arg,adjustedEnd){
	console.log(arg)
	var myModal = new bootstrap.Modal(document.getElementById('scheduleAddModal'));
  	startStr = arg.startStr;
  	endStr = adjustedEnd;
  	
  	
  	if(startStr != null){
      document.getElementById("sel-start-date").value = startStr;
    }
    if(endStr != null){
      document.getElementById("sel-end-date").value = endStr;
    }
    	
  // 모달을 표시
  myModal.show();
}

function scheduleDetail(arg){
	var myModal = new bootstrap.Modal(document.getElementById('scheduleDetailModal'));
	console.log(arg);
	document.getElementById('scheduleDetailTitle').value = arg.event.title;
    document.getElementById('sel-start-date-Detail').value = arg.event.startStr  
    document.getElementById('sel-end-date-Detail').value = arg.event.endStr
    document.getElementById('scheduleDetailContent').value = arg.event.extendedProps.content;
	 myModal.show();
	
}
