package com.my.cab.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;
import com.my.cab.dto.SearchDTO;
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
	
	@GetMapping(value="mypage/pwChk.ajax")
	@ResponseBody
	public Map<String, Object> pwChk(HttpSession session, String emp_password){
		logger.info("프로필 수정 비밀번호 요청");
		logger.info("입력한 비밀번호 : "+emp_password);
		String emp_no = (String) session.getAttribute("loginId");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		boolean passChk = myPageService.pwChk(emp_no, emp_password);
		logger.info("비밀번호 확인 통과? :"+passChk);
		
		map.put("passChk", passChk);
		
		return map;
		
	}
	
	@RequestMapping(value="mypage/profileEdit.go")
	public String profileEdit(HttpSession session, Model model) {
		logger.info("프로필 수정 요청");
		String emp_no = (String) session.getAttribute("loginId");
		logger.info(emp_no+" 사원 상세보기 요청");
		
		MyPageDTO myPageDTO = myPageService.getEmpDetail(emp_no);
		model.addAttribute("empDetail",myPageDTO);
		
		
		return "mypage/profileEdit";
	}
	
	
	
	@RequestMapping(value="mypage/emailOverlay.ajax")
	@ResponseBody
	public Map<String, Object> overlay(String emp_email){
		logger.info("중복 확인 요청 email : "+ emp_email);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("use", myPageService.overlay(emp_email));
		
		return map;
	}
	
	@RequestMapping(value="mypage/profileUpload.ajax")
	@ResponseBody
	public Map<String, String> profileUpload(@RequestParam("file") MultipartFile file, HttpSession session){
		logger.info("사진 수정 요청");
		String emp_no = (String)session.getAttribute("loginId");
		
		
		return myPageService.profileUpload(file, emp_no);
	}
	
	
	@RequestMapping(value="mypage/update.do")
	public String profileUpdate(MyPageDTO mypageDTO, RedirectAttributes rat) {
		logger.info(mypageDTO.getEmp_no() + " 프로필 수정 요청");
		
		logger.info("주소 : "+mypageDTO.getEmp_add()+mypageDTO.getEmp_addDetail());
		logger.info("이메일 :"+mypageDTO.getEmp_email());
		logger.info("내선번호 :"+mypageDTO.getEmp_extension_number());
		
		
		int row = myPageService.profileUpdate(mypageDTO);
		
		if (row >0) {
			rat.addFlashAttribute("result", "2");
		}else {
			rat.addFlashAttribute("result", "1");
		}
		
		return "redirect:/mypage/profile.go";
	}
	
	@RequestMapping(value="mypage/vac/list.go")
	public String myVacList(Model model, HttpSession session) {
		logger.info("마이페이지 연차관리 이동");
		String emp_no = (String) session.getAttribute("loginId");
		
		MyPageDTO mypageDTO = myPageService.myVacList(emp_no);
		model.addAttribute("vacList",mypageDTO);
		
		return "mypage/myVacManagement";
	}
	
	@GetMapping(value="vacApply.ajax")
	@ResponseBody
	public Map<String, Object> vacApply(MyPageDTO myPageDTO){
		logger.info("사원 연차 신청");
		logger.info("연차 신청한 사원 번호 : "+myPageDTO.getEmp_no());
		
		
		boolean isSuccess = myPageService.vacApply(myPageDTO);
		
		return Map.of("isSuccess", isSuccess);
		
	}
	
	
	@GetMapping(value="/myVacApplyList.ajax")
	@ResponseBody
	public Map<String, Object> myVacApplyList(SearchDTO searchDTO){
		 logger.info("\nsearchDTO filterVacDate:" + searchDTO.getFilterVacDate()
        + "\nsearchDTO filterVacResult:" + searchDTO.getFilterVacResult());
		
		return myPageService.myVacApplyList(searchDTO);
		
	}
	
	
	
	@GetMapping(value="/getVacApplyTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getVacApplyTotalPages(SearchDTO searchDTO){
		
		return myPageService.getVacApplyTotalPages(searchDTO);
	}
	
	
	
	
	

}
