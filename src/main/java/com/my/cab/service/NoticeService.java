package com.my.cab.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.my.cab.dao.NoticeDAO;
import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;


@Service
public class NoticeService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	private static final int PAGE_SIZE = 10;
	
    @Value("${spring.servlet.multipart.location}")
    private String uploadDir;
    
	@Autowired
	NoticeDAO noticeDAO;
	
	public Map<String, Object> getNoticeList(Map<String, Object> param, SearchDTO searchDTO) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page = (searchDTO.getPage() - 1) * PAGE_SIZE;
		logger.info("page {}", page);
		logger.info("searchDTO page {}", searchDTO.getPage());
		searchDTO.setPage(page);
		searchDTO.setPageSize(PAGE_SIZE);
		List<FinanceDTO> noticeList = noticeDAO.getNoticeList(searchDTO);
		map.put("notice", noticeList);
		logger.info("공지리스트");
		return map;
	}

	@Transactional
    public int registerNotice(NoticeDTO noticeDTO) {
        // 공지사항 등록
        noticeDAO.insertNotice(noticeDTO);
        return noticeDTO.getNotice_idx(); // 등록된 공지사항의 notice_idx 반환
    }
	
    public void uploadAttachment(NoticeDTO noticeDTO, MultipartFile file) throws IOException {

    	// 이름 바꾸는거
    	 String uploadFileName = "notice_" + noticeDTO.getNotice_idx()+"_"+System.currentTimeMillis()
                 + file.getOriginalFilename()
                 .substring(file.getOriginalFilename()
                         .lastIndexOf("."));
        // 첨부 파일 업로드
        if (!file.isEmpty()) {
        	byte[] bytes = file.getBytes();
            Path filePath = Paths.get(uploadDir+"/"+uploadFileName);
            Files.write(filePath, bytes);
            noticeDTO.setNotice_file_name(file.getOriginalFilename());
            noticeDTO.setNotice_attach_file(filePath.toString());
            noticeDAO.insertAttachment(noticeDTO);
        }
    }

}
