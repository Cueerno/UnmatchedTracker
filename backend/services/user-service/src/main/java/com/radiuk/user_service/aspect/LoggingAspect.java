package com.radiuk.user_service.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Aspect
@Component
public class LoggingAspect {

    @Pointcut("execution(public * com.radiuk.user_service.service.impl..*(..))")
    public void serviceMethods() {}

    @Pointcut("@annotation(com.radiuk.user_service.annotation.NoLogging)")
    public void noLoggingMethods() {}

    @Pointcut("serviceMethods() && !noLoggingMethods()")
    public void loggableServiceMethods() {}

    @Before("loggableServiceMethods()")
    public void logMethodCall(JoinPoint joinPoint) {
        String className = joinPoint.getTarget().getClass().getSimpleName();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        log.debug("[{}.{}] -> called with args={}", className, methodName, args);
    }

    @AfterReturning(pointcut = "loggableServiceMethods()", returning = "result")
    public void logMethodReturn(JoinPoint joinPoint, Object result) {
        String className = joinPoint.getTarget().getClass().getSimpleName();
        String methodName = joinPoint.getSignature().getName();

        if (result instanceof List<?>) {
            log.info("[{}.{}] -> finished successfully: returned list with size={}", className, methodName, ((List<?>) result).size());
        } else {
            log.info("[{}.{}] -> finished successfully: result={}", className, methodName, result);
        }
    }

    @AfterThrowing(pointcut = "loggableServiceMethods()", throwing = "ex")
    public void logMethodException(JoinPoint joinPoint, Exception ex) {
        String className = joinPoint.getTarget().getClass().getSimpleName();
        String methodName = joinPoint.getSignature().getName();
        log.warn("[{}.{}] -> exception thrown: {}", className, methodName, ex.getMessage(), ex);
    }
}
