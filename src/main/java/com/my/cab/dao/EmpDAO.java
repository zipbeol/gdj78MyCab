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

    boolean updateEmp(EmpDTO empDTO);

    boolean updateEmpRetried(EmpDTO empDTO);

    EmpDTO getEmpDetail(String emp_no);

    List<EmpDTO> getVacList(SearchDTO searchDTO);

    int getVacTotal(SearchDTO searchDTO);

    List<EmpDTO> getNoOffsetEmpList(SearchDTO searchDTO);

    boolean addVac(EmpDTO empDTO);

    void vacJoin(EmpDTO dto);

	boolean vacEditValue(EmpDTO empDTO);

	List<EmpDTO> vacFinalList(SearchDTO searchDTO);

	int getVacFinalTotalPages(SearchDTO searchDTO);

	EmpDTO vacApplyDetailFinal(String vac_no);

	boolean vacFinalApproval(EmpDTO empDTO);

	boolean vacFinalReject(EmpDTO empDTO);

	void insertVacAtt(EmpDTO empDTO);

	void insertVacAttFull(int emp_no, String vac_type, String new_work_day);

	void updateVac(int emp_no, double use);

	EmpDTO getEmpDetailModal(int emp_no);

	List<EmpDTO> empList(SearchDTO searchDTO);

	int getEmpTotalPagesForEmp(SearchDTO searchDTO);

}
