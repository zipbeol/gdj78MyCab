package com.my.cab.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.tag.common.fmt.SetTimeZoneSupport;
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

	public Map<String, Object> attHistoryDetail(String attendance_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		AttendanceDTO dto = attDAO.getAttDetail(attendance_idx);
		map.put("dto", dto);
		
		Timestamp startTime =  dto.getAtt_time();
		Timestamp endTime =  dto.getLeave_time();
		String sTime = setTimea(startTime);
		String eTime = setTimea(endTime);
		logger.info("시간변환 "+sTime);
		logger.info("시간변환 "+eTime);
		map.put("sTime", sTime);
		map.put("eTime", eTime);
		return map;
	}
	
	public String setTimea (Timestamp timestamp) {
		
		LocalDateTime time = timestamp.toLocalDateTime();
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("kk:mm");
		String setTime = format.format(time);
		
		
		return setTime;
	}

	public boolean attEditApply(AttendanceDTO attDTO) {
		
		boolean result = false;
		
		result = attDAO.attEditApply(attDTO);
		
		
		return result;
	}

	
}
