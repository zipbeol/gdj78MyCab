package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface MyPageDAO {

	MyPageDTO getEmpDetail(String emp_no);

	String pwFind(String emp_no);

	int overlay(String emp_email);

	String getProfileByEmpNo(String emp_no);

	void saveProfile(String emp_no, String originalFileName, String fileName);

	int profileUpdate(MyPageDTO mypageDTO);

	void deleteProfile(String emp_no);

	MyPageDTO myVacList(String emp_no);

	boolean vacApply(MyPageDTO myPageDTO);

	int getVacApplyTotal(SearchDTO searchDTO);

	List<MyPageDTO> myVacApplyList(SearchDTO searchDTO);

	MyPageDTO vacApplyDetail(String vac_no);

	List<MyPageDTO> vacApprovalList(SearchDTO searchDTO);

	int getVacApprovalTotalPages(SearchDTO searchDTO);

	boolean vacApproval(MyPageDTO myPageDTO);

	boolean vacReject(MyPageDTO myPageDTO);

	

}
