package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface NoticeDAO {

	List<NoticeDTO> getNoticeList(SearchDTO searchDTO);

	void insertNotice(NoticeDTO noticeDTO);

	void insertAttachment(NoticeDTO noticeDTO);

	int countImportantNotices();

	void inactivateNotice(int noticeId);

	int getNoticeCount(SearchDTO searchDTO);

	NoticeDTO getDetail(String notice_idx);

	List<NoticeDTO> getList(String notice_idx);

	List<NoticeDTO> getModify(String notice_idx);

	void updateNotice(NoticeDTO noticeDTO);

	NoticeDTO getAttachment(int notice_idx);

	void updateAttachment(NoticeDTO noticeDTO);

	void deleteAttachment(int notice_attach_file_idx);

	List<String> getExistingFileNames(int notice_idx);

}
