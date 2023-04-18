package com.kh.onthetrain.accommodation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.service.AccommodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class AccommodationController {
	
	@Autowired 
	private AccommodationService service;
	
	@GetMapping("/accommodation/list")
	public String list(){
		
		
		return "accommodation/list";
	}
	
	@GetMapping("/accommodation/reservation")
	public String reservation(
			@RequestParam String no){
		
		Accommodation accommodation = service.findProductByNo(no);
		
		System.out.println(accommodation);
		
		return "accommodation/reservation";
	}
}
