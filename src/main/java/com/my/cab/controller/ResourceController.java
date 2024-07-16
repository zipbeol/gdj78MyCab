package com.my.cab.controller;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.ResourceDAO;
import com.my.cab.dto.ResourceDTO;
import com.my.cab.service.ResourceService;

@Controller
public class ResourceController { 
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ResourceService resourceService;
	
	public ResourceController(ResourceService resourceService) {
		this.resourceService = resourceService;
		
	}

	
	@RequestMapping(value = "resource/resourceWrite.go")
	public String resourceWriteGo() {
		
		return "resource/resourceWrite";
	}
	
	@RequestMapping(value = "resource/resourceWrite.do")
	public String resourceWrite(@RequestParam(name = "photo", required = false)MultipartFile file , @RequestParam Map<String,Object> param, ResourceDTO dto, HttpSession session) {
		logger.info("사진 받아온거 : " +file);
		logger.info("사진 받아온거 : " +dto.getResource_content());
		param.put("id", session.getAttribute("loginId"));
		int id = Integer.parseInt((String) session.getAttribute("loginId")) ;
		logger.info("gdsagdsag"+id);
		dto.setId(id);
		logger.info("리소스 등록 : "+param.get("resourceName"));
		logger.info("리소스 등록 : "+param.get("carLicencePlate"));
		

		
		resourceService.resourceWrite(param,file,dto);
		
		
		return "resource/resourceList";
	}
	
	@PostMapping(value = "resource/resourcePhoto")
	@ResponseBody
	public String resourcePhoto(@RequestParam("upload") MultipartFile file) {
			logger.info("file"+file);
		return null;
	}
	
	@RequestMapping(value = "resource/list.go")
	public String resourceList(){
		
		return "resource/resourceList";
	}
	
	@RequestMapping(value = "resource/resourceList.ajax")
	@ResponseBody
	public Map<String, Object>resourceListCall(@RequestParam Map<String,Object> param){
		logger.info("zzz1"+param.get("resSerachCategory"));
		logger.info("zzz1"+param.get("resSearchDate"));
		logger.info("zzz1"+param.get("resSearchStartTime"));
		logger.info("zzz1"+param.get("resSearchEndTime"));
		logger.info("zzz1"+param.get("resStatus"));
		logger.info("zzz1"+param.get("resOption"));
			
		return resourceService.resourceListCall(param);
	}
	
	@RequestMapping(value = "resource/resGetPages.ajax")
	@ResponseBody
	public Map<String, Object> resGetPages (@RequestParam Map<String, Object> param){
		
		return null;
	}
	
	@RequestMapping(value = "resource/resourceReservation.go")
	public String resourceReservationGo(int resource_idx, Model model) {
		logger.info("자원예약 디테일"+resource_idx);
		resourceService.getReservationInfo(resource_idx,model);
		return "resource/resoruceReservation";
	}
	
	@RequestMapping(value = "resource/createReservation.ajax")
	@ResponseBody
	public Map<String, Object> createReservation(@RequestBody Map<String, Object> param){
		logger.info("자원예약"+param);
		return resourceService.createReservation(param);
	}
	
	@RequestMapping(value = "resource/rsvList.ajax")
	@ResponseBody
	public Map<String, Object> rsvList(int resource_idx){
		logger.info("자원예약 일정 불러오기" + resource_idx);
		
		
		return resourceService.rsvList(resource_idx);
	}
	
	@RequestMapping(value = "resource/getSelectRsvDate.ajax")
	@ResponseBody
	public Map<String, Object> getSelectRsvDate(String resource_idx, String resource_reserve_start_date){
		 logger.info("gadsgasdgds"+resource_idx);
		 logger.info("gdasgdsagsd"+resource_reserve_start_date);
	
		return resourceService.getSelectRsvDate(resource_idx,resource_reserve_start_date);
	}
	
	@RequestMapping(value = "resource/myReservationList.go")
	public String myReservationListGo() {
		
		return "resource/myReservationList";
	}
	
	@RequestMapping(value = "resource/myReservationList.ajax")
	@ResponseBody
	public Map<String, Object> myReservationList(@RequestParam Map<String,Object> param){
		logger.info("내 예약 리스트"+param.get("resSerachCategory"));
		logger.info("내 예약 리스트"+param.get("currentPage"));
		logger.info("내 예약 리스트"+param.get("empNo"));
		return resourceService.myReservationList(param);
	}
	
	@RequestMapping(value = "resource/delRsv.ajax")
	@ResponseBody
	public Map<String, Object> delRsv(@RequestBody List<Integer> param){
		logger.info("삭제" + param);
		return resourceService.delRsv(param);
	}
}
