package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.CalendarDTO;

@Mapper
public interface CalendarDAO {

	List<Map<String, Object>> calListCall(String schedule_editor);

	List<Map<String, Object>> dayCalListCall(String selectedDay);

	int createSchedule(CalendarDTO calendarDTO);

	CalendarDTO calendarDetail(int schedule_idx);

	int deleteSchedule(int schedule_idx);

	int editSchedule(CalendarDTO calendarDTO);

}
