package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value = "finance")
public class FinanceDTO {

	private String pro_category;
	private Date pro_date;
	private String pro_content;
	private String pro_who;
	private int pro_cash;
	private Date pro_actual_date;
	
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public String getPro_who() {
		return pro_who;
	}
	public void setPro_who(String pro_who) {
		this.pro_who = pro_who;
	}
	public int getPro_cash() {
		return pro_cash;
	}
	public void setPro_cash(int pro_cash) {
		this.pro_cash = pro_cash;
	}
	public Date getPro_actual_date() {
		return pro_actual_date;
	}
	public void setPro_actual_date(Date pro_actual_date) {
		this.pro_actual_date = pro_actual_date;
	}
}
