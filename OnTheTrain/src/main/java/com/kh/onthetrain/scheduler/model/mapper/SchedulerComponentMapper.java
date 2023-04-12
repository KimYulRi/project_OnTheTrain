package com.kh.onthetrain.scheduler.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.scheduler.model.entity.SchedulerAccommodation;
import com.kh.onthetrain.scheduler.model.entity.SchedulerEvent;
import com.kh.onthetrain.scheduler.model.entity.SchedulerImage;
import com.kh.onthetrain.scheduler.model.entity.SchedulerTicket;

@Mapper
public interface SchedulerComponentMapper {

	SchedulerAccommodation selectSchedulerAccommodationByNo(@Param("no") int no);

	SchedulerEvent selectSchedulerEventByNo(@Param("no") int no);

	SchedulerTicket selectSchedulerTicketByNo(@Param("no") int no);

	SchedulerImage selectImageByNo(@Param("no") int no);

}
