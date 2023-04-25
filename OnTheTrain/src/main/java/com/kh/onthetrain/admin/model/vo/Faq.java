package com.kh.onthetrain.admin.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Faq {
	private int no;
	
	private String type;
	
	private String title;
	
	private String content;
	
}
