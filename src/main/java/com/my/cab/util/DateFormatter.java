package com.my.cab.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {
    private static final String DATE_FORMAT = "yyyy-MM-dd";

    /**
     * {@code Date}날짜 넣으면 {@code String}타입으로 변환하는 메서드
     * @param date
     * @return
     */
    public static String dateToString(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
        return formatter.format(date);
    }

    /**
     * {@code String}날짜 넣으면 {@code Date}타입으로 변환하는 메서드
     * @param date
     * @return
     */
    public static Date stringToUtilDate(String date) {
        SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
        try {
            return formatter.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 스트링을 sql.Date 형태로 변경
     * @param date
     * @return
     */
    public static java.sql.Date stringToSqlDate(String date) {
        java.util.Date utilDate = stringToUtilDate(date);
        if (utilDate != null) {
            return new java.sql.Date(utilDate.getTime());
        } else {
            return null;
        }
    }

    /**
     * util.Date 를 sql.Date 로 변경
     * @param date
     * @return
     */
    public static java.sql.Date utilDateToSqlDate(java.util.Date date) {
        if (date != null) {
            return new java.sql.Date(date.getTime());
        } else {
            return null;
        }
    }
}
