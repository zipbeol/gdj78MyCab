package com.my.cab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.CalendarDTO;
import com.my.cab.dto.EmpDTO;
import com.my.cab.service.CalendarService;


@Controller
public class CalendarController {
	
	private final CalendarService calendarService;
	
	public CalendarController (CalendarService calendarService) {
		this.calendarService = calendarService;
		
	};
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "calendar/calendar.go")
	public String calendarGo(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		List<EmpDTO> empList = calendarService.getEmpInfo();
		List<String> deptList = calendarService.getDeptInfo(); 
		List<CalendarDTO> shareCalList = calendarService.getShareCalInfo(loginId);
		
		for (CalendarDTO cal : shareCalList) {
			logger.info("공유캘린더 정보 가져오기" + cal.getCalendar_name());
		}
		
		model.addAttribute("empList",empList);
		model.addAttribute("deptList",deptList);
		model.addAttribute("shareCalList",shareCalList);
		
		logger.info("일정관리 메인페이지 진입");
		
		return "calendar/calendarList";
	}
	
	@GetMapping(value = "calendar/listCall.ajax")
	@ResponseBody
	public List<Map<String, Object>>calListCall(String schedule_editor){
		logger.info("캘린더 리스트 불러오는 아이디 : " + schedule_editor);
		logger.info("캘린더 리스트 불러오기 컨트롤러 도착");
		
		return calendarService.calListCall(schedule_editor);
	}
	
	/*
	 * @RequestMapping(value = "calendar/dayCalListCall.ajax")
	 * 
	 * @ResponseBody public List<Map<String, Object>>dayCalListCall(String
	 * selectedDay){ logger.info("일자 선택 : "+selectedDay);
	 * 
	 * return calendarService.dayCalListCall(selectedDay); }
	 */
	
	@RequestMapping(value = "calendar/createSchedule.ajax")
	@ResponseBody
	public Map<String, Object> createSchedule(CalendarDTO calendarDTO){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info(calendarDTO.getSchedule_category());
		logger.info("s"+calendarDTO.getSchedule_start_date());
		int idx = calendarDTO.getCalendar_idx();
		logger.info("zzz"+idx);
		if(idx>0) {
			calendarService.createShareSchedule(calendarDTO);
		}else {
			calendarService.createSchedule(calendarDTO);
		}
		
		
		
		return map;
	}
	
	@RequestMapping(value = "calendar/calendarDetail.ajax")
	@ResponseBody
	public Map<String, Object> calendarDetail(int schedule_idx){
		logger.info("캘린더 디테일"+schedule_idx);
		
		return calendarService.calendarDetail(schedule_idx);
	}
	
	@RequestMapping(value = "calendar/deleteSchedule.ajax")
	@ResponseBody
	public Map<String, Object>deleteSchedule(int schedule_idx){
			
		return calendarService.deleteSchedule(schedule_idx);
	}
	
	@RequestMapping(value = "calendar/editSchedule.ajax")
	@ResponseBody
	public Map<String, Object>editSchedule(CalendarDTO calendarDTO){
		logger.info("컨트롤러에서 받은 값 : " + calendarDTO.getSchedule_content());
		
		
		return calendarService.editSchedule(calendarDTO);
	}
	
	@RequestMapping(value = "calendar/createShareCalendar.ajax")
	@ResponseBody
	public Map<String, Object> createShareCalendar(@RequestBody Map<String, Object> shareCalInfo ){
		
		String shareTile = (String) shareCalInfo.get("shareTitle");
		logger.info(shareTile);
		String shareColor = (String) shareCalInfo.get("shareColor");
		logger.info(shareColor);
		logger.info("가져옴ㅋ"+shareCalInfo);
		
		logger.info("공유 캘린더 진입");
		
		return calendarService.createShareCalendar(shareCalInfo);
	}
	
	@RequestMapping(value = "calendar/shareCalListCall.ajax")
	@ResponseBody
	public List<Map<String, Object>>shareCalListCall(String schedule_editor){
		logger.info("공유 캘린더 일정 불러오기" + schedule_editor);
		return calendarService.shareCalListCall(schedule_editor);
	}
	
	
}
