package com.my.cab.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.cab.dao.MyPageDAO;
import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;


@Service
public class MypageService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDAO;

	public MyPageDTO getEmpDetail(String emp_no) {
		
		
		return myPageDAO.getEmpDetail(emp_no);
	}

}
