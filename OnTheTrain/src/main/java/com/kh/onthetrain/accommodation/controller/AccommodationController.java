package com.kh.onthetrain.accommodation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Review;
import com.kh.onthetrain.accommodation.service.AccommodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class AccommodationController {
	
	@Autowired 
	private AccommodationService service;
	
	@GetMapping("/accommodation/list")
	public String list(){
		
		
		return "accommodation/list";
	}
	
	@GetMapping("/accommodation/reservation")
	public ModelAndView reservation(ModelAndView modelAndView, @RequestParam String no){
		
		Accommodation accommodation = service.findProductByNo(no);
		List<Review> reviews = service.getReviewsByNo(no);
		
		System.out.println(accommodation);
		System.out.println(reviews);
		
		modelAndView.addObject("accommodation", accommodation);
		modelAndView.addObject("reviews", reviews);
		modelAndView.setViewName("accommodation/reservation");
		
		return modelAndView;
	}
	
	@GetMapping("/accommodation/review")
	public String review(Model model, @RequestParam String no) {
	    Accommodation accommodation = service.findProductByNo(no);
	    model.addAttribute("accommodation", accommodation);
	    return "accommodation/review";
	}
	
	//리뷰작성 업로드 
	@PostMapping("/accommodation/review")
	public ModelAndView createReview(ModelAndView modelAndView, @Validated Review review, BindingResult bindingResult, Model model) {
		// 검증 오류가 발생한 경우 입력폼으로 돌아
	    
		if (bindingResult.hasErrors()) {
	        model.addAttribute("review", review);
	        modelAndView.addObject("location", "accommodation/review");
	        
	        return modelAndView;
	    }

	    // 리뷰 생성 로직 수행
	    int result = service.insertReview(review);
	    
	    if(result > 0 ) {
	    	modelAndView.addObject("msg", "성공");
	    	modelAndView.addObject("location", "/accommodation/reservation?no=" + review.getAccommodationNo());
	    	
	    } else {
	    	modelAndView.addObject("location", "/accommodation/review");
			modelAndView.addObject("msg", "실패");
		}
	   
	   modelAndView.setViewName("common/msg");
	   
	    return modelAndView;
	}
}
