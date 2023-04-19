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
		
		modelAndView.addObject("accommodation", accommodation);
		modelAndView.setViewName("accommodation/reservation");
		
		return modelAndView;
	}
	
	@GetMapping("/accommodation/review")
	public String review(Model model, @RequestParam String no) {
		System.out.println("여기로?");
	    Accommodation accommodation = service.findProductByNo(no);
	    model.addAttribute("accommodation", accommodation);
	    return "accommodation/review";
	}
	
	@PostMapping("/accommodation/review")
	public String createReview(@Validated Review review, BindingResult bindingResult, Model model) {
	    if (bindingResult.hasErrors()) {
	        // 검증 오류가 발생한 경우
	        model.addAttribute("review", review);
	        return "accommodation/reviewForm";
	    }
	    
	    // 검증 오류가 발생하지 않은 경우
	    // 리뷰 생성 로직 수행
	    
	    return "redirect:/accommodation/list";
	}

}
