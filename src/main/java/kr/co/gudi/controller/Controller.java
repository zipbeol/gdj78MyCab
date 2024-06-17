package kr.co.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {
	
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/")
	public String main() {
		
		return "index";
	}
	
	@GetMapping(value = "/{page}.go")
	public String pageMove(@PathVariable String page) {
		logger.info(page+".jsp 로 이동");
		return page;
	}
	
	@GetMapping(value = "/{root}/{page}.go")
	public String pageMove(@PathVariable String root, @PathVariable String page) {
		logger.info(root+"/"+page+".jsp 로 이동");
		return root+"/"+page;
	}
	
	@GetMapping(value = "/{root}/{sub}/{page}.go")
	public String pageMove(@PathVariable String root,@PathVariable String sub,@PathVariable String page) {
		logger.info(root+"/"+sub+"/"+page+".jsp 로 이동");
		return page;
	}
	
	@GetMapping(value = "/{root}/{sub}/{path}/{page}.go")
	public String pageMove(@PathVariable String root,@PathVariable String sub,@PathVariable String path ,@PathVariable String page) {
		logger.info(root+"/"+sub+"/"+"/"+path+page+".jsp 로 이동");
		return page;
	}
	
	

}
