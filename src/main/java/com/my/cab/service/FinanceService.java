package com.my.cab.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.cab.dao.FinanceDAO;
import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.SearchDTO;

@Service
public class FinanceService {

	Logger logger = LoggerFactory.getLogger(FinanceService.class);

	private static final int PAGE_SIZE = 10;

	@Autowired
	private FinanceDAO financeDAO;

	public Map<String, Object> getProfitList(Map<String, Object> param, SearchDTO searchDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
		logger.info("page {}", page);
		logger.info("searchDTO page {}", searchDTO.getPage());
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		List<FinanceDTO> profitList = financeDAO.getProfitList(searchDTO);
		map.put("profit", profitList);
		logger.info("수익리스트");
		return map;
	}

	@Transactional
	public Map<String, Object> addProfit(FinanceDTO profitDTO) {
		boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("수익 등록 시작: {}", profitDTO.getPro_cash());
		result = financeDAO.addProfit(profitDTO);
		profitDTO.setDeal_field("수익");
		profitDTO.setProfit(true);
		result = financeDAO.addDeal(profitDTO);
		map.put("result", result);

		logger.info("수익 등록 완료: {}", profitDTO);
		return map;
	}

	public Object getProTotalPages(SearchDTO searchDTO) {
		int profitTotal = financeDAO.getProfitCount(searchDTO);
		int totalPages = (int) Math.ceil((double) profitTotal / PAGE_SIZE);
		return totalPages = totalPages > 0 ? totalPages : 1;
	}

	public Map<String, Object> getExpensesList(Map<String, Object> param, SearchDTO searchDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
		logger.info("page {}", page);
		logger.info("searchDTO page {}", searchDTO.getPage());
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		List<FinanceDTO> getExpensesList = financeDAO.getExpensesList(searchDTO);
		map.put("expenses", getExpensesList);
		logger.info("지출리스트");
		return map;
	}

	@Transactional
	public Map<String, Object> addExpenses(FinanceDTO expensesDTO) {
		boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("지출 등록 시작: {}", expensesDTO.getExp_cash());
		result = financeDAO.addExpenses(expensesDTO);
		expensesDTO.setDeal_field("지출");
		expensesDTO.setProfit(false);
		result = financeDAO.addDeal(expensesDTO);
		map.put("result", result);

		logger.info("지출 등록 완료: {}", expensesDTO);

		return map;
	}

	public Object getExpTotalPages(SearchDTO searchDTO) {
		int expensesTotal = financeDAO.getExpensesCount(searchDTO);
		int totalPages = (int) Math.ceil((double) expensesTotal / PAGE_SIZE);
		return totalPages = totalPages > 0 ? totalPages : 1;
	}

	public Map<String, Object> getDealList(Map<String, Object> param, SearchDTO searchDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
		logger.info("page {}", page);
		logger.info("searchDTO page {}", searchDTO.getPage());
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		List<FinanceDTO> dealList = financeDAO.getDealList(searchDTO);
		map.put("deal", dealList);
		logger.info("거래내역리스트");
		return map;
	}

	public Object getDealTotalPages(SearchDTO searchDTO) {
		int dealTotal = financeDAO.getDealCount(searchDTO);
		int totalPages = (int) Math.ceil((double) dealTotal / PAGE_SIZE);
		return totalPages = totalPages > 0 ? totalPages : 1;
	}

	public Map<String, Object> getTotalAmounts(FinanceDTO financeDTO) {
		logger.info("********************총합계*********************");
		logger.info("financeDTO profit {}", financeDTO.getTotal_profit());
		logger.info("financeDTO expenses {}", financeDTO.getTotal_expense());
		logger.info("financeDTO sum {}", financeDTO.getNet_profit());
		logger.info("********************총합계*********************");
        return financeDAO.getTotalAmounts(financeDTO);
    }
}
