package com.kh.onthetrain.API.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.onthetrain.API.model.entity.APILocationCode;

@Mapper
public interface SchedulerAPIMapper {

	List<APILocationCode> SelectLocationCodeList();
}
