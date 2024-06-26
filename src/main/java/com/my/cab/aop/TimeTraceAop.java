package com.my.cab.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

@Aspect
@Order(1)
public class TimeTraceAop {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Around("execution(* com.my.cab..*(..)) && !execution(* com.my.cab.config..*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        logger.info("START::: " + joinPoint.toString());
        try {
            return joinPoint.proceed();
        } finally {
            long endTime = System.currentTimeMillis();
            long elapsedTime = endTime - startTime;
            logger.info("END::: " + joinPoint.toString() + " " + elapsedTime + " ms");
        }
    }
}
