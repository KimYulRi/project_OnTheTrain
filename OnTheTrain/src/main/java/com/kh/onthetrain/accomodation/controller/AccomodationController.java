package com.kh.onthetrain.accomodation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller 
public class AccomodationController {
	@GetMapping("/accomodation/list")
	public String list(){
		
		
		return "accomodation/list";
	}
	
	@GetMapping("/accomodation/reservation")
	public String reservation(){
		
		
		return "accomodation/reservation";
	}
}
