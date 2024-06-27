package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value = "finance")
public class FinanceDTO {

	private int pro_idx;
	private String pro_category;
	private Date pro_date;
	private String pro_content;
	private String pro_who;
	private int pro_cash;
	private Date pro_actual_date;
	
	private int exp_idx;
	private int exp_sal_idx;
	private int exp_driver_salary_idx;
	private String exp_category;
	private Date exp_date;
	private String exp_content;
	private String exp_who;
	private int exp_cash;
	private Date exp_actual_date;
	
	
	private int deal_idx;
	private int deal_emp_no;
	private int deal_pro_idx;
	private int deal_exp_idx;
	private String deal_field;
	private boolean isProfit;
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
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
	public String getExp_category() {
		return exp_category;
	}
	public void setExp_category(String exp_category) {
		this.exp_category = exp_category;
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
	public int getDeal_idx() {
		return deal_idx;
	}
	public void setDeal_idx(int deal_idx) {
		this.deal_idx = deal_idx;
	}
	public int getDeal_emp_no() {
		return deal_emp_no;
	}
	public void setDeal_emp_no(int deal_emp_no) {
		this.deal_emp_no = deal_emp_no;
	}
	public int getDeal_pro_idx() {
		return deal_pro_idx;
	}
	public void setDeal_pro_idx(int deal_pro_idx) {
		this.deal_pro_idx = deal_pro_idx;
	}
	public int getDeal_exp_idx() {
		return deal_exp_idx;
	}
	public void setDeal_exp_idx(int deal_exp_idx) {
		this.deal_exp_idx = deal_exp_idx;
	}
	public String getDeal_field() {
		return deal_field;
	}
	public void setDeal_field(String deal_field) {
		this.deal_field = deal_field;
	}
	public boolean isProfit() {
		return isProfit;
	}
	public void setProfit(boolean isProfit) {
		this.isProfit = isProfit;
	}
	public int getExp_idx() {
		return exp_idx;
	}
	public void setExp_idx(int exp_idx) {
		this.exp_idx = exp_idx;
	}
	

}
