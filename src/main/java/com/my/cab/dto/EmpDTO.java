package com.my.cab.dto;

import java.sql.Date;
import java.util.List;

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
	private String salwrite;
	private int sal_base;
	private int sal_meal;
	private int title_add_pay;
	private int totalSalary;
    private double empInsur;
    private double healthInsur;
    private double longtermInsur;
    private double nationalPension;
    private double incomeTax;
    private double localIncomeTax;
    private int sal_ded_idx;
    private String sal_emp_no;
    private int title_pay_idx;
    private int fix_sal_idx;
    private int sal_bonus;
    private int sal_total;
    private int sal_actual;
    private int sal_register;
    private String sal_register_date;
    private int driver_idx;
    private String driver_name;
    private int total_fare;
    private int settlement_amount;
    private List<Integer> salList;
    private int sal_idx;
    private int sal_modifier;
    private String sal_modify_date;
    private String insur1;
    private String insur2;
    private String insur3;
    private String insur4;
    private String insur5;
    private String insur6;
    private String total_ded;
    private String currMonth;
    
    
	
	public String getCurrMonth() {
		return currMonth;
	}
	public void setCurrMonth(String currMonth) {
		this.currMonth = currMonth;
	}
	public String getTotal_ded() {
		return total_ded;
	}
	public void setTotal_ded(String total_ded) {
		this.total_ded = total_ded;
	}
	public String getInsur1() {
		return insur1;
	}
	public void setInsur1(String insur1) {
		this.insur1 = insur1;
	}
	public String getInsur2() {
		return insur2;
	}
	public void setInsur2(String insur2) {
		this.insur2 = insur2;
	}
	public String getInsur3() {
		return insur3;
	}
	public void setInsur3(String insur3) {
		this.insur3 = insur3;
	}
	public String getInsur4() {
		return insur4;
	}
	public void setInsur4(String insur4) {
		this.insur4 = insur4;
	}
	public String getInsur5() {
		return insur5;
	}
	public void setInsur5(String insur5) {
		this.insur5 = insur5;
	}
	public String getInsur6() {
		return insur6;
	}
	public void setInsur6(String insur6) {
		this.insur6 = insur6;
	}
	public String getSal_modify_date() {
		return sal_modify_date;
	}
	public void setSal_modify_date(String sal_modify_date) {
		this.sal_modify_date = sal_modify_date;
	}
	public int getSal_modifier() {
		return sal_modifier;
	}
	public void setSal_modifier(int sal_modifier) {
		this.sal_modifier = sal_modifier;
	}
	public int getSal_idx() {
		return sal_idx;
	}
	public void setSal_idx(int sal_idx) {
		this.sal_idx = sal_idx;
	}
	public List<Integer> getSalList() {
		return salList;
	}
	public void setSalList(List<Integer> salList) {
		this.salList = salList;
	}
	public int getDriver_idx() {
		return driver_idx;
	}
	public void setDriver_idx(int driver_idx) {
		this.driver_idx = driver_idx;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public int getTotal_fare() {
		return total_fare;
	}
	public void setTotal_fare(int total_fare) {
		this.total_fare = total_fare;
	}
	public int getSettlement_amount() {
		return settlement_amount;
	}
	public void setSettlement_amount(int settlement_amount) {
		this.settlement_amount = settlement_amount;
	}
	public String getSal_register_date() {
		return sal_register_date;
	}
	public void setSal_register_date(String sal_register_date) {
		this.sal_register_date = sal_register_date;
	}
	public int getSal_ded_idx() {
		return sal_ded_idx;
	}
	public void setSal_ded_idx(int sal_ded_idx) {
		this.sal_ded_idx = sal_ded_idx;
	}
	public String getSal_emp_no() {
		return sal_emp_no;
	}
	public void setSal_emp_no(String sal_emp_no) {
		this.sal_emp_no = sal_emp_no;
	}
	public int getFix_sal_idx() {
		return fix_sal_idx;
	}
	public void setFix_sal_idx(int fix_sal_idx) {
		this.fix_sal_idx = fix_sal_idx;
	}
	public int getSal_bonus() {
		return sal_bonus;
	}
	public void setSal_bonus(int sal_bonus) {
		this.sal_bonus = sal_bonus;
	}
	public int getSal_actual() {
		return sal_actual;
	}
	public void setSal_actual(int sal_actual) {
		this.sal_actual = sal_actual;
	}
	public int getSal_register() {
		return sal_register;
	}
	public void setSal_register(int sal_register) {
		this.sal_register = sal_register;
	}
	public int getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(int totalSalary) {
		this.totalSalary = totalSalary;
	}
	public double getEmpInsur() {
		return empInsur;
	}
	public void setEmpInsur(double empInsur) {
		this.empInsur = empInsur;
	}
	public double getHealthInsur() {
		return healthInsur;
	}
	public void setHealthInsur(double healthInsur) {
		this.healthInsur = healthInsur;
	}
	public double getLongtermInsur() {
		return longtermInsur;
	}
	public void setLongtermInsur(double longtermInsur) {
		this.longtermInsur = longtermInsur;
	}
	public double getNationalPension() {
		return nationalPension;
	}
	public void setNationalPension(double nationalPension) {
		this.nationalPension = nationalPension;
	}
	public double getIncomeTax() {
		return incomeTax;
	}
	public void setIncomeTax(double incomeTax) {
		this.incomeTax = incomeTax;
	}
	public double getLocalIncomeTax() {
		return localIncomeTax;
	}
	public void setLocalIncomeTax(double localIncomeTax) {
		this.localIncomeTax = localIncomeTax;
	}
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
