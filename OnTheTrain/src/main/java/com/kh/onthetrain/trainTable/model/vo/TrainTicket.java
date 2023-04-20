package com.kh.onthetrain.trainTable.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class TrainTicket {
	
	private int ticketNo;
	
	private int userNo;
	
	private String type;
	
	private Date depDate;
	
	private int depTime;
	
	private int arrTime;
	
	private String departure;
	
	private String arrival;
	
	private int price;
}
