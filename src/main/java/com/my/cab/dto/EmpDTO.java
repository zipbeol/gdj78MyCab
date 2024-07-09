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
	private String profile_new; // 프로필 사진
	private int work_year;
	private String vac_left; //잔여 연차
	private double vac_add;
	private double vac_idx;
	private int difference;
	private double vac_use;
	private String vac_type;
	private String vac_apply_date;
	private boolean vac_apply_status;
	private String vac_reason;
	private String vac_reject_reason;
	private String vac_use_date;
	private String vac_use_end_date;
	private String vac_no;
	private boolean vac_apply_status_final;
	private String vac_reject_reason_final;
	private int sal_total;
	private String salwrite;
	private int sal_base;
	private int sal_meal;
	private int title_pay_idx;
	private int title_add_pay;
	
	
	public int getSal_base() {
		return sal_base;
	}
	public void setSal_base(int sal_base) {
		this.sal_base = sal_base;
	}
	public int getSal_meal() {
		return sal_meal;
	}
	public void setSal_meal(int sal_meal) {
		this.sal_meal = sal_meal;
	}
	public int getTitle_pay_idx() {
		return title_pay_idx;
	}
	public void setTitle_pay_idx(int title_pay_idx) {
		this.title_pay_idx = title_pay_idx;
	}
	public int getTitle_add_pay() {
		return title_add_pay;
	}
	public void setTitle_add_pay(int title_add_pay) {
		this.title_add_pay = title_add_pay;
	}
	public String getSalwrite() {
		return salwrite;
	}
	public void setSalwrite(String salwrite) {
		this.salwrite = salwrite;
	}
	public int getSal_total() {
		return sal_total;
	}
	public void setSal_total(int sal_total) {
		this.sal_total = sal_total;
	}
	public double getVac_use() {
		return vac_use;
	}
	public void setVac_use(double vac_use) {
		this.vac_use = vac_use;
	}
	public String getVac_type() {
		return vac_type;
	}
	public void setVac_type(String vac_type) {
		this.vac_type = vac_type;
	}
	public String getVac_apply_date() {
		return vac_apply_date;
	}
	public void setVac_apply_date(String vac_apply_date) {
		this.vac_apply_date = vac_apply_date;
	}
	public boolean isVac_apply_status() {
		return vac_apply_status;
	}
	public void setVac_apply_status(boolean vac_apply_status) {
		this.vac_apply_status = vac_apply_status;
	}
	public String getVac_reason() {
		return vac_reason;
	}
	public void setVac_reason(String vac_reason) {
		this.vac_reason = vac_reason;
	}
	public String getVac_reject_reason() {
		return vac_reject_reason;
	}
	public void setVac_reject_reason(String vac_reject_reason) {
		this.vac_reject_reason = vac_reject_reason;
	}
	public String getVac_use_date() {
		return vac_use_date;
	}
	public void setVac_use_date(String vac_use_date) {
		this.vac_use_date = vac_use_date;
	}
	public String getVac_use_end_date() {
		return vac_use_end_date;
	}
	public void setVac_use_end_date(String vac_use_end_date) {
		this.vac_use_end_date = vac_use_end_date;
	}
	public String getVac_no() {
		return vac_no;
	}
	public void setVac_no(String vac_no) {
		this.vac_no = vac_no;
	}
	public boolean isVac_apply_status_final() {
		return vac_apply_status_final;
	}
	public void setVac_apply_status_final(boolean vac_apply_status_final) {
		this.vac_apply_status_final = vac_apply_status_final;
	}
	public String getVac_reject_reason_final() {
		return vac_reject_reason_final;
	}
	public void setVac_reject_reason_final(String vac_reject_reason_final) {
		this.vac_reject_reason_final = vac_reject_reason_final;
	}
	public int getDifference() {
		return difference;
	}
	public void setDifference(int difference) {
		this.difference = difference;
	}
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
	public int getWork_year() {
		return work_year;
	}
	public void setWork_year(int work_year) {
		this.work_year = work_year;
	}
	public double getVac_add() {
		return vac_add;
	}
	public void setVac_add(double vac_add) {
		this.vac_add = vac_add;
	}
	public double getVac_idx() {
		return vac_idx;
	}
	public void setVac_idx(double vac_idx) {
		this.vac_idx = vac_idx;
	}
	
	
	
	
	
	
	

}
