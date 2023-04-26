package com.kh.onthetrain.accommodation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accommodation {
	private int no;
	
	private int price;
	
	private String name;
	
	private String status;
	
	private int maxValue;
	
	private String explain;
	
	private String location;
	
	private String  lot;
	
	private String  lat;
	
	private String renamedFilename;
}
