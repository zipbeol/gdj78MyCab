package com.my.cab.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.FinanceDTO;
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
    public Map<String, Object> getProfitList(HttpSession session) {
        logger.info("재무관리 수익리스트 - AJAX 요청");

        // 세션 체크
        // if(session.getAttribute("loginId") == null) {
        // return new ArrayList<>(); // 비어 있는 리스트 반환
        // }
        
        // 서비스 호출하여 리스트 데이터 가져오기
        return financeService.getProfitList();
    }

    @PostMapping("/profit/add.ajax")
    @ResponseBody
    public Map<String, Object>  addProfit(FinanceDTO profit) {
        logger.info("pro_date = "+ profit.getPro_date());
        return financeService.addProfit(profit);
    }
}
