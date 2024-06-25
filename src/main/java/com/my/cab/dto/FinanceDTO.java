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
	
	private int exp_sal_idx;
	private int exp_driver_salary_idx;
	private String exp_category;
	private Date exp_date;
	private String exp_content;
	private String exp_who;
	private int exp_cash;
	private Date exp_actual_date;
	
	public String getExp_category() {
		return exp_category;
	}
	public void setExp_category(String exp_category) {
		this.exp_category = exp_category;
	}
	public int getExp_sal_idx() {
		return exp_sal_idx;
	}
	public void setExp_sal_idx(int exp_sal_idx) {
		this.exp_sal_idx = exp_sal_idx;
	}
	public int getExp_driver_salary_idx() {
		return exp_driver_salary_idx;
	}
	public void setExp_driver_salary_idx(int exp_driver_salary_idx) {
		this.exp_driver_salary_idx = exp_driver_salary_idx;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	public String getExp_content() {
		return exp_content;
	}
	public void setExp_content(String exp_content) {
		this.exp_content = exp_content;
	}
	public String getExp_who() {
		return exp_who;
	}
	public void setExp_who(String exp_who) {
		this.exp_who = exp_who;
	}
	public int getExp_cash() {
		return exp_cash;
	}
	public void setExp_cash(int exp_cash) {
		this.exp_cash = exp_cash;
	}
	public Date getExp_actual_date() {
		return exp_actual_date;
	}
	public void setExp_actual_date(Date exp_actual_date) {
		this.exp_actual_date = exp_actual_date;
	}
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
