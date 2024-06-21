package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.ApprovalWriteFromDTO;

@Mapper
public interface ApprovalDAO {

	List<ApprovalWriteFromDTO> approvalWriteList();

}
