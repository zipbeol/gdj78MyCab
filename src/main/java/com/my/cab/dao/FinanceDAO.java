package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface FinanceDAO {

	List<FinanceDTO> getProfitList(SearchDTO searchDTO);

	boolean addProfit(FinanceDTO profit);

	int getProfitCount(SearchDTO searchDTO);

	List<FinanceDTO> getExpensesList(SearchDTO searchDTO);

	boolean addExpenses(FinanceDTO expenses);

	int getExpensesCount(SearchDTO searchDTO);

	List<FinanceDTO> getDealList(SearchDTO searchDTO);

	boolean addDeal(FinanceDTO profitDTO);

	int getDealCount(SearchDTO searchDTO);
	
	Map<String, Object> getTotalAmounts(FinanceDTO financeDTO);
}
