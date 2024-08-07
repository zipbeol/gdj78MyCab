package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias(value="login")
public class LoginDTO {
	
	private String emp_no;
	private String emp_password;
	boolean first_login;
	private String profile_new;
	private String dept_no;
	private String title_no;
	private String emp_level;
	private String emp_name;
	private String dept_name;
	private String title_name;
	private String emp_email;
	
	
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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
	public String getDept_no() {
		return dept_no;
	}
	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}
	public String getTitle_no() {
		return title_no;
	}
	public void setTitle_no(String title_no) {
		this.title_no = title_no;
	}
	public String getEmp_level() {
		return emp_level;
	}
	public void setEmp_level(String emp_level) {
		this.emp_level = emp_level;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
	public boolean isFirst_login() {
		return first_login;
	}
	public void setFirst_login(boolean first_login) {
		this.first_login = first_login;
	}
	public String getProfile_new() {
		return profile_new;
	}
	public void setProfile_new(String profile_new) {
		this.profile_new = profile_new;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	

}
