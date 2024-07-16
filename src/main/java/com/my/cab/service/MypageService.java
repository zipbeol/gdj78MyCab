package com.my.cab.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.MyPageDAO;
import com.my.cab.dto.EmpDTO;
import com.my.cab.dto.MyPageDTO;
import com.my.cab.dto.SearchDTO;


@Service
public class MypageService {
	
	private String password = "";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDAO;
	@Autowired PasswordEncoder encoder;
	@Value("${spring.servlet.multipart.location}")
    private String upload;
	private static final int PAGE_SIZE = 10;

	public MyPageDTO getEmpDetail(String emp_no) {
		
		
		return myPageDAO.getEmpDetail(emp_no);
	}

	public boolean pwChk(String emp_no, String emp_password) {
		logger.info("사번? " + emp_no);
		password = myPageDAO.pwFind(emp_no);
		
		boolean pwPass = encoder.matches(emp_password, password);
		
		logger.info("매치? = "+pwPass);
		
		
		return pwPass;
	}

	public int overlay(String emp_email) {
		
		return myPageDAO.overlay(emp_email);
	}
	
	
	
	

	public Map<String, String> profileUpload(MultipartFile file, String emp_no) {
		
		Map<String, String> response = new HashMap<String, String>();

        if (file.isEmpty()) {
            response.put("message", "Please select a file to upload");
            return response;
        }

        try {
            // 업로드 파일명에 emp_no를 추가하여 파일명이 겹치지 않도록 함
        	String originalFileName = file.getOriginalFilename();
            String fileName = "profile"+ emp_no + "_" + System.currentTimeMillis() + ".jpg";
            byte[] bytes = file.getBytes();
            Path path = Paths.get(upload +"/"+ fileName);

         // 기존 파일 삭제 로직 추가
            String existingFile = myPageDAO.getProfileByEmpNo(emp_no);
            logger.info("파일 이름 :" +existingFile);
            File delFile = new File(upload + "/" + existingFile);
            
            if (existingFile != null) {
                delFile.delete();
                myPageDAO.deleteProfile(emp_no);
            }
            
            Files.write(path, bytes);
            myPageDAO.saveProfile(emp_no, originalFileName, fileName);

            response.put("message", "You successfully uploaded '" + fileName + "'");
            response.put("filePath", upload +"/" + fileName);
            response.put("fileName", fileName);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("message", "Upload failed");
        }

        return response;
    }

	public int profileUpdate(MyPageDTO mypageDTO) {
		
		String emp_add = mypageDTO.getEmp_add() + " " + mypageDTO.getEmp_addDetail();
		mypageDTO.setEmp_add(emp_add);
		
		String emp_password = mypageDTO.getEmp_password();
		logger.info("emp_password ? :"+emp_password);
		
		if (emp_password.length()>7) {
			
			password = encoder.encode(emp_password);
			mypageDTO.setEmp_password(password);
			
		}
		
		int row = myPageDAO.profileUpdate(mypageDTO);
		
		return row;
	}

	public MyPageDTO myVacList(String emp_no) {
		
		return myPageDAO.myVacList(emp_no);
	}

	public boolean vacApply(MyPageDTO myPageDTO) {
		
		
		boolean result = false;


        result = myPageDAO.vacApply(myPageDTO);


        return result;
	}

	public Map<String, Object> myVacApplyList(SearchDTO searchDTO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
        int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        logger.info("page {}", page);
        logger.info("searchDTO page {}", searchDTO.getPage());
        List<MyPageDTO> empList = myPageDAO.myVacApplyList(searchDTO);
        logger.info("empList {}", empList);
        result.put("empList", empList);


        return result;
	}

	public Map<String, Object> getVacApplyTotalPages(SearchDTO searchDTO) {
		 int empTotal = myPageDAO.getVacApplyTotal(searchDTO);
	     int totalPages = (int) Math.ceil((double) empTotal / PAGE_SIZE);
	     totalPages = totalPages > 0 ? totalPages : 1;

	        return Map.of("totalPages", totalPages);
	}

	public MyPageDTO vacApplyDetail(String vac_no) {
		
		return myPageDAO.vacApplyDetail(vac_no);
	}

	public Map<String, Object> vacApprovalList(SearchDTO searchDTO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
        int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
        searchDTO.setPage(page);
        searchDTO.setPageSize(PAGE_SIZE);
        logger.info("page {}", page);
        logger.info("searchDTO page {}", searchDTO.getPage());
        List<MyPageDTO> empList = myPageDAO.vacApprovalList(searchDTO);
        logger.info("empList {}", empList);
        result.put("empList", empList);


        return result;
	}

	public Map<String, Object> getVacApprovalTotalPages(SearchDTO searchDTO) {
		
		 int empTotal = myPageDAO.getVacApprovalTotalPages(searchDTO);
	     int totalPages = (int) Math.ceil((double) empTotal / PAGE_SIZE);
	     totalPages = totalPages > 0 ? totalPages : 1;

	        return Map.of("totalPages", totalPages);
	}

	public boolean vacApproval(MyPageDTO myPageDTO) {
		
		boolean result = false;


        result = myPageDAO.vacApproval(myPageDTO);


        return result;
	}

	public boolean vacReject(MyPageDTO myPageDTO) {
		
		boolean result = false;


        result = myPageDAO.vacReject(myPageDTO);


        return result;
	}
	

}
