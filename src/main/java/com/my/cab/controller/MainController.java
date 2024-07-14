package com.my.cab.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.cab.service.MainService;

@Controller
public class MainController { 
	
	
Logger logger = LoggerFactory.getLogger(getClass());
@Autowired MainService mainService;
	
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		
		String url = "http://taxi-news.co.kr/bbs/board.php?bo_table=board_01";
		Document doc = Jsoup.connect(url).data("page", "1").get();
		
		List<Map<String, String>> newsList = mainService.getElem(doc);
		model.addAttribute("newsList", newsList);
		
		return "main/main";
	}
	
	

	
	
	
	

}
