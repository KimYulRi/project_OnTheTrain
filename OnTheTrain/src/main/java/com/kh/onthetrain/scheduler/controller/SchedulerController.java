package com.kh.onthetrain.scheduler.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.API.model.entity.APILocationCode;
import com.kh.onthetrain.API.service.SchedulerAPIService;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.service.SchedulerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	@Autowired
	private SchedulerService service;

	@Autowired
	private SchedulerAPIService APIservice;

	@GetMapping("/main")
	// 스케줄러 메인으로 보내는 메소드
	public String toMain() {
		log.info("toMain() 메소드 실행");
		return "scheduler/schedulerMain";
	}

	// 스케줄러 생성 메인(일정 생성)으로 보내는 메소드
	@RequestMapping("/create")
	public ModelAndView toCreate(ModelAndView modelAndView) {
		log.info("toCreate/CreatEvent() 메소드 실행");

		// 일정 조회에 필요한 지역코드를 담아 설정
		List<APILocationCode> allLocationCode = APIservice.getAllLocationCode();
		modelAndView.addObject("locationCodeList", allLocationCode);

		// 기본으로 출력되는 스케줄러 요소는 '일정'
		modelAndView.addObject("basicComponent", "일정");
	    modelAndView.addObject("currentComponent", "event");
		modelAndView.setViewName("scheduler/schedulerCreate");

		return modelAndView;
	}

	@GetMapping("/component")
	@ResponseBody
	public Map<String, String> getComponentInfo(@RequestParam String component) {
	    log.info("getComponentInfo() 메소드 실행");

	    Map<String, String> componentInfo = new HashMap<>();
	    if (component.equals("event")) {
	        componentInfo.put("component", "event");
	        componentInfo.put("name", "일정");
	    } else if (component.equals("accommodation")) {
	        componentInfo.put("component", "accommodation");
	        componentInfo.put("name", "숙소");
	    } else if (component.equals("ticket")) {
	        componentInfo.put("component", "ticket");
	        componentInfo.put("name", "승차권");
	    }
	    return componentInfo;
	}

	@GetMapping("/view")
	// 스케줄러 하나를 조회하는 메소드
	public Scheduler schedluerView(@RequestParam int no) {
		log.info("schedluerView() 메소드 실행");
		Scheduler sc = service.findSchedulerByNo(no);

		return sc;
	}

}