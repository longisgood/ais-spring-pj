package com.third.springpj.common.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;


@Component
@Aspect
@Slf4j
public class ServiceAdvice {

	@Around("execution(* com.third.springpj.*.service.*.*(..))")
	public Object checkService(ProceedingJoinPoint pjp) throws Throwable {
		// 전처리
		log.info("================= START =================");
		log.info("--- 実行　クラス : " + pjp.getTarget());
		log.info("--- 実行　メソッド : " + pjp.getSignature().getName());
		log.info("--- 入力値 : " + Arrays.toString(pjp.getArgs()));
		Object o = pjp.proceed(); // 실제 메소드 실행부분
		// 후처리
		log.info("--- 返還値  :" + o);
		log.info("================== END ==================");
		return o;
	}

}