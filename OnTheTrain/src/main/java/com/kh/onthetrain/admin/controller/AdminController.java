package com.kh.onthetrain.admin.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.admin.Service.AdminService;
import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// admin dashboard 페이지(Main)
	@GetMapping(value = "/admin/dashboard")
	public String dashboard(Locale locale, Model model) {
		
		// 현재 날짜 출력
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/adminDashboard";
		
	}
	
	// admin memberList 페이지
	@GetMapping(value = "/admin/member")
	public ModelAndView memberList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
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
	@PostMapping(value = "/admin/member/findMemberInfo")
	public Member findMemberInfo(@RequestParam int no) {
		log.info("findMemberInfo() = 호출");
		
	    return service.findMemberByNo(no);
	}
	
	// 회원정보수정
	@ResponseBody
	@PostMapping(value = "/admin/member/updateMemberInfo")
	public Boolean updateMember(@RequestParam Member member) {
		log.info("findMemberInfo() = 호출");
		
		System.out.println(member);
		
	    return true;
	}
	


	// admin trainticketList 페이지
	@GetMapping(value = "/admin/ticket")
	public ModelAndView ticketList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
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
	@GetMapping(value = "/admin/accommodation")
	public ModelAndView accommodationList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
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
	@GetMapping(value = "/admin/cupon")
	public ModelAndView cuponList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 총 쿠폰개수
		int totalCupon = 1;
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalCupon, 10);
		
		
		
		
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalCupon",totalCupon);
		modelAndView.setViewName("admin/adminCuponList");
		
		return modelAndView;
		
	}
	
	// admin qna List 페이지
	@GetMapping(value = "/admin/qna")
	public ModelAndView qnaList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 총 쿠폰개수
		int totalQna = 1;
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalQna, 10);
		
		
		
		
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalQna",totalQna);
		modelAndView.setViewName("admin/adminQnaList");
		
		return modelAndView;
		
	}
		
		
	// 공지사항 페이지
	@GetMapping(value = "/cs/notice")
	public ModelAndView noticeList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 게시글 개수
		int totalNotice = 1;
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalNotice, 10);
		
		
		
		
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalNotice",totalNotice);
		modelAndView.setViewName("admin/csNoticeList");
		
		return modelAndView;
		
	}

	// 공지사항 상세 페이지
	@GetMapping(value = "/cs/notice/view")
	public ModelAndView noticeView(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		
		
		
		modelAndView.setViewName("admin/csNoticeView");
		
		return modelAndView;
		
	}
	
	
	// 자주묻는질문 페이지
	@GetMapping(value = "/cs/faq")
	public ModelAndView faqList(ModelAndView modelAndView) {
		
		List<Faq> list = service.getFaqList();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("admin/csFaqList");
		
		return modelAndView;
		
	}
	
	// 1:1문의 페이지
	@GetMapping(value = "/cs/qna")
	public String qnaList(Model model) {
		
		return "admin/csQna";
	}
	

	// 공지사항 글쓰기 페이지
	@GetMapping(value = "/cs/notice/write")
	public ModelAndView noticeWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/csNoticeWrite");
		
		return modelAndView;
	}
	
	// 공지사항 글쓰기 삽입
	@PostMapping(value = "/cs/notice/write")
	public ModelAndView noticeInsert(ModelAndView modelAndView, @ModelAttribute Notice notice, @RequestParam("file") MultipartFile upfile) {
		
		int result = 0;
		/*
		 * if(upfile != null && !upfile.isEmpty()) { String location = null; String
		 * renamedFileName = null;
		 * 
		 * try { location =
		 * resourceLoader.getResource("resources/upload/file").getFile().getPath();
		 * 
		 * renamedFileName = MultipartFileUtil.save(upfile, location);
		 * 
		 * } catch (IOException e) { e.printStackTrace(); }
		 * 
		 * if(renamedFileName != null) {
		 * notice.setOriginalFileName(upfile.getOriginalFilename());
		 * notice.setRenamedFileName(renamedFileName); } }
		 * 
		 * result = service.save(notice);
		 */
		
		if(result > 0) {
			modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			modelAndView.addObject("location", "admin/csNoticeList" + notice.getNo());
		} else {
			modelAndView.addObject("msg", "게시글 등록을 실패하였습니다.");
			modelAndView.addObject("location", "/admin/csNoticeList");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
		
	}
}
