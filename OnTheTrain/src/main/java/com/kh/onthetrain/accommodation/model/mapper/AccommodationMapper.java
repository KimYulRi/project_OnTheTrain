package com.kh.onthetrain.accommodation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Reservation;
import com.kh.onthetrain.accommodation.model.vo.Review;

@Mapper
public interface AccommodationMapper {

	Accommodation findProductByNo(@Param("no") int no);

	List<Review> getReviewsByAccommodationNo(@Param("no") int no);

	int insertReview(Review review);

	int deleteReview(@Param("no") int no);

	Review getReviewByNo(@Param("no") int no);

	int updateReview(Review review);

	int insertReservation(Reservation reservation);

	int insertPaymentWaiting(Reservation reservation);

}
