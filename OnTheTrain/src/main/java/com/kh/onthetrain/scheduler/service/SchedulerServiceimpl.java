package com.kh.onthetrain.scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.model.mapper.SchedulerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerServiceimpl implements SchedulerService {

	@Autowired
	private SchedulerMapper mapper;

	@Override
	public Scheduler findSchedulerByNo(int no) {
		log.info("findSchedulerByNo() 메소드 실행");
		return mapper.selectScheduleByNo(no);
	}

}
