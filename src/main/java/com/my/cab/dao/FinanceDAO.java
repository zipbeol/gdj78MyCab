package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.FinanceDTO;

@Mapper
public interface FinanceDAO {

	List<FinanceDTO> getProfitList();

	boolean addProfit(FinanceDTO profit);

}
