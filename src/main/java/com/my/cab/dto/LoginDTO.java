package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias(value="login")
public class LoginDTO {
	
	private String emp_no;
	private String emp_password;
	boolean first_login;
	private String profile_new;
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
	
	

}
