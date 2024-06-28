package com.my.cab.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.FinanceService;

@Controller
@RequestMapping("/finance")
public class FinanceController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	FinanceService financeService;

	@RequestMapping("/profit/list.go")
	public String financeProfit(Model model) {
		logger.info("재무관리 수익리스트");

		return "finance/financeProfit"; // 뷰 경로: /WEB-INF/views/finance/financeProfit.jsp
	}

	@PostMapping("/profit/list.ajax")
	@ResponseBody
	public Map<String, Object> getProfitList(SearchDTO searchDTO, @RequestParam Map<String, Object> param) {
		logger.info("재무관리 수익리스트 - AJAX 요청");
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		// 서비스 호출하여 리스트 데이터 가져오기
		return financeService.getProfitList(param, searchDTO);
	}

	// 수익 등록 폼
	@PostMapping("/profit/add.ajax")
	@ResponseBody
	public Map<String, Object> addProfit(FinanceDTO profit) {
		logger.info("pro_actual_date = " + profit.getPro_actual_date());
		return financeService.addProfit(profit);
	}

	// 수익 페이징 처리
	@GetMapping("/profit/getTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getProTotalPages(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		logger.info("searchDTO = " + searchDTO);
		Map<String, Object> map = new HashMap<>();
		map.put("totalPages", financeService.getProTotalPages(searchDTO));

		return map;
	}

	// 지출
	@RequestMapping("/expenses/list.go")
	public String financeExpenses(Model model) {
		logger.info("재무관리 지출리스트");

		return "finance/financeExpenses"; // 뷰 경로: /WEB-INF/views/finance/financeProfit.jsp
	}

	@PostMapping("/expenses/list.ajax")
	@ResponseBody
	public Map<String, Object> getExpensesList(SearchDTO searchDTO, @RequestParam Map<String, Object> param) {
		logger.info("재무관리 지출리스트 - AJAX 요청");
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		// 서비스 호출하여 리스트 데이터 가져오기
		return financeService.getExpensesList(param, searchDTO);
	}
	
	// 지출 등록 폼
	@PostMapping("/expenses/add.ajax")
	@ResponseBody
	public Map<String, Object> addExpenses(FinanceDTO expenses) {
		logger.info("exp_actual_date = " + expenses.getExp_actual_date());
		return financeService.addExpenses(expenses);
	}
	
	// 지출 페이징 처리
	@GetMapping("/expenses/getTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getExpTotalPages(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		logger.info("searchDTO = " + searchDTO);
		Map<String, Object> map = new HashMap<>();
		map.put("totalPages", financeService.getExpTotalPages(searchDTO));

		return map;
	}
	
	// 거래 내역
	@RequestMapping("/deal/list.go")
	public String financeDeal(Model model) {
		logger.info("재무관리 지출리스트");

		return "finance/financeDeal"; // 뷰 경로: /WEB-INF/views/finance/financeProfit.jsp
	}

	@PostMapping("/deal/list.ajax")
	@ResponseBody
	public Map<String, Object> getDealList(SearchDTO searchDTO, @RequestParam Map<String, Object> param) {
		logger.info("재무관리 거래내역리스트 - AJAX 요청");
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		// 서비스 호출하여 리스트 데이터 가져오기
		return financeService.getDealList(param, searchDTO);
	}
	
	// 거래 페이징 처리
	@GetMapping("/deal/getTotalPages.ajax")
	@ResponseBody
	public Map<String, Object> getDealTotalPages(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		logger.info("searchDTO = " + searchDTO);
		Map<String, Object> map = new HashMap<>();
		map.put("totalPages", financeService.getDealTotalPages(searchDTO));

		return map;
	}
	
	@GetMapping("/deal/totalAmounts.ajax")
	@ResponseBody
	    public Map<String, Object> getTotalAmounts(@RequestParam Map<String, Object> financeDTO) {
			Map<String, Object>map = new HashMap<String, Object>();
			// financeService.getTotalAmounts(financeDTO);
			logger.info("param : {}", financeDTO);
	        return map;
	    
	}
}
