package com.my.cab.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;
import com.my.cab.service.MypageService;


@Controller
public class MyPageController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final MypageService myPageService;
	public MyPageController(MypageService myPageService) {
		this.myPageService = myPageService;
	}
	
	
	@RequestMapping(value="mypage/profile.go")
	public String profile(Model model, HttpSession session) {	
			String emp_no = (String) session.getAttribute("loginId");
			logger.info(emp_no+" 사원 상세보기 요청");
			
			MyPageDTO myPageDTO = myPageService.getEmpDetail(emp_no);
			model.addAttribute("empDetail",myPageDTO);
		
		return "mypage/profile";
	}
	
	

}
