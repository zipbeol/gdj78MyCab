package com.my.cab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.service.EmpService;


@Controller
public class EmpController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final EmpService service;
	public EmpController(EmpService service) {
		this.service = service;
	}
	
	
	
	
	
	@RequestMapping(value="emp/emp/create.go")
	public String empRegistration() {
		logger.info("사원 등록 페이지로 이동");
	
		return "HR/empRegistration";
	}

}
