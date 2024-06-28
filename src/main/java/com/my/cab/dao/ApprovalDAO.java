package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.my.cab.dto.ApprovalDTO;
import com.my.cab.dto.ApprovalDocDTO;
import com.my.cab.dto.ApprovalWriteFromDTO;
import com.my.cab.dto.DocumentDTO;
import com.my.cab.dto.EmpDTO;

@Mapper
public interface ApprovalDAO {

    List<ApprovalWriteFromDTO> approvalWriteList();

    List<EmpDTO> getAllEmployees();

    List<EmpDTO> searchEmployees(@Param("search") String search);

    void saveAttachedFilePath(DocumentDTO docItemFileDTO);

    void saveApprovalDoc(ApprovalDocDTO approvalDoc);

    void saveDocument(DocumentDTO doc);

    void saveApproval(ApprovalDTO approval);


}
