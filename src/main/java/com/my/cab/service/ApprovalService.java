package com.my.cab.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.cab.dao.ApprovalDAO;
import com.my.cab.dto.ApprovalWriteFromDTO;


@Service
public class ApprovalService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalDAO apprDAO;
	public List<ApprovalWriteFromDTO> approvalWriteList() {

		return apprDAO.approvalWriteList();
	}

}
