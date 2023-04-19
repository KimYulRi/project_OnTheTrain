package com.kh.onthetrain.accommodation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Review;

@Mapper
public interface AccommodationMapper {

	Accommodation findProductByNo(@Param("no") String no);

	List<Review> getReviewsByNo(@Param("no") String no);

}
