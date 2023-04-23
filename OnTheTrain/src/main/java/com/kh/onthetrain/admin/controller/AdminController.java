package com.kh.onthetrain.admin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.admin.Service.AdminService;
import com.kh.onthetrain.admin.model.vo.TrainTicketReservation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
@SessionAttributes("loginMember")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// admin dashboard 페이지(Main)
	@GetMapping(value = "/dashboard")
	public String dashboard(Locale locale, Model model, HttpSession session) {
		
		// 현재 날짜 출력
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/adminDashboard";
		
	}
	
	// admin memberList 페이지
	@GetMapping(value = "/member")
	public ModelAndView memberList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
		
		// 총 회원수
		int totalMember = service.getCountMember();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalMember, 10);
		// 리스트 담기
		List<Member> list = service.getMemberList(pageInfo);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalMember",totalMember);
		modelAndView.setViewName("admin/adminMemberList");
		
		return modelAndView;
		
	}
	
	// no로 특정 회원정보 가져오기
	@ResponseBody
	@PostMapping(value = "/member/findMemberInfo")
	public Member findMemberInfo(@RequestParam int no) {
		log.info("findMemberInfo() = 호출");
		
	    return service.findMemberByNo(no);
	}
	
	// 회원정보수정
	@ResponseBody
	@PostMapping(value = "/member/updateMemberInfo")
	public Boolean updateMember(@RequestParam Member member) {
		log.info("findMemberInfo() = 호출");
		
		System.out.println(member);
		
	    return true;
	}
	


	// admin trainticketList 페이지
	@GetMapping(value = "/ticket")
	public ModelAndView ticketList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
		
		// 총 승차권수
		int totalTicket = service.getCountTicket();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalTicket, 10);
		// 리스트 담기
		/*
		 * List<TrainTicketReservation> list = service.getMemberList(pageInfo);
		 */
		/* modelAndView.addObject("list", list); */
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalTicket",totalTicket);
		modelAndView.setViewName("admin/adminTrainTicketList");
		
		return modelAndView;
		
	}

	// admin accommodation 페이지
	@GetMapping(value = "/accommodation")
	public ModelAndView accommodationList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
		
		// 총 승차권수
		/* int totalAccommodation = service.getCountTicket(); */
		int totalAccommodation = 1;
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalAccommodation, 10);
		// 리스트 담기
		/*
		 * List<TrainTicketReservation> list = service.getMemberList(pageInfo);
		 */
		/* modelAndView.addObject("list", list); */
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalAccommodation",totalAccommodation);
		modelAndView.setViewName("admin/adminAccommodationList");
		
		return modelAndView;
		
	}
	
	// admin cupon 페이지
		@GetMapping(value = "/cupon")
		public ModelAndView cuponList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
			
			// 총 쿠폰개수
			int totalCupon = 1;
			// 페이징
			PageInfo pageInfo = new PageInfo(page, 10, totalCupon, 10);
			
			
			
			
			modelAndView.addObject("pageInfo",pageInfo);
			modelAndView.addObject("totalCupon",totalCupon);
			modelAndView.setViewName("admin/adminCuponList");
			
			return modelAndView;
			
		}
}
