package com.my.cab.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.ResourceDAO;
import com.my.cab.dto.ResourceDTO;


@Service
public class ResourceService {
	
	private final ResourceDAO resourceDao;
	@Value("${spring.servlet.multipart.location}")
    private String upload;
	
	public ResourceService (ResourceDAO resourceDao) {
		this.resourceDao = resourceDao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public int resourceWrite(Map<String, Object> param , MultipartFile file, ResourceDTO dto) {
		int row = 0;
		int idx = 0;
		if(param.get("resource_category").equals("차량")) {			
			 resourceDao.resourceWrite(dto);
			 idx = dto.getResource_idx();
			 logger.info("pp : " + idx);
			
			logger.info("idx 가져온 값:: "+idx);
			if(idx >0) {
				param.put("idx", idx);
				row = resourceDao.resourceWriteCar(param);
				logger.info("자동차 작성 :"+row);
				 logger.info("dto idx get : "+ dto.getResource_idx());
			}
		}else if(param.get("resource_category").equals("회의실")){
			resourceDao.resourceWrite(dto);
			idx = dto.getResource_idx();

			if(idx >0) {
				param.put("idx", idx);
				row = resourceDao.resourceWriteMeetRomm(param);		
				logger.info("회의실 작성 :"+row);
				 logger.info("dto idx get : "+ dto.getResource_idx());
			}
			
		}else if(param.get("resource_category").equals("비품")){
			resourceDao.resourceWrite(dto);
			idx = dto.getResource_idx();
			if(idx >0) {
				param.put("idx", idx);
				row = resourceDao.resourceWriteEquip(param);	
				logger.info("비품 작성 :"+row);
				 logger.info("dto idx get : "+ dto.getResource_idx());
			}			
		}else {
			logger.info("자원 등록 이상함");
		}
		
		if (file != null && !file.isEmpty() && row >0) {
			resFileUpload(file, param);
        }
		
		return row;
		
	}
	
	public String resFileUpload(MultipartFile file, Map<String, Object>  param) {
			String result = "";
			logger.info("파일업로드 실행중");
	
	        if (file.isEmpty()) {
	        	result = "message : Please select a file to upload";
	            return result;
	        }
	
	        try {
	            // 업로드 파일명에 emp_no를 추가하여 파일명이 겹치지 않도록 함
	        	String originalFileName = file.getOriginalFilename();
	            String fileName = "resource"+ param.get("id") + "_" + System.currentTimeMillis() + ".jpg";
	            byte[] bytes = file.getBytes();
	            Path path = Paths.get(upload +"/"+ fileName);
	
	         // 기존 파일 삭제 로직 추가
//	            String existingFile = resourceDao.getResPhotoNo(emp_no);
//	            logger.info("파일 이름 :" +existingFile);
//	            File delFile = new File(upload + "/" + existingFile);
	            
//	            if (existingFile != null) {
//	                delFile.delete();
//	                myPageDAO.deleteProfile(emp_no);
//	            }
	            
	            Files.write(path, bytes);
	            int resource_idx = (int) param.get("idx");
	            resourceDao.saveResPhoto(resource_idx, originalFileName, fileName);
	
	            result = "성공";
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            result= "실패";
	            
	        }
	        logger.info(result);
	        return result;
	    }

	public Map<String, Object> resourceListCall(Map<String, Object> param) {
		Map<String, Object>map = new HashMap<String, Object>();
		if (param.get("resSerachCategory").equals("회의실")) {
			List<ResourceDTO> list = resourceDao.getResMrList(param);
			map.put("list", list);
		}else if(param.get("resSerachCategory").equals("차량")) {
			List<ResourceDTO> list = resourceDao.getResCarList(param);
			map.put("list", list);
		}else if(param.get("resSerachCategory").equals("비품")) {
			List<ResourceDTO> list = resourceDao.getResEqList(param);
			map.put("list", list);
		}
		return map;
	}

	public void getReservationInfo(int resource_idx, Model model) {
		String category = resourceDao.getReservationCategory(resource_idx);
		logger.info(category);
		List<ResourceDTO> rsvTime =resourceDao.getReservationDate(resource_idx);
		if(category.equals("회의실")) {
			ResourceDTO dto = resourceDao.getReservationMrInfo(resource_idx);
			model.addAttribute("dto",dto);
			model.addAttribute("rsvTime",rsvTime);
		} /*
			 * else if(category.equals("차량")){ ResourceDTO dto =
			 * resourceDao.getReservationCarInfo(resource_idx); }else
			 * if(category.equals("비품")){ ResourceDTO dto =
			 * resourceDao.getReservationEqInfo(resource_idx); }
			 */else {
			logger.info("카테고리 불러오기 실패 ");
		}
		
		
	}

	public Map<String, Object> createReservation(Map<String, Object> param) {
		int empId = (int) param.get("resEmpId");
		logger.info("아이디"+empId);
		String deptName = resourceDao.getDeptName(empId);
		logger.info(deptName);
		param.put("deptCategory", deptName);
		int row = resourceDao.createReservation(param);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(row >0) {
			map.put("success", true);
		}else {
			map.put("success", false);
		}
		return map;
	}

	public Map<String, Object> rsvList(int resource_idx) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ResourceDTO> dto = resourceDao.rsvList(resource_idx);
			map.put("revList", dto);
		return map;
	}

	public Map<String, Object> getSelectRsvDate(String resource_idx, String resource_reserve_start_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ResourceDTO> dto = resourceDao.getSelectRsvDate(resource_idx,resource_reserve_start_date);
		map.put("dto", dto);
		for (ResourceDTO resourceDTO : dto) {
			logger.info("선택된 일정 가져온다 :" + resourceDTO.getResource_reserve_start_date());
		}
		return map;
	}

}
