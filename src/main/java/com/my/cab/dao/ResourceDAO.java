package com.my.cab.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResourceDAO {

	int resourceWrite(Map<String, Object> param);

	int resourceWriteMeetRomm(Map<String, Object> param);

	int resourceWriteCar(Map<String, Object> param);

	int resourceWriteEquip(Map<String, Object> param);

}
