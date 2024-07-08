package com.my.cab.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

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

    int saveApprovalDoc(ApprovalDocDTO approvalDoc);

    void saveDocument(DocumentDTO doc);

    void saveApproval(ApprovalDTO approval);

	List<Map<String, Object>> selectApprovalLines(String searchLine);

	Map<String, String> selectApproverDetails(String lineId);

	List<ApprovalDocDTO> getApprovalData();

	void saveSignature(DocumentDTO document);

	void updateSignature(DocumentDTO document);

	int isSignatureExist(String fileName);

	String getSignaturePath(String fileName);

	List<ApprovalDocDTO> getFilteredApprovalData(String loginId);

	ApprovalDocDTO getDocumentById(int docId);

	void updateDocumentStatus(Map<String, Object> params);

	int isApproverSigned(String documentId, String approverType);

	// 07.08
	
	List<String> getUserType(Map<String, Object> params);

	String getUserNameById(String loginId);

	String getUserTitleById(String loginId);








}
