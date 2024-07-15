package com.my.cab.dao;

import com.my.cab.dto.MailDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailDAO {

    boolean mailDBInsert(MailDTO mailDTO);
}
