package com.my.cab.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.cab.dao.ApprovalDAO;
import com.my.cab.dto.ApprovalDocDTO;
import com.my.cab.dto.ApprovalWriteFromDTO;
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
		approvalDocDTO.setAppr_file_path(filePath);
		System.out.println("Saving file path in DTO: " + approvalDocDTO.getApproval_doc_path()); // 추가 로그
		
        apprDAO.save(approvalDocDTO);
		
	}
	
	 public List<EmpDTO> getEmployees(String search) {
	        if (search == null || search.isEmpty()) {
	            return apprDAO.getAllEmployees();
	        } else {
	            return apprDAO.searchEmployees(search);
	        }
	    }


}
