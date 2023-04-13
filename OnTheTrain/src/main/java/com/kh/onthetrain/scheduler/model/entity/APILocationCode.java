package com.kh.onthetrain.scheduler.model.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class APILocationCode {

	private String code;

	private String name;

}
