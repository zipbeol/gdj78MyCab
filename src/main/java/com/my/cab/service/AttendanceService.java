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
import com.my.cab.dto.SearchDTO;


@Service
public class AttendanceService {
	private static final int PAGE_SIZE = 10;
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

	public Map<String, Object> attHistoryDetail(int attendance_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		AttendanceDTO dto = attDAO.getAttDetail(attendance_idx);
		map.put("dto", dto);
		
		Timestamp startTime =  dto.getAtt_time();
		Timestamp endTime =  dto.getLeave_time();
		if (startTime != null) {
	        String sTime = setTimea(startTime);
	        map.put("sTime", sTime);
	        logger.info("시간변환 " + sTime);
	    }

	    if (endTime != null) {
	        String eTime = setTimea(endTime);
	        map.put("eTime", eTime);
	        logger.info("시간변환 " + eTime);
	    }
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

	public Map<String, Object> attEditList(int currPage, int pagePerCnt, int emp_no) {
		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<AttendanceDTO> list = attDAO.attEditList(pagePerCnt, start, emp_no);
		
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", attDAO.allCount(pagePerCnt,emp_no));
		
		
		return result;
	}

	public Map<String, Object> attEditListDeatil(int att_management_idx) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		AttendanceDTO att = attDAO.attEditListDetail(att_management_idx);
		map.put("att", att);
		
		return map;
	}

	public Map<String, Object> totalAttList(SearchDTO searchDTO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1)*PAGE_SIZE;
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		logger.info("page {}",page);
		logger.info("searchDTO page {}",searchDTO.getPage());
		List<AttendanceDTO> empList = attDAO.totalAttList(searchDTO);
		logger.info("empList {}", empList);
		result.put("empList", empList);
		
		return result;
	}

	public Map<String, Object> getAttTotalPages(SearchDTO searchDTO) {
		int empTotal = attDAO.getAttTotal(searchDTO);
		int totalPages = (int) Math.ceil((double)empTotal/PAGE_SIZE);
		totalPages = totalPages > 0? totalPages : 1;
		
		return Map.of("totalPages", totalPages);
	}

	public Map<String, Object> getchart(SearchDTO searchDTO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<AttendanceDTO> chart = attDAO.getChart(searchDTO);
		result.put("chart", chart);
		
		
		return result;
	}

	public Map<String, Object> totalEditList(SearchDTO searchDTO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1)*PAGE_SIZE;
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		logger.info("page {}",page);
		logger.info("searchDTO page {}",searchDTO.getPage());
		List<AttendanceDTO> empList = attDAO.totalEditList(searchDTO);
		logger.info("empList {}", empList);
		result.put("empList", empList);
		
		
		return result;
	}

	public Map<String, Object> getEditTotalPages(SearchDTO searchDTO) {
		
		int empTotal = attDAO.getEditTotalPages(searchDTO);
		int totalPages = (int) Math.ceil((double)empTotal/PAGE_SIZE);
		totalPages = totalPages > 0? totalPages : 1;
		
		return Map.of("totalPages", totalPages);

	}

	public boolean approvalReject(AttendanceDTO attDTO) {
		boolean result = false;
		
		
		
		result = attDAO.approvalReject(attDTO);
		
		
		
		
		return result;
	}

	public boolean approvalPermit(AttendanceDTO attDTO) {
		boolean result = false;
		
		result = attDAO.approvalPermit(attDTO);
		
		
		return result;
	}

	public void checkAtt(List<AttendanceDTO> list) {
		for (AttendanceDTO dto : list) {
			attDAO.checkAtt(dto);
			
		}
		attDAO.insertAtt();
	}

	public List<AttendanceDTO> getEmp() {
		return attDAO.getEmp();
	}

	
}
