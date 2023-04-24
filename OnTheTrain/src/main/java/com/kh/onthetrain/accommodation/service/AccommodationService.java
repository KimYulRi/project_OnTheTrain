package com.kh.onthetrain.accommodation.service;

import java.util.List;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Review;

public interface AccommodationService {

	Accommodation findProductByNo(String no);

	List<Review> getReviewsByNo(String no);

	void writeReview(Review review);

	int insertReview(Review review);

	int deleteReview(Review review);
	
}
