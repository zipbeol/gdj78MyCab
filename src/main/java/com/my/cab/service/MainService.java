package com.my.cab.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public List<Map<String, String>> getElem(Document doc) {
		
		Elements newsItems = doc.select("ul#bo_webzine li.list-item");
		logger.info("News item size: " + newsItems.size());

        List<Map<String, String>> newsList = new ArrayList<Map<String,String>>();
        int count = 0;
        for (Element item : newsItems) {
            if (count >= 4) break; // 최대 5개만 추출

            String title = item.select("h5.card-title a").html();
            String link = item.select("h5.card-title a").attr("href");
            String date = item.select("div.float-left.text-muted").text().split(" ")[1]; // 등록일 부분 추출
            String imageUrl = item.select("div.img-item img").attr("src");
            
            Map<String, String> news = new HashMap<String, String>();
            news.put("title", title);
            news.put("link", link);
            news.put("date", date);
            news.put("image", imageUrl);

            newsList.add(news);
            count++;
        }
		
		
		return newsList;
	}

}
