package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface FinanceDAO {

	List<FinanceDTO> getProfitList(SearchDTO searchDTO);

	boolean addProfit(FinanceDTO profit);

	int getProfitCount(SearchDTO searchDTO);

}
