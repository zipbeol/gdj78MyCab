package com.my.cab.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int attChk(String emp_no);

	int login(String emp_no, String emp_password);

	void att(String emp_no);

	int attDup(String emp_no);

}
