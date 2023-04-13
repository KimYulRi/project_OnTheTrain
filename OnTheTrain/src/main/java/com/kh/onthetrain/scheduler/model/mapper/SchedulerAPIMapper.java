package com.kh.onthetrain.scheduler.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.onthetrain.scheduler.model.entity.APILocationCode;

@Mapper
public interface SchedulerAPIMapper {

	List<APILocationCode> SelectLocationCodeList();
}
