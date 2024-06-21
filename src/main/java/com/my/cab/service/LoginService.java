package com.my.cab.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.cab.dao.LoginDAO;


@Service
public class LoginService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired LoginDAO dao;
	@Autowired PasswordEncoder encoder;
	
	
	
	public int login(String emp_no, String emp_password) {
		
		int row = dao.login(emp_no, emp_password); //로그인 체크
		
		int attRow = dao.attChk(emp_no); // 최초 로그인 확인 위해 근태 테이블 확인
		
		int attDup  = dao.attDup(emp_no);//오늘 출근 중복 처리 방지 카운트
		
		int result = 0;
				
		if (row == 1 ) {//로그인 성공시		
			if (attRow > 0 && attDup == 0) {//최초 로그인 아니고 출근 미처리
				dao.att(emp_no);
				result = 1;
				
			}else if (attRow > 0 && attDup > 0) {//최초 로그인 아니고 출근 이미 처리
				result = 1;
				
			}else if (attRow == 0) {//최초 로그인시
				dao.att(emp_no);
				result = 2;
				
			} else {// 로그인 실패시
			result = -1;
		}
	
	}
		return result;
}
	
}
