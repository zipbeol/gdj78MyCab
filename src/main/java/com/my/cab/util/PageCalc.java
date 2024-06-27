package com.my.cab.util;

import org.springframework.stereotype.Component;

@Component
public class PageCalc {

    /**
     * {@code int}현재 페이지 와  {@code int}페이지사이즈 넣어주면 페이지 오프셋 나오는 메서드
     * @param pageNum 현재 페이지
     * @param pageSize 페이지 사이즈
     * @return {@code int}
     */
    public int calculatePageOffset(int pageNum, int pageSize) {
        return (pageNum - 1) * pageSize;
    }

    /**
     * totalCount 와 pageSize 로 totalPage 구하는 메서드
     *
     * @param totalCount 총 갯수
     * @param pageSize 페이지 사이즈
     * @return 토탈 페이지
     */
    public int calculateTotalPages(int totalCount, int pageSize) {
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        return totalPages > 0 ? totalPages : 1;
    }
}
