package com.my.cab.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

import java.util.Arrays;

@Aspect
@Order(2)
public class LoggingAop {
    Logger logger = LoggerFactory.getLogger(getClass());

    @Around("execution(* com.my.cab.controller..*(..)) || execution(* com.my.cab.service..*(..))")
    public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {
        // 메서드 이름 가져오기
        String methodName = joinPoint.getSignature().toShortString();

        // 파라메터 값 가져오기
        Object[] args = joinPoint.getArgs();

        // 파라메터 이름 가져오기
        String[] argNames = ((org.aspectj.lang.reflect.MethodSignature) joinPoint.getSignature()).getParameterNames();

        System.out.println("Method called::: " + methodName);

        // 파라메터 존재하면
        if (argNames != null && argNames.length > 0) {
            for (int i = 0; i < argNames.length; i++) {
                System.out.println("Parameter name::: {" + argNames[i] + "}, value::: {" + args[i] + "}::: ");
            }
        } else { // 없으면
            System.out.println("No parameters::: ");
        }
        Object result = null;
        try {
            // 실행
            result = joinPoint.proceed();
            return result;
        } finally {
            // 종료후 리턴값
            System.out.println("Method Return::: " + result);
        }
    }
}
