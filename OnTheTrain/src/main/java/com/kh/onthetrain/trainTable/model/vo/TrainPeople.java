package com.kh.onthetrain.trainTable.model.vo;


import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class TrainPeople {
	
	private int peopleNo;
	
	private int ticketNo;
	
	private String type;
	
	private int peopleNum;
}
