package com.kh.onthetrain.scheduler.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.scheduler.model.entity.Scheduler;

@Mapper
public interface SchedulerMapper {

	Scheduler selectScheduleByNo(@Param("no") int no);
}
