package com.my.cab.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.AttendanceDTO;
import com.my.cab.service.AttendanceService;


@Controller

public class AttendanceController {

	Logger logger = LoggerFactory.getLogger(getClass());
	private final AttendanceService attService;
	public AttendanceController(AttendanceService attService) {
		this.attService = attService;
	}
	
	
	
	@RequestMapping(value="attendance/myAttendance/list.go")
	public String myAttHistory(HttpSession session, Model model) {
		
		
		return "mypage/myAttHistory";
	}
	
	@RequestMapping(value = "attHistory.ajax")
	@ResponseBody
	public Map<String, Object> attHistoryListCall(String emp_no){
		
		return attService.attHistoryListCall(emp_no);
	}
}
