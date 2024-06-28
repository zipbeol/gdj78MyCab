package com.my.cab.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
    public List<ApprovalWriteFromDTO> approvalWriteList() {
        return apprDAO.approvalWriteList();
    }

    public void saveHtmlFilePath(String filePath) {
        ApprovalDocDTO approvalDocDTO = new ApprovalDocDTO();
        approvalDocDTO.setApproval_doc_path(filePath);
        System.out.println("Saving file path in DTO: " + approvalDocDTO.getApproval_doc_path());
        apprDAO.saveApprovalDoc(approvalDocDTO);
    }
    
    public List<EmpDTO> getEmployees(String search) {
        if (search == null || search.isEmpty()) {
            return apprDAO.getAllEmployees();
        } else {
            return apprDAO.searchEmployees(search);
        }
    }

    public void saveAttachedFilePath(String uploadFilePath) {
        DocumentDTO docItemFileDTO = new DocumentDTO();
        docItemFileDTO.setAppr_file_path(uploadFilePath);
        System.out.println("Saving attached file path in DTO: " + docItemFileDTO.getAppr_file_path());
        apprDAO.saveAttachedFilePath(docItemFileDTO);
    }

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


}
