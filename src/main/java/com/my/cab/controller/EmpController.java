package com.my.cab.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.cab.service.EmpService;


@Controller
public class EmpController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final EmpService service;
	public EmpController(EmpService service) {
		this.service = service;
	}
	
	
	
	@RequestMapping(value="emp/emp/create.go")
	public String Registration() {
		logger.info("사원 등록 페이지로 이동");
	
		return "HR/empRegistration";
	}
	
	
	
	@RequestMapping(value="emp/emp/emailOverlay.ajax")
	@ResponseBody
	public Map<String, Object> overlay(String email){
		logger.info("email : "+email);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", service.overlay(email));
		
		return map;
	}
	

	@RequestMapping(value="emp/emp/getNextEmpNo.ajax")
	@ResponseBody
	public Map<String, Object> getNextEmpNo(int deptNo){
		logger.info("부서번호 : "+deptNo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int nextEmpNo = service.getNextEmpNo(deptNo);
		logger.info("다음 사원 번호 : "+String.valueOf(nextEmpNo));
		
		map.put("nextEmpNo", nextEmpNo);
		
		
		return map;
	}
	
	
	@RequestMapping(value="emp/join.do")
	public String empRegistration(@RequestParam Map<String, Object> param, RedirectAttributes redirectAttributes) {
		logger.info("사원 등록 요청");
		logger.info("param : {}",param);
		
		int row = service.empRegistration(param);
		if(row>0) {
			logger.info("사원 등록 성공");
			 redirectAttributes.addFlashAttribute("message", "사원 등록이 완료되었습니다.");
	          return "redirect:/";
		}else {
			redirectAttributes.addFlashAttribute("message", "사원 등록에 실패하였습니다.");
            return "redirect:/";
		}
		
	}
	
	
	

}
