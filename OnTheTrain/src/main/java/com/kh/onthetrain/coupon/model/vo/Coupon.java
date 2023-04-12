package com.kh.onthetrain.coupon.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
	
	private int couponId;
	
	private int memberId;
	
	private String couponName;
	
	private Date expDate;
	
	private String status;
	
	private int disRate;
	
	private int disAmount;
	
}
