package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("driver")
public class DriverDTO {
    private int driver_idx;
    private String driver_name;
    private String driver_photo;
    private String driver_taxi_license_photo;
    private String driver_address;
    private String driver_phone;
    private String driver_registration_date;
    private String driver_quit_date;
    private String driver_is_retired;
    private String driver_address_detail;

    public String getDriver_address_detail() {
        return driver_address_detail;
    }

    public void setDriver_address_detail(String driver_address_detail) {
        this.driver_address_detail = driver_address_detail;
    }

    public String getDriver_taxi_license_photo() {
        return driver_taxi_license_photo;
    }

    public void setDriver_taxi_license_photo(String driver_taxi_license_photo) {
        this.driver_taxi_license_photo = driver_taxi_license_photo;
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

    public String getDriver_photo() {
        return driver_photo;
    }

    public void setDriver_photo(String driver_photo) {
        this.driver_photo = driver_photo;
    }

    public String getDriver_address() {
        return driver_address;
    }

    public void setDriver_address(String driver_address) {
        this.driver_address = driver_address;
    }

    public String getDriver_phone() {
        return driver_phone;
    }

    public void setDriver_phone(String driver_phone) {
        this.driver_phone = driver_phone;
    }

    public String getDriver_registration_date() {
        return driver_registration_date;
    }

    public void setDriver_registration_date(String driver_registration_date) {
        this.driver_registration_date = driver_registration_date;
    }

    public String getDriver_quit_date() {
        return driver_quit_date;
    }

    public void setDriver_quit_date(String driver_quit_date) {
        this.driver_quit_date = driver_quit_date;
    }

    public String getDriver_is_retired() {
        return driver_is_retired;
    }

    public void setDriver_is_retired(String driver_is_retired) {
        this.driver_is_retired = driver_is_retired;
    }
}
