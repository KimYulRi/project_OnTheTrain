package com.kh.onthetrain.accomodation.model.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.accomodation.model.vo.Accomodation;

public interface AccomodationMapper {

	Accomodation findProductByNo(@Param("no") String no);

}
