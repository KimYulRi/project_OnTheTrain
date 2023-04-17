package com.kh.onthetrain.myPage.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class MyPageContoller {
	
	
	@GetMapping("/myPageticket")
	// 마이페이지 티켓(마이페이지 접속시 기본화면)으로 보내는 메소드
	public String toMyTicket() {
		log.info("toMyTicket() 메소드 실행");
		return "myPage/myPageTicket";
	}
	
	@GetMapping("/myPageAccommodation")
	// 마이페이지 결제 완료 숙소 확인 페이지로 보내는 메소드
	public String toMyAccommodation(){
		log.info("toMyAcc 메소드 실행");
		return "myPage/myPageAccommodation";
	}
	
	@GetMapping("/myPageTicketWaiting")
	// 마이페이지 결제 대기 티켓 확인 페이지로 보내는 메소드
	public String toMyTicketWaiting(){
		log.info("toMyTicketWaiting 메소드 실행");
		return "myPage/myPageTicketWaiting";
	}
	
	@GetMapping("myPageAccommodationWaiting")
	// 마이페이지 결제 대기 숙소 확인 페이지로 보내는 메소드
	public String toMyAccommodationWaiting() {
		log.info("toMyAccommodationWaiting 메소드 실행");
		return "myPage/myPageAccommodationWaiting";
	}
	
	@GetMapping("myPageMyScheduler")
	// 마이페이지 나의 스케줄러 페이지로 보내는 메소드
	public String toMyScheduler() {
		log.info("toMyScheduler 메소드 실행");
		return "myPage/myPageMyScheduler";
	}
	
	@GetMapping("myPageCoupon")
	// 마이페이지 쿠폰함으로 보내는 메소드
	public String toMyCoupon() {
		log.info("toMyCoupon 메소드 실행");
		return "myPage/myPageCoupon";
	}
	

	
	@GetMapping("myPageQna")
	// 마이페이지 1:1 문의 내역으로 보내는 메소드
	public String toMyQna() {
		log.info("toMyQna 메소드 실행");
		return"myPage/myPageQna";
	}
	
	@GetMapping("myPageQnaWrite")
	// 1:1 문의 작성 페이지로 보내는 메소드
	public String toMyQnaWrite() {
		log.info("toMyQnaWrite 메소드 실행");
		return "myPage/myPageQnaWrite";
	}
	
	@GetMapping("myPageInfoCheck")
	// 마이페이지 개인정보 페이지 접속전 본인 확인하는 페이지로 보내는 메소드
	public String toMyInfoCheck() {
		log.info("toMyInfoCheck 메소드 실행");
		return "myPage/myPageInfoCheck";
	}
	
	@GetMapping("myPageInfo")
	// 마이페이지 개인정보 페이지 본인확인후 개인정보 페이지로 보내는 메소드
	public String toMyInfo() {
		log.info("toMyInfo 메소드 실행");
		return "myPage/myPageInfo";
	}
	
}
