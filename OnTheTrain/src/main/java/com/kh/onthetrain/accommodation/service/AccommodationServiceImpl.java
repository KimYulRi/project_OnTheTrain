package com.kh.onthetrain.accommodation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onthetrain.accommodation.model.mapper.AccommodationMapper;
import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Reservation;
import com.kh.onthetrain.accommodation.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccommodationServiceImpl implements AccommodationService {
	@Autowired
	private AccommodationMapper mapper;
	
	@Override
	public Accommodation findProductByNo(int no) {
		
		return mapper.findProductByNo(no);
	}

	@Override
	public List<Review> getReviewsByAccommodationNo(int no) {
		
		
		return mapper.getReviewsByAccommodationNo(no);
	}

	@Override
	public void writeReview(Review review) {
		
	}

    @Override
    @Transactional
    public int insertReview(Review review) {
    	
    	return mapper.insertReview(review);
    }

	@Override
	public int deleteReview(int no) {
		return mapper.deleteReview(no);
	}

	@Override
	public Review getReviewByNo(int no) {
		return mapper.getReviewByNo(no);
	}

	@Override
	public int updateReview(Review review) {
		
		return  mapper.updateReview(review);
	}
	
	@Transactional
	@Override
	public int insertReservation(Reservation reservation) {

		int result = mapper.insertReservation(reservation);
		System.out.println("여기"+reservation);
		if(result > 0){
			return mapper.insertPaymentWaiting(reservation);
		} else {
			return 0;
		}
		
	}

	
	
}
