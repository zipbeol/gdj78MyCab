package com.my.cab.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	FinanceDTO getTotalAmounts(Map<String, Object> financeDTO);

    List<Map<String, Object>> getRevenueData(@Param("startYearMonth") String startYearMonth, @Param("endYearMonth") String endYearMonth);

    List<Map<String, Object>> getExpenseData(@Param("startYearMonth") String startYearMonth, @Param("endYearMonth") String endYearMonth);

	List<Integer> getRevenuePieData(Map<String, Object> param);

	List<Integer> getExpensePieData(Map<String, Object> param);

}
