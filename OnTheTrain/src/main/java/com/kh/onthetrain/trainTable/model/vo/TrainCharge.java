package com.kh.onthetrain.trainTable.model.vo;


import org.springframework.stereotype.Component;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class TrainCharge {
	
	private int chargeNo;
	
	private int ticketNo;
	
	private int peopleNo;
	
	private String chargeType;
	
	private int charge;
}
