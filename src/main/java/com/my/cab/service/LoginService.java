package com.my.cab.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.cab.dao.LoginDAO;


@Service
public class LoginService {
	
	private String password = "";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired LoginDAO dao;
	@Autowired PasswordEncoder encoder;
	
	
	
	public int login(String emp_no, String emp_password) {
		
		password = dao.pwfind(emp_no);
		
		boolean pwPass = encoder.matches(emp_password, password);
		int result = 0;
		
		if (pwPass) {
			
			boolean firstLogin = dao.firstLogin(emp_no); // 최초 로그인 확인 
			
			if (firstLogin) {
				logger.info("최초 로그인, 비밀번호 변경 필요");
				
				result = 2;
				
			}else {				
					logger.info("로그인 및 출근 처리 함께");
					
					dao.addAtt(emp_no);
					result = 1;
					
				}
			}else {//로그인 실패시
			
			logger.info("로그인 실패");
			result = 0;
		}
		
		return result;
}



	public int pwFirstChange(String emp_no, String emp_password) {
		
		password = encoder.encode(emp_password);
		
		int row = dao.pwFirstChange(emp_no, password);
		
		
		
		return row;
	}



	public int getOff(String emp_no) {
		
		int offCount = dao.addGetOff(emp_no); //1이면 퇴근 처리, 0이면 퇴근 이미 처리
		
		
		return offCount;
	}
	
}
