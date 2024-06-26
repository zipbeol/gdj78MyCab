package com.my.cab.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {
	
	
	 @RequestMapping("/error")
	    public String error(HttpServletRequest request) {
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	        
	        if (status != null) {
	            Integer statusCode = Integer.valueOf(status.toString());
	        
	            if(statusCode == HttpStatus.NOT_FOUND.value()) {
	                return "error/404";
	            }
	            else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	                return "error/500";
	            }
	        }
	        return "error/error";
	    }

}
