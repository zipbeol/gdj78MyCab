package com.my.cab.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String financeProfit(HttpSession session, Model model) {
		logger.info("재무관리 수익리스트");
		// 세션 체크
		// if(session.getAttribute("loginId")!=null) {
		// model.addObject("chk", "on");
		// } else {
		// model.addObject("chk", "notOn");
		// }

		return "finance/financeProfit"; // 뷰 경로: /WEB-INF/views/finance/financeProfit.jsp
	}

	@PostMapping("/profit/list.ajax")
	@ResponseBody
	public Map<String, Object> getProfitList(HttpSession session, SearchDTO searchDTO,@RequestParam Map<String, Object> param) {
		logger.info("재무관리 수익리스트 - AJAX 요청");
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
        + "\nsearchDTO Category:" + searchDTO.getCategory()
        + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
        + "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate()
        + "\nsearchDTO page:" + searchDTO.getPage()
);
		// 서비스 호출하여 리스트 데이터 가져오기
		return financeService.getProfitList(param, searchDTO);
	}

	@PostMapping("/profit/add.ajax")
	@ResponseBody
	public Map<String, Object> addProfit(FinanceDTO profit) {
		logger.info("pro_actual_date = " + profit.getPro_actual_date());
		return financeService.addProfit(profit);
	}
	
    @GetMapping("/profit/getTotalPages.ajax")
    @ResponseBody
    public Map<String, Object> getTotalPages(SearchDTO searchDTO) {
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText()
        + "\nsearchDTO Category:" + searchDTO.getCategory()
        + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
        + "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate()
        + "\nsearchDTO page:" + searchDTO.getPage()
		);
    	logger.info("searchDTO = "+ searchDTO);
        Map<String, Object> map = new HashMap<>();
        map.put("totalPages", financeService.getTotalPages(searchDTO));
        
        return map;
    }

}
