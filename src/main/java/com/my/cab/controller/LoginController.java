package com.my.cab.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.service.LoginService;



@Controller
public class LoginController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final LoginService service;
	public LoginController(LoginService service) {
		this.service = service;
	}

	
	@RequestMapping(value="emp/login.do")
	public String login(String emp_no, String emp_password, HttpSession session, Model model) {
		logger.info("로그인 실행");
		logger.info("사번 : "+emp_no+"비밀번호 : "+emp_password);
		
		String page = "login/login";
		
		int row = service.login(emp_no, emp_password);
		
		if (row == 1) {//로그인 성공, 최초 로그인이 아닐시
			page = "redirect:/";
			session.setAttribute("loginId", emp_no);
		} else if (row == 2) {//로그인 성공, 최초 로그인시
			page = "redirect:/login/pwFirstChange.go";
			session.setAttribute("loginId", emp_no);
		}else {
			model.addAttribute("message","사번 또는 비밀번호를 확인해주세요.");
			page = "login/login";
		}
		
		return page;
	}
	
	
	@RequestMapping(value="login/pwFirstChange.go")
	public String pwFirst() {

		logger.info("비밀번호 최초 변경 페이지 이동");

		return "login/pwFirstChange";
	}
	
	@RequestMapping(value="login/pwFirstChange.do")
	public String pwFirstChange(String emp_no, String emp_password) {
		logger.info("비밀번호 최초 변경 실행");
		
		
		

		return "login/pwFirstChange";
	}
	
	
	
	
	
	
	@RequestMapping(value="login/logout.do")
	public String logout() {

		logger.info("로그아웃 실행");

		return "login/login";
	}

	@RequestMapping(value="login/pwFind.go")
	public String pwFind() {

		logger.info("비밀번호 찾기 이동");

		return "login/pwFind";
	}
	
	
	
	
	

}
