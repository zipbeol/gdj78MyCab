package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("taxi")
public class TaxiDTO {
    private String taxi_license_plate;
    private String taxi_model;
    private String taxi_registration_date;
    private String taxi_scrap_car_date;
    private String taxi_scrap_car_reason;
    private String taxi_is_active;
    private String taxi_fuel_type;
    private String taxi_year;

    public String getTaxi_license_plate() {
        return taxi_license_plate;
    }

    public void setTaxi_license_plate(String taxi_license_plate) {
        this.taxi_license_plate = taxi_license_plate;
    }

    public String getTaxi_model() {
        return taxi_model;
    }

    public void setTaxi_model(String taxi_model) {
        this.taxi_model = taxi_model;
    }

    public String getTaxi_registration_date() {
        return taxi_registration_date;
    }

    public void setTaxi_registration_date(String taxi_registration_date) {
        this.taxi_registration_date = taxi_registration_date;
    }

    public String getTaxi_scrap_car_date() {
        return taxi_scrap_car_date;
    }

    public void setTaxi_scrap_car_date(String taxi_scrap_car_date) {
        this.taxi_scrap_car_date = taxi_scrap_car_date;
    }

    public String getTaxi_scrap_car_reason() {
        return taxi_scrap_car_reason;
    }

    public void setTaxi_scrap_car_reason(String taxi_scrap_car_reason) {
        this.taxi_scrap_car_reason = taxi_scrap_car_reason;
    }

    public String getTaxi_is_active() {
        return taxi_is_active;
    }

    public void setTaxi_is_active(String taxi_is_active) {
        this.taxi_is_active = taxi_is_active;
    }

    public String getTaxi_fuel_type() {
        return taxi_fuel_type;
    }

    public void setTaxi_fuel_type(String taxi_fuel_type) {
        this.taxi_fuel_type = taxi_fuel_type;
    }

    public String getTaxi_year() {
        return taxi_year;
    }

    public void setTaxi_year(String taxi_year) {
        this.taxi_year = taxi_year;
    }
}
