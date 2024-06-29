package com.my.cab.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.cab.dao.MyPageDAO;
import com.my.cab.dto.MyPageDTO;


@Service
public class MypageService {
	
	private String password = "";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDAO;
	@Autowired PasswordEncoder encoder;

	public MyPageDTO getEmpDetail(String emp_no) {
		
		
		return myPageDAO.getEmpDetail(emp_no);
	}

	public boolean pwChk(String emp_no, String emp_password) {
		logger.info("사번? " + emp_no);
		password = myPageDAO.pwFind(emp_no);
		
		boolean pwPass = encoder.matches(emp_password, password);
		
		logger.info("매치? = "+pwPass);
		
		
		return pwPass;
	}

	public int overlay(String emp_email) {
		
		return myPageDAO.overlay(emp_email);
	}

}
