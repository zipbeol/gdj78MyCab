package com.my.cab.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

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

        // 파라메터 이름과 타입 가져오기
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        String[] argNames = methodSignature.getParameterNames();
        Class<?>[] argTypes = methodSignature.getParameterTypes();

        logger.info("메서드 호출::: " + methodName);

        // 파라메터 존재하면
        if (argNames != null && argNames.length > 0) {
            for (int i = 0; i < argNames.length; i++) {
                logger.info("파라메터:::  " + argTypes[i].getSimpleName() + " " + argNames[i] + " = " + args[i]);
            }
        } else { // 없으면
            logger.info("파라메터 없음::: ");
        }
        Object result = null;
        try {
            // 실행
            result = joinPoint.proceed();
            return result;
        } finally {
            // 종료후 리턴값
            logger.info("리턴값::: " + result);
        }
    }
}
