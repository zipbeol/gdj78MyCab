package com.my.cab.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.service.MainService;

@Controller
public class MainController { 
	
	
Logger logger = LoggerFactory.getLogger(getClass());
@Autowired MainService mainService;
	
	@RequestMapping(value = "/")
	public String main(Model model, HttpSession session) throws Exception {
		
		String emp_no = (String) session.getAttribute("loginId");
		String att_time = mainService.getAttTime(emp_no);
		
		 // 날짜와 시간에서 시간 부분만 추출하여 LocalTime으로 변환
        DateTimeFormatter fullFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalTime attTime = LocalTime.parse(att_time, fullFormatter);

        // 시와 분을 분리하여 모델에 추가
        int attHour = attTime.getHour();
        int attMinute = attTime.getMinute();

        // 퇴근 시간
        LocalTime endTime = LocalTime.of(18, 0); // 18:00

        // 남은 시간 계산
        long hoursUntilEnd = ChronoUnit.HOURS.between(attTime, endTime);
        long minutesUntilEnd = ChronoUnit.MINUTES.between(attTime, endTime) % 60;


        String remainingTime = hoursUntilEnd + "시간 " + minutesUntilEnd + "분";
		
        model.addAttribute("att_hour", String.format("%02d", attHour));
        model.addAttribute("att_minute", String.format("%02d", attMinute));
        model.addAttribute("remainingTime", remainingTime);
		
		String url = "http://taxi-news.co.kr/bbs/board.php?bo_table=board_01";
		Document doc = Jsoup.connect(url).data("page", "1").get();
		
		List<Map<String, String>> newsList = mainService.getElem(doc);
		model.addAttribute("newsList", newsList);
		
		
		// 월별 출근 결과 예시 데이터
        List<String> months = Arrays.asList("5월", "6월", "7월");
        List<Integer> late = Arrays.asList(5, 3, 1);
        List<Integer> present = Arrays.asList(20, 22, 14);
        List<Integer> absent = Arrays.asList(1, 2, 1);

        model.addAttribute("late", late);
        model.addAttribute("present", present);
        model.addAttribute("absent", absent);
		
		
		
		return "main/main";
	}
	
	@RequestMapping(value = "/main/getFuelInfo.ajax")
	@ResponseBody
	public Map<String, Object> getFuelCost() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> getFuelList = mainService.getFuelCostElem();
		map.put("getFuelList", getFuelList);
		
		return map;
	}
	



}
