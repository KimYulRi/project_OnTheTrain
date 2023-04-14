package com.kh.onthetrain.scheduler.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.onthetrain.API.model.entity.APILocationCode;
import com.kh.onthetrain.API.service.SchedulerAPIService;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.model.entity.SchedulerAccommodation;
import com.kh.onthetrain.scheduler.model.entity.SchedulerEvent;
import com.kh.onthetrain.scheduler.model.entity.SchedulerImage;
import com.kh.onthetrain.scheduler.model.entity.SchedulerTicket;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class SchedulerServiceimplTest {

	@Autowired
	private SchedulerService service;
	
	@Autowired
	private SchedulerAPIService APIservice;

	@Test
	@Disabled
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void findSchedulerByNo() {
		int no = 1;
		Scheduler findSchedulerByNo = service.findSchedulerByNo(no);
		System.out.println(findSchedulerByNo);
		assertThat(findSchedulerByNo).isNotNull();
	}

	@Test
	void findScAccomByNo() {
		int no = 1;
		SchedulerAccommodation findSchedulerAccommodationByNo = service.findSchedulerAccommodationByNo(no);
		System.out.println(findSchedulerAccommodationByNo);
		assertThat(findSchedulerAccommodationByNo).isNotNull();
	}

	@Test
	void findScEventByNo () {
		int no = 1;
		SchedulerEvent finSchedulerEventByNo = service.findSchedulerEventByNo(no);
		System.out.println(finSchedulerEventByNo);
		assertThat(finSchedulerEventByNo).isNotNull();
	}
	
	@Test
	void findScTicketByNo () {
		int no = 1;
		SchedulerTicket findSchedulerTicketByNo = service.findSchedulerTicketByNo(no);
		System.out.println(findSchedulerTicketByNo);
		assertThat(findSchedulerTicketByNo).isNotNull();
	}
	
	@Test
	void findScImageByNo () {
		int no = 1;
		SchedulerImage findSchedulerImageByNo = service.findSchedulerImageByNo(no);
		System.out.println(findSchedulerImageByNo);
		assertThat(findSchedulerImageByNo).isNotNull();
	}
	
	@Test
	void findAllLocationCode() {
		List<APILocationCode> allLocationCode = APIservice.getAllLocationCode();
		System.out.println(allLocationCode.toString());
		assertThat(allLocationCode).isNotNull();
	}
}
