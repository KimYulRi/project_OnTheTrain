package com.kh.onthetrain.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	/* �뒪耳�以꾨윭 硫붿씤�쑝濡� 蹂대궡�뒗 硫붿냼�뱶 */
	@GetMapping("/main")
	public String toMain() {

		return "scheduler/schedulerMain";
	}

	/* �뒪耳�以꾨윭 �깮�꽦�쑝濡� 蹂대궡�뒗 硫붿냼�뱶 */
	@GetMapping("/create")
	public String toCreate() {

		return "scheduler/schedulerCreate";
	}

}