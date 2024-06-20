package com.my.cab.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.cab.service.FinanceService;


@Controller
public class FinanceController { 

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired FinanceService financeService;

	@RequestMapping(value="/finance/profit/list.go")
	public ModelAndView financeProfit(HttpSession session) {
		logger.info("재무관리 수익리스트");
		ModelAndView mav = new ModelAndView("/finance/financeProfit");
		// 세션 체크
//		if(session.getAttribute("loginId")!=null) {
//			mav.addObject("chk", "on");
//		} else {
//			mav.addObject("chk", "notOn");
//		}
		List<String> profitList = financeService.getProfitList();
		 mav.addObject("profitList", profitList);
		
		return mav;
	}
	
}

