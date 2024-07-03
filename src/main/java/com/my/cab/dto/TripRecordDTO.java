package com.my.cab.dto;

import org.apache.ibatis.type.Alias;

@Alias("tripRecord")
public class TripRecordDTO {
    private String trip_record_date;
    private String trip_record_start_location;
    private String trip_record_end_location;
    private String trip_record_distance;
    private String trip_record_fare;
    private String trip_record_taxi_idx;
    private String trip_record_driver_id;
    private String trip_record_idx;
    private String[] recordLats;
    private String[] recordLngs;
    private String trip_record_driver_name;
    private String trip_license_plate;

    public String getTrip_license_plate() {
        return trip_license_plate;
    }

    public void setTrip_license_plate(String trip_license_plate) {
        this.trip_license_plate = trip_license_plate;
    }

    public String getTrip_record_driver_name() {
        return trip_record_driver_name;
    }

    public void setTrip_record_driver_name(String trip_record_driver_name) {
        this.trip_record_driver_name = trip_record_driver_name;
    }

    public String[] getRecordLats() {
        return recordLats;
    }

    public void setRecordLats(String[] recordLats) {
        this.recordLats = recordLats;
    }

    public String[] getRecordLngs() {
        return recordLngs;
    }

    public void setRecordLngs(String[] recordLngs) {
        this.recordLngs = recordLngs;
    }

    public String getTrip_record_taxi_idx() {
        return trip_record_taxi_idx;
    }

    public void setTrip_record_taxi_idx(String trip_record_taxi_idx) {
        this.trip_record_taxi_idx = trip_record_taxi_idx;
    }

    public String getTrip_record_driver_id() {
        return trip_record_driver_id;
    }

    public void setTrip_record_driver_id(String trip_record_driver_id) {
        this.trip_record_driver_id = trip_record_driver_id;
    }

    public String getTrip_record_idx() {
        return trip_record_idx;
    }

    public void setTrip_record_idx(String trip_record_idx) {
        this.trip_record_idx = trip_record_idx;
    }

    public String getTrip_record_date() {
        return trip_record_date;
    }

    public void setTrip_record_date(String trip_record_date) {
        this.trip_record_date = trip_record_date;
    }

    public String getTrip_record_start_location() {
        return trip_record_start_location;
    }

    public void setTrip_record_start_location(String trip_record_start_location) {
        this.trip_record_start_location = trip_record_start_location;
    }

    public String getTrip_record_end_location() {
        return trip_record_end_location;
    }

    public void setTrip_record_end_location(String trip_record_end_location) {
        this.trip_record_end_location = trip_record_end_location;
    }

    public String getTrip_record_distance() {
        return trip_record_distance;
    }

    public void setTrip_record_distance(String trip_record_distance) {
        this.trip_record_distance = trip_record_distance;
    }

    public String getTrip_record_fare() {
        return trip_record_fare;
    }

    public void setTrip_record_fare(String trip_record_fare) {
        this.trip_record_fare = trip_record_fare;
    }
}
