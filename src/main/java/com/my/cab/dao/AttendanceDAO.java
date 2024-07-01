package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.AttendanceDTO;

@Mapper
public interface AttendanceDAO {

	List<AttendanceDTO> getAttHistory(String emp_no);

	List<AttendanceDTO> attHistoryListCall(String emp_no);

	AttendanceDTO getAttDetail(int attendance_idx);

	boolean attEditApply(AttendanceDTO attDTO);

	List<AttendanceDTO> attEditList(int pagePerCnt, int start, int emp_no);

	int allCount(int pagePerCnt, int emp_no);

	AttendanceDTO attEditListDetail(int att_management_idx);

}
