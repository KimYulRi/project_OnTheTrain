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
	
	private int nickname;
	
	private int trainNo;
	
	private String departure;
	
	private String arrival;

	private Date depDate;
	
	private Date bookDate;
	
	private String paymentStatus;
	
	private String refundStatus;
	
	
	private String type;
	
	private int depTime;
	
	private int arrTime;
	
	private int price;
}
