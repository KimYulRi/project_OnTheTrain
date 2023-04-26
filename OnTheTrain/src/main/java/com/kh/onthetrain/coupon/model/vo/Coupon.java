package com.kh.onthetrain.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
	
	private int couponNo;
	
	private String couponName;
	
	private int disRate;
	
	private int disAmount;
	
}
