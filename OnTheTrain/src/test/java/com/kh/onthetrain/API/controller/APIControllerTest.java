package com.kh.onthetrain.API.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.onthetrain.API.model.vo.TouristAttraction;
import com.kh.onthetrain.API.model.vo.TouristAttraction2;
import com.kh.onthetrain.API.service.SchedulerAPIService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class APIControllerTest {

	@Autowired
	SchedulerAPIController controller;

	@Autowired
	SchedulerAPIService service;

	@Test
	@Disabled
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void APICreateTest() {
		assertThat(controller).isNotNull();
	}

	@Test
	void APITest1() {
		String locationCode = "1";


		List<TouristAttraction> schedulerAPIEvents = service.getSchedulerAPIEvents(locationCode);

		assertThat(schedulerAPIEvents).isNotNull();
		System.out.println(schedulerAPIEvents);

	}
	
	
	@Test
	void APITest2() {
		String locationCode = "1";
		String startDate = "20230421";

		List<TouristAttraction2> schedulerAPIEvents2 = service.getSchedulerAPIEvents2(locationCode, startDate);

		assertThat(schedulerAPIEvents2).isNotNull();
		System.out.println(schedulerAPIEvents2);

	}

}
