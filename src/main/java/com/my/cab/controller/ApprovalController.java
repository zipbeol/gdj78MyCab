package com.my.cab.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.cab.dto.ApprovalWriteFromDTO;
import com.my.cab.service.ApprovalService;



@Controller
public class ApprovalController {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ApprovalService apprservice;
	
	@RequestMapping(value="approval/approvalWriteForm.go")
	public String approvalWriteForm(Model model) {

		logger.info("기안서 작성 페이지 이동");
		
		List<ApprovalWriteFromDTO> list = apprservice.approvalWriteList();
		logger.info("list : {} ", list);
		model.addAttribute("approvalWriteList", list);
		
		return "approval/approvalWriteForm";
	}
	
    private static final String UPLOAD_DIR = "C:/upload"; // 저장 디렉토리

    // 애플리케이션 시작 시 저장 디렉토리 생성
    static {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    @PostMapping("/save-html")
    public String saveHtmlFile(@RequestParam("htmlContent") String htmlContent, Model model) {
        try {
        	
        	System.out.println("Received HTML content: " + htmlContent);
            // 현재 시간을 밀리초 단위로 가져옴
            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
            String fileName = "saved_file_" + timeStamp + ".html";
            String filePath = UPLOAD_DIR + File.separator + fileName; // 저장 경로 수정

            // HTML 파일 저장
            File file = new File(filePath);
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(htmlContent.getBytes());
            fos.close();

           /* // 파일 경로를 텍스트 파일에 저장
            try (FileWriter fw = new FileWriter("file_paths.txt", true)) {
                fw.write(filePath + "\n");
            }*/
            
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
    
}

