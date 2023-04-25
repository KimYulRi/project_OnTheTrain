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
public class Notice {

	private int no;
	
	private String type;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private Date createDate;

	private Date modifyDate;
	
	private String visiable;
	
	private int top;
	
}
