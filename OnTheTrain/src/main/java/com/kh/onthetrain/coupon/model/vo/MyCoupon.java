package com.kh.onthetrain.coupon.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCoupon extends Coupon{
	
	private int memberNo;
	
	private String status;
	
	private Date expDate;
	
}
