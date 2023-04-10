package com.kh.onthetrain.scheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.service.SchedulerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	@Autowired
	private SchedulerService service;

	@GetMapping("/main")
	// 스케줄러 메인으로 보내는 메소드
	public String toMain() {
		log.info("toMain() 메소드 실행");
		return "scheduler/schedulerMain";
	}

	@GetMapping("/create")
	// 스케줄러 생성으로 보내는 메소드
	public String toCreate() {
		log.info("toCreate() 메소드 실행");
		return "scheduler/schedulerCreate";
	}

	@GetMapping("/view")
	// 스케줄러 하나를 조회하는 메소드
	public Scheduler schedluerView(@RequestParam int no) {
		log.info("schedluerView() 메소드 실행");
		Scheduler sc = service.findSchedulerByNo(no);
		
		return sc;
	}

}