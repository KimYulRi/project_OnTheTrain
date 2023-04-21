package com.kh.onthetrain.API.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatException;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.onthetrain.API.model.vo.TouristAttraction;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class APIControllerTest {

	@Autowired
	SchedulerAPIController controller;

	@Test
	@Disabled
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void APICreateTest() {
		assertThat(controller).isNotNull();
	}
	
	

}
