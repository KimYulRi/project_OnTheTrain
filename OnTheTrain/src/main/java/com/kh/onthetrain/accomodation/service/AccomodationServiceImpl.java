package com.kh.onthetrain.accomodation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.accomodation.model.mapper.AccomodationMapper;
import com.kh.onthetrain.accomodation.model.vo.Accomodation;
import com.kh.onthetrain.scheduler.service.SchedulerServiceimpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccomodationServiceImpl implements AccomodationService {
	@Autowired
	private AccomodationMapper mapper;
	
	@Override
	public Accomodation findProductByNo(String no) {
		
		return mapper.findProductByNo(no);
	}


	
}
