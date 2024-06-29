package com.my.cab.dao;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;

@Mapper
public interface MyPageDAO {

	MyPageDTO getEmpDetail(String emp_no);

	String pwFind(String emp_no);

	int overlay(String emp_email);

}
