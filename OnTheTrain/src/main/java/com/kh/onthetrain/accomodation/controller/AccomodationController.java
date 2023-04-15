package com.kh.onthetrain.accomodation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onthetrain.accomodation.model.vo.Accomodation;
import com.kh.onthetrain.accomodation.service.AccomodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class AccomodationController {
	
	@Autowired 
	private AccomodationService service;
	
	@GetMapping("/accomodation/list")
	public String list(){
		
		
		return "accomodation/list";
	}
	
	@GetMapping("/accomodation/reservation")
	public String reservation(
			@RequestParam String no){
		
		Accomodation accomodation = service.findProductByNo(no);
		
		System.out.println(accomodation);
		
		return "accomodation/reservation";
	}
	
}
