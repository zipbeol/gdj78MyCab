package com.my.cab.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.cab.dto.LoginDTO;
import com.my.cab.service.LoginService;



@Controller
public class LoginController { 
	
	Logger logger = LoggerFactory.getLogger(getClass());
	private final LoginService service;
	public LoginController(LoginService service) {
		this.service = service;
	}
	
	
	
	

	
	@RequestMapping(value="emp/login.do")
	public String login(String emp_no, String emp_password, HttpSession session, Model model, RedirectAttributes rat) {
		logger.info("로그인 실행");
		logger.info("사번 : "+emp_no+"비밀번호 : "+emp_password);
		
		String page = "login/login";
		
		int row = service.login(emp_no, emp_password);
		
		if (row == 1) {//로그인 성공, 최초 로그인이 아닐시
			page = "redirect:/";
			LoginDTO loginDTO = service.getInfo(emp_no);
			logger.info("프로필?"+loginDTO.getProfile_new());
			
			session.setAttribute("loginId", emp_no);
			session.setAttribute("profile", loginDTO.getProfile_new());
			session.setAttribute("dept_no", loginDTO.getDept_no());
			session.setAttribute("title_no", loginDTO.getTitle_no());
			session.setAttribute("emp_name", loginDTO.getEmp_name());
			session.setAttribute("title_name", loginDTO.getTitle_name());
			session.setAttribute("dept_name", loginDTO.getDept_name());
			
		} else if (row == 2) {//로그인 성공, 최초 로그인시
			page = "redirect:/login/pwFirstChange.go";
			session.setAttribute("loginId", emp_no);
			
		}else {
			rat.addFlashAttribute("message", "사번 또는 비밀번호를 확인해주세요.");
			page = "redirect:/login/logout.do";
		}
		
		return page;
	}
	
	
	@RequestMapping(value="login/pwFirstChange.go")
	public String pwFirst() {

		logger.info("비밀번호 최초 변경 페이지 이동");

		return "login/pwFirstChange";
	}
	
	@RequestMapping(value="login/pwFirstChange.do")
	public String pwFirstChange(String emp_no, String emp_password, RedirectAttributes rat) {
		logger.info("비밀번호 최초 변경 실행");
		logger.info("emp_no : "+emp_no);
		
		int row = service.pwFirstChange(emp_no, emp_password);
		String page = "redirect:/login/pwFirstChange";
		
		if (row ==1) {
			page ="redirect:/login/logout.do";
			rat.addFlashAttribute("message", "비밀번호 변경에 성공했습니다. 로그인을 해주세요.");
		}else {
			rat.addFlashAttribute("message", "비밀번호 변경에 실패했습니다. 다시 변경해주세요.");
		}
		

		return page;
	}
	
	
	
	@RequestMapping(value="login/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃 실행");
		session.removeAttribute("loginId");
		
		return "login/login";
	}
	
	
	
	@RequestMapping(value="login/logoutAndGetOff.do")
	public String logoutAndGetOff(HttpSession session, Model model) {
		String emp_no = (String) session.getAttribute("loginId");
		logger.info("퇴근 처리 요청 사번 :"+emp_no);
		
		int result = service.getOff(emp_no);
		
		if (result == 1) {
			session.removeAttribute("loginId");
			model.addAttribute("message", "퇴근 및 로그아웃 완료되었습니다.");
		}else {
			session.removeAttribute("loginId");
			model.addAttribute("message", "이미 처리된 퇴근 요청입니다.");
		}
		
		
		return "login/login";
	}
	
	

	@RequestMapping(value="login/pwFind.go")
	public String pwFind() {

		logger.info("비밀번호 찾기 이동");

		return "login/pwFind";
	}
	
	
	
	
	

}
