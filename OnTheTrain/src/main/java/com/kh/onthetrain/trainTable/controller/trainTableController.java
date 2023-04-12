package com.kh.onthetrain.trainTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onthetrain.trainTable.service.trainTableService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/trainTable")
public class trainTableController {
	
	@Autowired
	private trainTableService service;
	
	@GetMapping("/main")
	public String main() {
		log.info("main start");
		return "trainTable/trainMain";
	}
}
