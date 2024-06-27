package com.my.cab.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.cab.dto.EmpDTO;
import com.my.cab.service.ApprovalService;



@Controller
public class ApprovalController {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalService apprservice;
	
	// 저장 디렉토리
    private static final String UPLOAD_DIR = "C:/upload"; 

    // 애플리케이션 시작 시 저장 디렉토리 생성
    static {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }
	
    // 기안서 작성 페이징 이동 요청
	@RequestMapping(value="/approval/approvalWriteForm.go") // value 수정
	public String approvalWriteForm() {
		logger.info("기안서 작성 페이지 이동");	
		return "approval/approvalWriteForm";
	}
	

	//기안서 작성 후 html 파일 경로 저장
    @PostMapping("approval/save-html.fetch")
    public String saveHtmlFile(@RequestParam("htmlContent") String htmlContent, Model model) {
        try {       	
        	System.out.println("Received HTML content: " + htmlContent);
            // 현재 시간을 밀리초 단위로 가져옴
            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
            String fileName = "approval_file_" + timeStamp + ".html"; // session 에 저장 되는 loginId 이용하여 변경
            String filePath = UPLOAD_DIR + File.separator + fileName; // 저장 경로 수정

            // HTML 파일 저장
            File file = new File(filePath);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(htmlContent.getBytes());
            fos.close();
            
            // 파일 경로를 데이터베이스에 저장
            apprservice.saveHtmlFilePath(filePath);
            
            System.out.println("File saved at: " + filePath);

            model.addAttribute("message", "File saved successfully: " + fileName);
            return "success"; 
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "Error saving file");
            return "error"; 
        }
    }
    
	// 중간.최종 결재자 선택 시 사원 리스트 조회/검색
	@GetMapping("/approvalList.ajax")
	@ResponseBody
	public List<EmpDTO> getEmployees(@RequestParam(required = false) String search) {
	    return apprservice.getEmployees(search);
	}
	
    // 내 결재 관리 페이지 이동 요청
	@RequestMapping(value="/approval/myapproval.go")
	public String myapproval(Model model) {
		logger.info("내 결재 관리 페이지 이동");		
		return "approval/myapproval";
	}
	

    
}

