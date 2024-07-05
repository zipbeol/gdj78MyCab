package com.my.cab.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("resourceDTO")
public class ResourceDTO {
	
	// 자원 관리 
	private int resource_idx;	
	private String resource_name;	
	private String resource_category;	
	private LocalDateTime resource_create_date;	
	private LocalDateTime resource_edit_date;	
	private int resource_management_emp_no;	
	private int resource_edit_id;	
	private String resource_state;	
	private String resource_content;	
	private String resource_location;
	
	//회의실
	private int meeting_room_idx;	
	private int meeting_room_resource_idx;	
	private int meeting_room_capacity;	
	private String resource_meeting_content;
	
	//회사차량
	private int company_car_idx;	
	private int company_car_resource_idx;	
	private String company_car_category;
	private String company_car_license_plate;	
	private int company_car_capacity;	
	private String resource_company_content;
	
	// 비품
	private int equipment_idx	;
	private int resource_equipment_idx;	
	private String resource_equipment_category;	
	private String resource_equipment_content;
	
	private int resource_reservation_idx;	
	private int resource_reservation_emp_no;	 	
	private String dept_category;	
	private String reserve_reserve_content;	
	private LocalDateTime resource_reserve_start_date;	
	private LocalDateTime resource_reserve_end_date	;
	private LocalDateTime resource_reserve_create_date;
	private LocalDateTime resource_reserve_edit_date;	
	private int resource_reserve_editor;	
	private boolean resource_reserve_del;
	
	private int id ;
	
	
	public int getResource_idx() {
		return resource_idx;
	}
	public void setResource_idx(int resource_idx) {
		this.resource_idx = resource_idx;
	}
	public String getResource_name() {
		return resource_name;
	}
	public void setResource_name(String resource_name) {
		this.resource_name = resource_name;
	}
	public String getResource_category() {
		return resource_category;
	}
	public void setResource_category(String resource_category) {
		this.resource_category = resource_category;
	}
	public LocalDateTime getResource_create_date() {
		return resource_create_date;
	}
	public void setResource_create_date(LocalDateTime resource_create_date) {
		this.resource_create_date = resource_create_date;
	}
	public LocalDateTime getResource_edit_date() {
		return resource_edit_date;
	}
	public void setResource_edit_date(LocalDateTime resource_edit_date) {
		this.resource_edit_date = resource_edit_date;
	}
	public int getResource_management_emp_no() {
		return resource_management_emp_no;
	}
	public void setResource_management_emp_no(int resource_management_emp_no) {
		this.resource_management_emp_no = resource_management_emp_no;
	}
	public int getResource_edit_id() {
		return resource_edit_id;
	}
	public void setResource_edit_id(int resource_edit_id) {
		this.resource_edit_id = resource_edit_id;
	}
	public String getResource_state() {
		return resource_state;
	}
	public void setResource_state(String resource_state) {
		this.resource_state = resource_state;
	}
	public String getResource_content() {
		return resource_content;
	}
	public void setResource_content(String resource_content) {
		this.resource_content = resource_content;
	}
	public String getResource_location() {
		return resource_location;
	}
	public void setResource_location(String resource_location) {
		this.resource_location = resource_location;
	}
	public int getMeeting_room_idx() {
		return meeting_room_idx;
	}
	public void setMeeting_room_idx(int meeting_room_idx) {
		this.meeting_room_idx = meeting_room_idx;
	}
	public int getMeeting_room_resource_idx() {
		return meeting_room_resource_idx;
	}
	public void setMeeting_room_resource_idx(int meeting_room_resource_idx) {
		this.meeting_room_resource_idx = meeting_room_resource_idx;
	}
	public int getMeeting_room_capacity() {
		return meeting_room_capacity;
	}
	public void setMeeting_room_capacity(int meeting_room_capacity) {
		this.meeting_room_capacity = meeting_room_capacity;
	}
	public String getResource_meeting_content() {
		return resource_meeting_content;
	}
	public void setResource_meeting_content(String resource_meeting_content) {
		this.resource_meeting_content = resource_meeting_content;
	}
	public int getCompany_car_idx() {
		return company_car_idx;
	}
	public void setCompany_car_idx(int company_car_idx) {
		this.company_car_idx = company_car_idx;
	}
	public int getCompany_car_resource_idx() {
		return company_car_resource_idx;
	}
	public void setCompany_car_resource_idx(int company_car_resource_idx) {
		this.company_car_resource_idx = company_car_resource_idx;
	}
	public String getCompany_car_category() {
		return company_car_category;
	}
	public void setCompany_car_category(String company_car_category) {
		this.company_car_category = company_car_category;
	}
	public String getCompany_car_license_plate() {
		return company_car_license_plate;
	}
	public void setCompany_car_license_plate(String company_car_license_plate) {
		this.company_car_license_plate = company_car_license_plate;
	}
	public int getCompany_car_capacity() {
		return company_car_capacity;
	}
	public void setCompany_car_capacity(int company_car_capacity) {
		this.company_car_capacity = company_car_capacity;
	}
	public String getResource_company_content() {
		return resource_company_content;
	}
	public void setResource_company_content(String resource_company_content) {
		this.resource_company_content = resource_company_content;
	}
	public int getEquipment_idx() {
		return equipment_idx;
	}
	public void setEquipment_idx(int equipment_idx) {
		this.equipment_idx = equipment_idx;
	}
	public int getResource_equipment_idx() {
		return resource_equipment_idx;
	}
	public void setResource_equipment_idx(int resource_equipment_idx) {
		this.resource_equipment_idx = resource_equipment_idx;
	}
	public String getResource_equipment_category() {
		return resource_equipment_category;
	}
	public void setResource_equipment_category(String resource_equipment_category) {
		this.resource_equipment_category = resource_equipment_category;
	}
	public String getResource_equipment_content() {
		return resource_equipment_content;
	}
	public void setResource_equipment_content(String resource_equipment_content) {
		this.resource_equipment_content = resource_equipment_content;
	}
	public int getResource_reservation_idx() {
		return resource_reservation_idx;
	}
	public void setResource_reservation_idx(int resource_reservation_idx) {
		this.resource_reservation_idx = resource_reservation_idx;
	}
	public int getResource_reservation_emp_no() {
		return resource_reservation_emp_no;
	}
	public void setResource_reservation_emp_no(int resource_reservation_emp_no) {
		this.resource_reservation_emp_no = resource_reservation_emp_no;
	}
	public String getDept_category() {
		return dept_category;
	}
	public void setDept_category(String dept_category) {
		this.dept_category = dept_category;
	}
	public String getReserve_reserve_content() {
		return reserve_reserve_content;
	}
	public void setReserve_reserve_content(String reserve_reserve_content) {
		this.reserve_reserve_content = reserve_reserve_content;
	}
	public LocalDateTime getResource_reserve_start_date() {
		return resource_reserve_start_date;
	}
	public void setResource_reserve_start_date(LocalDateTime resource_reserve_start_date) {
		this.resource_reserve_start_date = resource_reserve_start_date;
	}
	public LocalDateTime getResource_reserve_end_date() {
		return resource_reserve_end_date;
	}
	public void setResource_reserve_end_date(LocalDateTime resource_reserve_end_date) {
		this.resource_reserve_end_date = resource_reserve_end_date;
	}
	public LocalDateTime getResource_reserve_create_date() {
		return resource_reserve_create_date;
	}
	public void setResource_reserve_create_date(LocalDateTime resource_reserve_create_date) {
		this.resource_reserve_create_date = resource_reserve_create_date;
	}
	public LocalDateTime getResource_reserve_edit_date() {
		return resource_reserve_edit_date;
	}
	public void setResource_reserve_edit_date(LocalDateTime resource_reserve_edit_date) {
		this.resource_reserve_edit_date = resource_reserve_edit_date;
	}
	public int getResource_reserve_editor() {
		return resource_reserve_editor;
	}
	public void setResource_reserve_editor(int resource_reserve_editor) {
		this.resource_reserve_editor = resource_reserve_editor;
	}
	public boolean isResource_reserve_del() {
		return resource_reserve_del;
	}
	public void setResource_reserve_del(boolean resource_reserve_del) {
		this.resource_reserve_del = resource_reserve_del;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

}
