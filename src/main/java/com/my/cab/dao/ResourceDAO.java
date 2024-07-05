package com.my.cab.dao;

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

}
