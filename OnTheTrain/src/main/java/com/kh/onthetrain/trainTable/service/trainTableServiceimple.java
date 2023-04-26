package com.kh.onthetrain.trainTable.service;

import org.springframework.stereotype.Service;

import com.kh.onthetrain.trainTable.model.vo.TrainTicket;
import com.kh.onthetrain.trainTable.model.mapper.trainTableMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class trainTableServiceimple implements trainTableService {
	
	private trainTableMapper mapper;
	
	@Override
	public TrainTicket findTrainTableByNo(int ticketNo) {
		log.info("findTrainTableByNo() 메소드 실행");
		return mapper.selectTrainTableByNo(ticketNo);
	}
	

}
