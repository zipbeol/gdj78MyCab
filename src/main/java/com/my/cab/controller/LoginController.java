package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.service.LoginService;



@Controller
public class LoginController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final LoginService service;
	public LoginController(LoginService service) {
		this.service = service;
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
