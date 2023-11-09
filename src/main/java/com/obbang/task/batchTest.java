package com.obbang.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class batchTest {
	
	@Scheduled(cron = "0 0 1 * * *")
	public void TestMethod() throws Exception{
		log.warn("배치 실행 테스트..........");
		log.warn("=========================");
	}
}
