package com.my.cab.dto;

import org.apache.ibatis.type.Alias;


@Alias("main")
public class MainDTO {
	
	private String att_time;

	public String getAtt_time() {
		return att_time;
	}

	public void setAtt_time(String att_time) {
		this.att_time = att_time;
	}
	
	
}
