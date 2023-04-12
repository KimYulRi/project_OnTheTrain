package com.kh.onthetrain.scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.model.entity.SchedulerAccommodation;
import com.kh.onthetrain.scheduler.model.entity.SchedulerEvent;
import com.kh.onthetrain.scheduler.model.entity.SchedulerImage;
import com.kh.onthetrain.scheduler.model.entity.SchedulerTicket;
import com.kh.onthetrain.scheduler.model.mapper.SchedulerComponentMapper;
import com.kh.onthetrain.scheduler.model.mapper.SchedulerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerServiceimpl implements SchedulerService {

	@Autowired
	private SchedulerMapper schedulerMapper;
	
	@Autowired
	private SchedulerComponentMapper schedulerComponentMapper;

	/* no값으로 스케줄러를 찾아오는 메소드 */
	@Override
	public Scheduler findSchedulerByNo(int no) {
		log.info("findSchedulerByNo() 메소드 실행");
		return schedulerMapper.selectScheduleByNo(no);
	}
	
	/* no값으로 스케줄러 숙박 요소를 찾아오는 메소드 */
	@Override
	public SchedulerAccommodation findSchedulerAccommodationByNo(int no) {
		log.info("findSchedulerAccommodationByNo() 메소드 실행" );
		return schedulerComponentMapper.selectSchedulerAccommodationByNo(no);
	}

	/* no값으로 스케줄러 일정 요소를 찾아오는 메소드 */
	@Override
	public SchedulerEvent findSchedulerEventByNo(int no) {
		log.info("findSchedulerEventByNo() 메소드 실행" );
		return schedulerComponentMapper.selectSchedulerEventByNo(no);
	}

	/* no값으로 스케줄러 승차권 요소를 찾아오는 메소드 */
	@Override
	public SchedulerTicket findSchedulerTicketByNo(int no) {
		log.info("findSchedulerTicketByNo() 메소드 실행" );
		return schedulerComponentMapper.selectSchedulerTicketByNo(no);
	}

	/* no값으로 스케줄러 이미지를 찾아오는 메소드 */
	@Override
	public SchedulerImage findSchedulerImageByNo(int no) {
		log.info("findSchedulerImageByNo() 메소드 실행");
		return schedulerComponentMapper.selectImageByNo(no);
	}

}
