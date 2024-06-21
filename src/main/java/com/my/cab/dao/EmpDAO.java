package com.my.cab.dao;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.EmpDTO;

@Mapper
public interface EmpDAO {

	int empJoin(EmpDTO dto);

	int accJoin(EmpDTO dto);

	int overlay(String email);

	int getLastEmpNo(int deptNo);

}
