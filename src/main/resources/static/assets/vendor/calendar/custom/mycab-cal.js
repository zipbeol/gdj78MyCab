
document.addEventListener("DOMContentLoaded", function(){

		var modal = document.getElementById('mycab-cal-modal');
		var calendarEl = document.getElementById("selectableCalendar");
	
		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar: {
				left: "prev,next today",
				center: "title",
				right: 'insertScheduleButton'
			},
			 eventDidMount: function(arg) {
		       $(arg.el).tooltip({ 
				    title: arg.event.extendedProps.content,
				    placement: "top",
				    trigger: "hover",
				    container: "body"
			  });
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
				var adjustedEnd = moment(arg.end).subtract(1, 'days').format("YYYY-MM-DD");
				addScheduleModal(arg,adjustedEnd);		
			},
			eventClick: function (arg) {
				scheduleDetail(arg);
			},
			editable: true,
			dayMaxEvents: true,
			
			events: function(fetchInfo, successCallback, failureCallback){
				console.log(fetchInfo);
				console.log(successCallback);
				console.log(failureCallback);
				
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
				                color:res.schedule_color,
				                category:res.schedule_category
				                }
						events.push(event)
					 	};
					 console.log('Events:', events);
					 successCallback(events);
				         
				    },
				    error: function(xhr, status, error) {
				    	alert("캘린더 불러오기에 실패했습니다.");
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
      document.getElementById("create-start-date").value = startStr;
    }
    if(endStr != null){
      document.getElementById("create-end-date").value = endStr;
    }
    	
  // 모달을 표시
  myModal.show();
}

function scheduleDetail(arg){
	myModal = new bootstrap.Modal(document.getElementById('scheduleDetailModal'));
	console.log(arg);
	document.getElementById('detail-title').value = arg.event.title;
    document.getElementById('detail-start-date').value = arg.event.startStr  
    document.getElementById('detail-end-date').value = arg.event.endStr
    document.getElementById('detail-content').value = arg.event.extendedProps.content;
	 myModal.show();
	
}
