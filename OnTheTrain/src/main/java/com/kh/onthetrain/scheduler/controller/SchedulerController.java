package com.kh.onthetrain.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	
	@GetMapping("/main")
	// 스케줄러 메인으로 보내는 메소드
	public String toMain() {

		return "scheduler/schedulerMain";
	}

	@GetMapping("/create")
	// 스케줄러 생성으로 보내는 메소드
	public String toCreate() {

		return "scheduler/schedulerCreate";
	}

}