package com.my.cab.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.my.cab.util.LoginChecker;


@Configuration// 이 어노테이션이 있어야 설정 클래스로 인식 된다.
public class InterCeptorConfig implements WebMvcConfigurer {
	
	//인터셉터에 등록할 클래스를 가져온다.
	@Autowired LoginChecker checker;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		
		//1. 인터셉터에 등록할 로직 추가
		//2. 인터셉터가 가로챌 url 패턴 등록
		//3. 인터셉터가 예외로  둘 url 패턴 등록
		List<String>excludeList = new ArrayList<String>();
		excludeList.add("/login/**"); //longin.뒤에 뭐가 오든지 (login.go, login.do...)
		excludeList.add("/resources/**"); //resources 하위 요청 ( img, css, js )
		excludeList.add("/assets/**");
		excludeList.add("/emp/login.do");
		
		
		registry.addInterceptor(checker)
		.addPathPatterns("/**")//예외없이 모든 url에 다 넣어라
		.excludePathPatterns(excludeList); //위에서 리스트에 넣어준 예외목록 지정하기
		
		
	}
	
	
	

}
