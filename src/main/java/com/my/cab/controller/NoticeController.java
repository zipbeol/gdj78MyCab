package com.my.cab.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;
import com.my.cab.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/list.go")
	public String noticeList(Model model) {
		logger.info("공지사항 리스트");

		return "notice/noticeList";
	}

	@PostMapping("/list.ajax")
	@ResponseBody
	public Map<String, Object> getNoticeList(SearchDTO searchDTO, @RequestParam Map<String, Object> param) {
		logger.info("공지사항 리스트 - AJAX 요청");
		logger.info("\nsearchDTO SearchText:" + searchDTO.getSearchText() + "\nsearchDTO Category:"
				+ searchDTO.getCategory() + "\nsearchDTO filterStartDate:" + searchDTO.getFilterStartDate()
				+ "\nsearchDTO filterEndDate:" + searchDTO.getFilterEndDate() + "\nsearchDTO page:"
				+ searchDTO.getPage());
		// 서비스 호출하여 리스트 데이터 가져오기
		return noticeService.getNoticeList(param, searchDTO);
	}

	@RequestMapping("/register.go")
	public String noticeRegister(Model model) {
		logger.info("공지사항 작성");

		return "notice/noticeRegister";
	}


    @PostMapping("/register.ajax")
    @ResponseBody
    public String getNoticeRegister(NoticeDTO noticeDTO,@RequestParam("fileAttachment") MultipartFile[] files) throws IOException {
		logger.info("공지사항 작성페이지 - AJAX 요청");
		logger.info("DTO" + noticeDTO.getNotice_title());
		logger.info("DTO" + noticeDTO.getNotice_field());
		logger.info("DTO" + noticeDTO.getNotice_content());
		logger.info("DTO" + noticeDTO.getNotice_imp());
		
        int row = noticeService.registerNotice(noticeDTO); // 공지사항 등록
        for (MultipartFile file : files) {
			logger.info("fileName:{}", file.getOriginalFilename());			
			if (!file.isEmpty()) {
				noticeService.uploadAttachment(noticeDTO, file); // 첨부 파일 업로드
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
        return "redirect:/notice/register"; // 등록 후 페이지 리다이렉트
    }

}
