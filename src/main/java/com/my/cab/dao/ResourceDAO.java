package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.ResourceDTO;

@Mapper
public interface ResourceDAO {

	int resourceWrite(ResourceDTO dto);

	int resourceWriteMeetRomm(Map<String, Object> param);

	int resourceWriteCar(Map<String, Object> param);

	int resourceWriteEquip(Map<String, Object> param);

	int saveResPhoto(int resource_idx, String originalFileName, String fileName);

	List<ResourceDTO> getResMrList(Map<String, Object> param);

	List<ResourceDTO> getResCarList(Map<String, Object> param);

	List<ResourceDTO> getResEqList(Map<String, Object> param);

	ResourceDTO getReservationMrInfo(int resource_idx);

	String getReservationCategory(int resource_idx);

	List<ResourceDTO> getReservationDate(int resource_idx);

	int createReservation(Map<String, Object> param);

	String getDeptName(int emp_no);

	List<ResourceDTO> rsvList(int resource_idx);

	List<ResourceDTO> getSelectRsvDate(String resource_idx, String resource_reserve_start_date);

	ResourceDTO getReservationCarInfo(int resource_idx);

}
