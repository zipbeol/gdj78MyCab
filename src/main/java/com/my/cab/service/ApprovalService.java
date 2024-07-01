package com.my.cab.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.cab.dao.ApprovalDAO;
import com.my.cab.dto.ApprovalDTO;
import com.my.cab.dto.ApprovalDocDTO;
import com.my.cab.dto.ApprovalWriteFromDTO;
import com.my.cab.dto.DocumentDTO;
import com.my.cab.dto.EmpDTO;


@Service
public class ApprovalService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalDAO apprDAO;
	
	//결재문서테이블 결재테이블 저장 순서 지정
    @Transactional
    public void saveApprovalData(ApprovalDocDTO approvalDoc, ApprovalDTO approval) {
        // ApprovalDoc 저장
        apprDAO.saveApprovalDoc(approvalDoc);

        // 저장된 ApprovalDoc의 ID 가져오기
        int approvalDocIdx = approvalDoc.getApproval_doc_idx();
        logger.info("asdasdasdsad : {}", approvalDoc.getApproval_doc_idx());
        // Approval에 ApprovalDoc ID 설정
        approval.setApproval_doc_idx(approvalDocIdx);

        // Approval 저장
        apprDAO.saveApproval(approval);
    }
	
    public List<ApprovalWriteFromDTO> approvalWriteList() {
        return apprDAO.approvalWriteList();
    }

    public void saveHtmlFilePath(String filePath) {
        ApprovalDocDTO approvalDocDTO = new ApprovalDocDTO();
        approvalDocDTO.setApproval_doc_path(filePath);
        System.out.println("Saving file path in DTO: " + approvalDocDTO.getApproval_doc_path());
        apprDAO.saveApprovalDoc(approvalDocDTO);
    }
    
    // 중간.최종 결재자 선택 시 사원 리스트 조회/검색
    public List<EmpDTO> getEmployees(String search) {
        if (search == null || search.isEmpty()) {
            return apprDAO.getAllEmployees();
        } else {
            return apprDAO.searchEmployees(search);
        }
    }
    
    // 기안서 데이터 db 저장 ( 첨부 파일 데이터 )
    public void saveAttachedFilePath(String uploadFilePath) {
        DocumentDTO docItemFileDTO = new DocumentDTO();
        docItemFileDTO.setAppr_file_path(uploadFilePath);
        System.out.println("Saving attached file path in DTO: " + docItemFileDTO.getAppr_file_path());
        apprDAO.saveAttachedFilePath(docItemFileDTO);
    }
    // 기안서 데이터 db 저장 ( 문서 데이터 )
    public void saveApprovalDoc(ApprovalDocDTO approvalDoc) {
        System.out.println("Saving approval document: " + approvalDoc);
        apprDAO.saveApprovalDoc(approvalDoc);
    }

    public void saveDocument(DocumentDTO doc) {
        System.out.println("Saving document: " + doc);
        apprDAO.saveDocument(doc);
    }

    public void saveApproval(ApprovalDTO approval) {
        System.out.println("Saving approval: " + approval);
        apprDAO.saveApproval(approval);
    }

    // 결재라인 가져오기
	public List<Map<String, Object>> getApprovalLines(String searchLine) {
		 return apprDAO.selectApprovalLines(searchLine);
	}
	
	// 결재라인에 따라 중간결재자, 최종결재자 불러오기
	public Map<String, String> getApproverDetails(String lineId) {
		return apprDAO.selectApproverDetails(lineId);
	}
	
	// 내 결재 관리 결재문서 리스트 조회
	public List<ApprovalDocDTO> getApprovalData() {
		  return apprDAO.getApprovalData();
	}



}
