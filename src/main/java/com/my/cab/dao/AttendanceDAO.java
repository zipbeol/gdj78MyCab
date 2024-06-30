package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.AttendanceDTO;

@Mapper
public interface AttendanceDAO {

	List<AttendanceDTO> getAttHistory(String emp_no);

	List<AttendanceDTO> attHistoryListCall(String emp_no);

}
