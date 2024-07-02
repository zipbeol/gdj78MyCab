package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.my.cab.dto.CalendarDTO;
import com.my.cab.dto.EmpDTO;

@Mapper
public interface CalendarDAO {

	List<Map<String, Object>> calListCall(String schedule_editor);

	List<Map<String, Object>> dayCalListCall(String selectedDay);

	int createSchedule(CalendarDTO calendarDTO);

	CalendarDTO calendarDetail(int schedule_idx);

	int deleteSchedule(int schedule_idx);

	int editSchedule(CalendarDTO calendarDTO);

	List<EmpDTO> getEmpInfo();

	List<String> getDeptInfo();

	int createShareCalendar(CalendarDTO dto);

	int createSharedSchedule(@Param("idx") int idx, @Param("list") List<Map<String, Object>> list);

	List<CalendarDTO> getShareCalInfo(String loginId);

	int createShareSchedule(CalendarDTO calendarDTO);

	List<Map<String, Object>> shareCalListCall(String schedule_editor);

}
