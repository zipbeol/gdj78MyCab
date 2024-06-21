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

@Service
public class FinanceService {

	private static final Logger logger = LoggerFactory.getLogger(FinanceService.class);

	@Autowired
	private FinanceDAO financeDao;

	@Transactional
	public Map<String, Object> addProfit(FinanceDTO profitDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("수익 등록 시작: {}", profitDTO.getPro_cash());

		map.put("result", financeDao.addProfit(profitDTO));

		logger.info("수익 등록 완료: {}", profitDTO);
		return map;
	}

	public Map<String, Object> getProfitList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<FinanceDTO> profitList = financeDao.getProfitList(param);
		map.put("profit", profitList);
		return map;
	}
}
