package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.AttendanceDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface AttendanceDAO {

	List<AttendanceDTO> getAttHistory(String emp_no);

	List<AttendanceDTO> attHistoryListCall(String emp_no);

	AttendanceDTO getAttDetail(int attendance_idx);

	boolean attEditApply(AttendanceDTO attDTO);

	List<AttendanceDTO> attEditList(int pagePerCnt, int start, int emp_no);

	int allCount(int pagePerCnt, int emp_no);

	AttendanceDTO attEditListDetail(int att_management_idx);

	List<AttendanceDTO> totalAttList(SearchDTO searchDTO);

	int getAttTotal(SearchDTO searchDTO);

	List<AttendanceDTO> getChart(SearchDTO searchDTO);

	List<AttendanceDTO> totalEditList(SearchDTO searchDTO);

	int getEditTotalPages(SearchDTO searchDTO);

	boolean approvalReject(AttendanceDTO attDTO);

	boolean approvalPermit(AttendanceDTO attDTO);

}
