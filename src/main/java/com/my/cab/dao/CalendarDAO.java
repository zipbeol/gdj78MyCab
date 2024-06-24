package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {

	List<Map<String, Object>> calListCall();

	List<Map<String, Object>> dayCalListCall(String selectedDay);

}
