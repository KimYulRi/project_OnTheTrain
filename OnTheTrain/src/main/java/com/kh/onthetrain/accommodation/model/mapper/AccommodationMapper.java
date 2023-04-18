package com.kh.onthetrain.accommodation.model.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;

public interface AccommodationMapper {

	Accommodation findProductByNo(@Param("no") String no);

}
