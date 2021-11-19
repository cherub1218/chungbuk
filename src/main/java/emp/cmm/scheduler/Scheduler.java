package emp.cmm.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import emp.bam.service.BusinessAnnouncementService;
import emp.bpm.service.BusinessPlanService;

@Component
public class Scheduler {

	@Autowired
	BusinessAnnouncementService service;
	
	@Autowired
	BusinessPlanService Pservice;
	/**
	 * 1. 매일 새벽 0시에 자동으로 실행되는 스케쥴러
	 */
	// * 을 입력할경우 모두(항상)으로 설정함.
	//                 초  분  시  일  월  요일
	@Scheduled(cron ="0 0 0 * * *")
	 public void ANCUpdate() throws Exception {
		 
		service.businessAnnouncementOldUpdate();
		Pservice.businessPlanStatusUpdate();
	}
}