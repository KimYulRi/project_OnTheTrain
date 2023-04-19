package com.kh.onthetrain.accommodation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onthetrain.accommodation.model.mapper.AccommodationMapper;
import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Review;
import com.kh.onthetrain.scheduler.service.SchedulerServiceimpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccommodationServiceImpl implements AccommodationService {
	@Autowired
	private AccommodationMapper mapper;
	
	@Override
	public Accommodation findProductByNo(String no) {
		
		return mapper.findProductByNo(no);
	}

	@Override
	public List<Review> getReviewsByNo(String no) {
		
		
		return mapper.getReviewsByNo(no);
	}

	@Override
	public void writeReview(Review review) {
		
	}

    @Override
    @Transactional
    public int insertReview(Review review) {
    	return mapper.insertReview(review);
    }
	
	
}
