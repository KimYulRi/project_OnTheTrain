package com.kh.onthetrain.accommodation.service;

import java.util.List;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Review;

public interface AccommodationService {

	Accommodation findProductByNo(int no);

	List<Review> getReviewsByAccommodationNo(int no);

	void writeReview(Review review);

	int insertReview(Review review);

	int deleteReview(int no);

	Review getReviewByNo(int no);

	int updateReview(Review review);
	
}
