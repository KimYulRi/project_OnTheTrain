package com.kh.onthetrain.payment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private int paymentNo;
	
	private int memberNo;
	
	private int couponNo;
	
	private int finalPayment;
	
	private Date paymentDate;
}
