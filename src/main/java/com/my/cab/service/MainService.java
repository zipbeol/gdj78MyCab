package com.my.cab.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.cab.dao.MainDAO;


@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MainDAO mainDAO;

	String driver_id = "webdriver.chrome.driver";
	String driver_path = "C:/chromedriver.exe";
	
	WebDriver driver = null; // 커넥션하고 비슷한거 이게 있어야 접속이 된다.
	ChromeOptions options = null;
	
	public MainService() {
		logger.info("시스템 속성 등록 " );
		System.setProperty(driver_id, driver_path);
		options = new ChromeOptions();
		
		options.addArguments("--remote-allow-origins=*");
	}
	

	public List<Map<String, String>> getElem(Document doc) {
		
		Elements newsItems = doc.select("ul#bo_webzine li.list-item");
		

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


	public List<Map<String, Object>> getFuelCostElem() throws InterruptedException {
		
//		Elements priceElements = doc.select("span.price");
//		List<Map<String, String>> fuelList = new ArrayList<Map<String,String>>();
//		
//		for (Element element : priceElements) {
//            String priceId = element.id();
//            String priceValue = element.text();
//            
//            logger.info("연료  값 : " +priceId );
//            logger.info("연료  값 : " +priceValue );
//
//            Map<String, String> fuelInfo = new HashMap<String, String>();
//            fuelInfo.put("priceId", priceId);
//            fuelInfo.put("priceValue", priceValue);
//            fuelList.add(fuelInfo);
//        }
		// 1. 드라이버 생성
		 		options.addArguments("--headless");
		 		options.addArguments("--window-size=1920,1080");
				driver = new ChromeDriver(options);
				// 2. url 호출
				driver.get("https://www.opinet.co.kr/user/main/mainView.do");
				driver.manage().window();
				// 셀레니움은 실제 브라우저를 켜서 작업하기 때문에 중간중간 딜레이 시간을 줘야 한다.
				Thread.sleep(500);
				
				// 원하는 내용 가져오기
				//
//				By.cssSelector(driver_id)
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				
				List<WebElement> getElemList = driver.findElements(By.cssSelector("div span.price"));
				
				for (WebElement element : getElemList) {
	                String priceText = element.getText();
	                String priceId = element.getAttribute("id");
	                System.out.println("Title: " + priceText);
	                System.out.println("Title: " + priceId);
	                Map<String, Object> map = new HashMap<String, Object>();
	                map.put("priceText",priceText);
	                map.put("priceId", priceId);
	                list.add(map);
	            } 
				
		
		return list;
	}


	public Map<String, Object> mainGetApprovalData() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getAttTime(String emp_no) {
		
		
		
		return mainDAO.getAttTime(emp_no);
	}

	
}
