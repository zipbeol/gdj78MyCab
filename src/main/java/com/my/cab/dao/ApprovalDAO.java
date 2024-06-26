package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.ApprovalDocDTO;
import com.my.cab.dto.ApprovalWriteFromDTO;
import com.my.cab.dto.EmpDTO;

@Mapper
public interface ApprovalDAO {

	List<ApprovalWriteFromDTO> approvalWriteList();

	void save(ApprovalDocDTO htmlFileDto);


}
