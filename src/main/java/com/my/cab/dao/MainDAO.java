package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.MainDTO;

@Mapper
public interface MainDAO {



	String getAttTime(String emp_no);

}
