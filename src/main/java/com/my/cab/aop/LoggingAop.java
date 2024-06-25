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
        String methodName = joinPoint.getSignature().toShortString();
        Object[] args = joinPoint.getArgs();
        String[] argNames = ((org.aspectj.lang.reflect.MethodSignature) joinPoint.getSignature()).getParameterNames();
        System.out.println("Method called::: " + methodName);
        if (argNames != null && argNames.length > 0) {
            for (int i = 0; i < argNames.length; i++) {
                System.out.println("Parameter name::: {" + argNames[i] + "}, value::: {" + args[i] + "}::: ");
            }
        } else {
            System.out.println("No parameters::: ");
        }
        return joinPoint.proceed();
    }
}
