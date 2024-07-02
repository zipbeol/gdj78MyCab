package com.my.cab.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.cab.dto.FinanceDTO;
import com.my.cab.dto.NoticeDTO;
import com.my.cab.dto.SearchDTO;

@Mapper
public interface NoticeDAO {

	List<FinanceDTO> getNoticeList(SearchDTO searchDTO);


	void insertNotice(NoticeDTO noticeDTO);



	void insertAttachment(NoticeDTO noticeDTO);



}
