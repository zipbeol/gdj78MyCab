package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface EmpDAO {

	int empJoin(EmpDTO dto);

	int accJoin(EmpDTO dto);

	int overlay(String email);

	int getLastEmpNo(int deptNo);

	List<EmpDTO> getEmpList(SearchDTO searchDTO);

	int getEmpTotal(SearchDTO searchDTO);

	EmpDTO getEmpDetail(int emp_no);

	boolean updateEmp(EmpDTO empDTO);

	boolean updateEmpRetried(EmpDTO empDTO);

}
