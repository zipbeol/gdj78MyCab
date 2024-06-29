package com.my.cab.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.MyPageDAO;
import com.my.cab.dto.MyPageDTO;


@Service
public class MypageService {
	
	private String password = "";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDAO;
	@Autowired PasswordEncoder encoder;
	@Value("${spring.servlet.multipart.location}")
    private String upload;

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
            String fileName = "profile"+ emp_no + "_" + file.getOriginalFilename();
            byte[] bytes = file.getBytes();
            Path path = Paths.get(upload +"/"+ fileName);
            Files.write(path, bytes);

         // 기존 파일 삭제 로직 추가
            String existingFile = myPageDAO.getProfileByEmpNo(emp_no);
            if (existingFile != null) {
                myPageDAO.deleteProfile(emp_no);
            }
            
            myPageDAO.saveProfile(emp_no, originalFileName, fileName);

            response.put("message", "You successfully uploaded '" + fileName + "'");
            response.put("filePath", "/photo/" + fileName);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("message", "Upload failed");
        }

        return response;
    }

	public int profileUpdate(MyPageDTO mypageDTO) {
		
		String emp_add = mypageDTO.getEmp_add() + ", " + mypageDTO.getEmp_addDetail();
		mypageDTO.setEmp_add(emp_add);
		
		
		String pw = mypageDTO.getEmp_password();
		password = encoder.encode(pw);
		mypageDTO.setEmp_password(password);
		
		int row = myPageDAO.profileUpdate(mypageDTO);
		
		return row;
	}
		

}
