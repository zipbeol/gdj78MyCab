package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="emp")

public class EmpDTO {
	
	
	private int emp_no;
	private int dept_no;
	private int title_no;
	private String emp_password;
	private String emp_name;
	private String emp_email;
	private Date emp_hired_date;
	private Date emp_retired_date;
	private boolean emp_employment_status;
	private String emp_add; //주소
	private String emp_extension_number; //내선번호
	private String emp_cell;
	private String emp_bday;
	private int emp_level; //권한
	private String acc_no;
	private String bank_name;
	private String acc_name;
	private String dept_name;
	private String title_name;
	private String vac_left; //잔여 연차
	private String profile_new; // 프로필 사진
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getTitle_no() {
		return title_no;
	}
	public void setTitle_no(int title_no) {
		this.title_no = title_no;
	}
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public Date getEmp_hired_date() {
		return emp_hired_date;
	}
	public void setEmp_hired_date(Date emp_hired_date) {
		this.emp_hired_date = emp_hired_date;
	}
	public Date getEmp_retired_date() {
		return emp_retired_date;
	}
	public void setEmp_retired_date(Date emp_retired_date) {
		this.emp_retired_date = emp_retired_date;
	}
	public boolean isEmp_employment_status() {
		return emp_employment_status;
	}
	public void setEmp_employment_status(boolean emp_employment_status) {
		this.emp_employment_status = emp_employment_status;
	}
	public String getEmp_add() {
		return emp_add;
	}
	public void setEmp_add(String emp_add) {
		this.emp_add = emp_add;
	}
	public String getEmp_extension_number() {
		return emp_extension_number;
	}
	public void setEmp_extension_number(String emp_extension_number) {
		this.emp_extension_number = emp_extension_number;
	}
	public String getEmp_cell() {
		return emp_cell;
	}
	public void setEmp_cell(String emp_cell) {
		this.emp_cell = emp_cell;
	}
	public String getEmp_bday() {
		return emp_bday;
	}
	public void setEmp_bday(String emp_bday) {
		this.emp_bday = emp_bday;
	}
	public int getEmp_level() {
		return emp_level;
	}
	public void setEmp_level(int emp_level) {
		this.emp_level = emp_level;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getTitle_name() {
		return title_name;
	}
	public void setTitle_name(String title_name) {
		this.title_name = title_name;
	}
	public String getVac_left() {
		return vac_left;
	}
	public void setVac_left(String vac_left) {
		this.vac_left = vac_left;
	}
	public String getProfile_new() {
		return profile_new;
	}
	public void setProfile_new(String profile_new) {
		this.profile_new = profile_new;
	}
	
	
	
	
	

}
