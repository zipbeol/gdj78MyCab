package com.my.cab.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "myAttHistory.ajax")
	@ResponseBody
	public Map<String, Object> attHistoryListCall(String emp_no){
		
		return attService.attHistoryListCall(emp_no);
	}
	
	
	@RequestMapping(value="myAttHistoryDetail.ajax")
	@ResponseBody
	public Map<String, Object> attHistoryDetail(int attendance_idx){
		
		return attService.attHistoryDetail(attendance_idx);
	}
	
	
	@GetMapping(value="myAttEditApply.ajax")
	@ResponseBody
	public Map<String, Object> attEditApply(AttendanceDTO attDTO){
		
		boolean isSuccess =  attService.attEditApply(attDTO);
		
		return Map.of("isSuccess", isSuccess);
	}
	
	@GetMapping(value="/attEditApplyList.ajax")
	@ResponseBody
	public Map<String, Object> attEditList(String page, @RequestParam(value="emp_no") int emp_no, @RequestParam(value="cnt", defaultValue ="5") String cnt){
		
		logger.info("사번? "+emp_no);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object> map = attService.attEditList(currPage, pagePerCnt, emp_no);
		
		return map;
	}
	
	@GetMapping(value="getAttEditListDetail.ajax")
	@ResponseBody
	public Map<String, Object>attEditListDetail(int att_management_idx){
		logger.info("근태 수정 신청 번호? "+att_management_idx);
		
		return attService.attEditListDeatil(att_management_idx);
	}
	
	
	
	
	
	
	
}
