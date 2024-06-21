package com.my.cab.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.dto.ApprovalWriteFromDTO;
import com.my.cab.service.ApprovalService;



@Controller
public class ApprovalController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalService apprservice;
	
	@RequestMapping(value="approval/approvalWriteForm.go")
	public String approvalWriteForm(Model model) {

		logger.info("기안서 작성 페이지 이동");
		
		List<ApprovalWriteFromDTO> list = apprservice.approvalWriteList();
		logger.info("list : {} ", list);
		model.addAttribute("approvalWriteList", list);
		
		return "approval/approvalWriteForm";
	}
	

}
