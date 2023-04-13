package com.kh.onthetrain.scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.scheduler.model.entity.APILocationCode;
import com.kh.onthetrain.scheduler.model.mapper.SchedulerAPIMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerAPIServiceimpl implements SchedulerAPIService {
	
	@Autowired
	private SchedulerAPIMapper mapper;
	
	/* 일정조회 시 사용할 지역코드를 불러오는 메소드 */
	@Override
	public List<APILocationCode> getAllLocationCode() {
		return mapper.SelectLocationCodeList();
	}

}
