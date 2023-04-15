package com.kh.onthetrain.accomodation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accomodation {
	private int no;
	
	private int price;
	
	private String name;
	
	private String status;
	
	private int maxValue;
	
	private String explain ;
	
	private String location;
	
}
