package com.kh.onthetrain.API.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.onthetrain.API.model.vo.TouristAttraction;
import com.kh.onthetrain.API.model.vo.TouristAttraction2;
import com.kh.onthetrain.API.service.SchedulerAPIService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/api")
public class SchedulerAPIController {

	@Autowired
	private SchedulerAPIService service;

	/* 지역기반 관광정보 조회 */
	@ResponseBody
	@GetMapping(value = "/scheduler/events", produces = "application/json; charset=utf-8")
	public String getSchedulerAPIEvents(@RequestParam(name = "locationCode", required = false) String locationcode,
			HttpServletResponse response) {
		log.info("getSchedulerEvents 메소드 실행");
		String json = "";
		List<TouristAttraction> talist = new ArrayList<>();
		talist = service.getSchedulerAPIEvents(locationcode);

		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(talist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		log.info(json);
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		return json;
	}

	/* 행사정보조회 */
	@ResponseBody
	@GetMapping(value = "/scheduler/events/2", produces = "application/json; charset=utf-8")
	public String getSchedulerAPIEvents2(@RequestParam(name = "locationCode", required = false) String locationcode,
			@RequestParam(name = "startDate", required = true) String startDate,
			HttpServletResponse response) {
		log.info("getSchedulerEvents2 메소드 실행");
		String json = "";
		List<TouristAttraction2> talist = new ArrayList<>();
		talist = service.getSchedulerAPIEvents2(locationcode, startDate);

		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(talist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		log.info(json);
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		return json;
	};

}
