package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.FinanceDTO;

@Mapper
public interface FinanceDAO {

	List<FinanceDTO> getProfitList(Map<String, Object> param);

	boolean addProfit(FinanceDTO profit);

}
