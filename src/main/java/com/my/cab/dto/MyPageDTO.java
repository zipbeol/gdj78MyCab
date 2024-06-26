package com.my.cab.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias(value="myPage")
public class MyPageDTO {
	
	private int emp_no;
	private int dept_no;
	private int title_no;
	private String emp_password;
	private String emp_name;
	private String emp_email;
	private Date emp_hired_date;
	private String emp_add;
	private String emp_addDetail;//주소
	private String emp_extension_number; //내선번호
	private String emp_cell;
	private String emp_bday;
	private int emp_level; //권한
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
	public String getEmp_addDetail() {
		return emp_addDetail;
	}
	public void setEmp_addDetail(String emp_addDetail) {
		this.emp_addDetail = emp_addDetail;
	}
	
	

}
