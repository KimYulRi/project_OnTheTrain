package com.kh.onthetrain.admin.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class TrainTicketReservation {
	
	private int ticketNo;
	
	private int userNo;
	
	private int trainNo;
	
	private String type;
	
	private String departure;
	
	private String arrival;

	private Date depDate;
	
	private String refundStatus;
	
}
