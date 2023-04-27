package com.kh.onthetrain.scheduler.service;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.scheduler.model.entity.SchedulerAccommodation;
import com.kh.onthetrain.scheduler.model.entity.SchedulerEvent;
import com.kh.onthetrain.scheduler.model.entity.SchedulerImage;
import com.kh.onthetrain.scheduler.model.entity.SchedulerTicket;
import com.kh.onthetrain.scheduler.model.vo.SchedulerInfo;

public interface SchedulerService {

	Scheduler findSchedulerByNo(int no);

	SchedulerAccommodation findSchedulerAccommodationByNo(int no);

	SchedulerEvent findSchedulerEventByNo(int no);

	SchedulerTicket findSchedulerTicketByNo(int no);

	SchedulerImage findSchedulerImageByNo(int no);

	String getSchedulerStartDate();

	int saveScheduler(SchedulerInfo schedulerInfo);

}
