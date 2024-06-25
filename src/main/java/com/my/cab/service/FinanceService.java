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

	@Transactional
	public Map<String, Object> addProfit(FinanceDTO profitDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("수익 등록 시작: {}", profitDTO.getPro_cash());

		map.put("result", financeDAO.addProfit(profitDTO));

		logger.info("수익 등록 완료: {}", profitDTO);
		return map;
	}

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

	public Object getTotalPages(SearchDTO searchDTO) {
        int profitTotal = financeDAO.getProfitCount(searchDTO);
        int totalPages = (int) Math.ceil((double) profitTotal / PAGE_SIZE);
        return totalPages = totalPages > 0 ? totalPages : 1;
	}
}
