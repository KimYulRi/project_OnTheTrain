package com.kh.onthetrain.trainTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onthetrain.trainTable.model.vo.TrainBook;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;
import com.kh.onthetrain.trainTable.service.TrainTableService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/trainTable")
public class trainTableController {

	@Autowired
	private TrainTableService trainTableservice;

	@GetMapping("/main")
	public String main() {
		log.info("main start");
		return "trainTable/trainMain";
	}

	@GetMapping("/station")
	public String station() {
		log.info("팝업창");
		return "trainTable/station";
	}

	@GetMapping("/seatModal")
	public String seat() {
		log.info("모달");
		return "trainTable/seatModal";
	}

	@GetMapping("/chargeModal")
	public String charge() {
		log.info("모달");
		return "trainTable/chargeModal";
	}

//	@PostMapping("/saveData")
//	@ResponseBody
//	public ResponseEntity<?> saveData(@RequestBody TrainTicket trainTicket) {
//		trainTableservice.save(trainTicket);
//		log.info("api : {}", trainTicket);
//		return ResponseEntity.ok().build();
//	}
//	
//	@PostMapping("/reservation")
//	@ResponseBody
//	public ResponseEntity<?> createReservation(@RequestBody TrainBook trainBook) {
//		trainTableservice.createReservation(trainBook);
//		log.info("trainBook : {}", trainBook);
//		return ResponseEntity.ok().build();
//	}

}
