package com.my.cab.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.cab.dao.AttendanceDAO;
import com.my.cab.dto.AttendanceDTO;


@Service
public class AttendanceService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AttendanceDAO attDAO;

	public List<AttendanceDTO> getAttHistory(String emp_no) {
		
		return attDAO.getAttHistory(emp_no);
	}

	public Map<String, Object> attHistoryListCall(String emp_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AttendanceDTO> list = attDAO.attHistoryListCall(emp_no);
		map.put("dto", list);
		return map;
	}

}
