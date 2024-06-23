package com.my.cab.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {

	int attDup(String emp_no);

	boolean firstLogin(String emp_no);

	String pwfind(String emp_no);

	void addAtt(String emp_no);

}
