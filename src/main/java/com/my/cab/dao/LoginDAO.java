package com.my.cab.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {


	boolean firstLogin(String emp_no);

	String pwfind(String emp_no);

	void addAtt(String emp_no);

	int pwFirstChange(String emp_no, String password);

	int addGetOff(String emp_no);

}
