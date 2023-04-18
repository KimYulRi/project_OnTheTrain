package com.kh.onthetrain.accommodation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.accommodation.model.mapper.AccommodationMapper;
import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.scheduler.service.SchedulerServiceimpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccommodationServiceImpl implements AccommodationService {
	@Autowired
	private AccommodationMapper mapper;
	
	@Override
	public Accommodation findProductByNo(String no) {
		
		return mapper.findProductByNo(no);
	}

	
}
