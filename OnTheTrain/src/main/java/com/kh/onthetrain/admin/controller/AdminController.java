package com.kh.onthetrain.admin.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
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
import com.kh.onthetrain.admin.model.vo.AccommodationReservation;
import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.admin.model.vo.TrainTicketReservation;
import com.kh.onthetrain.common.util.MultipartFileUtil;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private ResourceLoader resourceLoader;

	/* 관리자페이지 */
	
	// (admin dashboard) 페이지(Main) 이동
	@GetMapping(value = "/admin/dashboard")
	public String dashboard(Locale locale, Model model) {
		
		// 현재 날짜 출력
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		// 오늘의 가입자수
		int enrollCount = service.todayEnrollCount();
		
		// 미답변 문의수
		int unansweredCount = service.unansweredCount();
		
		// 오늘의 승차권예약수
		int ticketCount = service.todayTicketCount();

		// 오늘의 숙소예약수
		int accCount = service.todayAccCount();
		
		// 총 가입자수
		int totalMember = service.getCountMember();
		
		// 총 예약건수
		int totalReservation = service.getCountReservation();
		
		// 월별 가입자수 얻어오기
//		List<Map<String, Object>> chart = service.getMonthEnroll();
//		
//        model.addAttribute("chart", chart);
        model.addAttribute("accCount", accCount);
        model.addAttribute("ticketCount", ticketCount);
        model.addAttribute("totalReservation", totalReservation);
		model.addAttribute("unansweredCount", unansweredCount );
		model.addAttribute("enrollCount", enrollCount );
		model.addAttribute("totalMember", totalMember );
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/adminDashboard";
		
	}
	
	// (admin memberList) 페이지 이동, 리스트 출력
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
	
	// (admin memberList) no로 특정 회원정보 가져오기
	@ResponseBody
	@PostMapping(value = "/admin/member/findMemberInfo")
	public Member findMemberInfo(@RequestParam int no) {
		log.info("findMemberInfo() = 호출");
		
	    return service.findMemberByNo(no);
	}
	
	// (admin memberList) 회원정보수정
	@ResponseBody
	@PostMapping(value = "/admin/member/updateMemberInfo")
	public Boolean updateMember(@RequestParam Member member) {
		log.info("findMemberInfo() = 호출");
		
		System.out.println(member);
		
	    return true;
	}
	

	// (admin trainticketList) 페이지 이동, 리스트 출력
	@GetMapping(value = "/admin/ticket")
	public ModelAndView ticketList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 총 승차권수(취소포함)
		int totalTicket = service.getCountTicket();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalTicket, 10);
		// 리스트 담기
		 List<TrainTicketReservation> list = service.getTicketReservation(pageInfo);
		 
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalTicket",totalTicket);
		modelAndView.setViewName("admin/adminTrainTicketList");
		
		return modelAndView;
		
	}

	// (admin accommodation) 페이지이동, 리스트 출력
	@GetMapping(value = "/admin/accommodation")
	public ModelAndView accommodationList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 총 숙박예약수(취소포함)
		int totalAccommodation = service.getCountAccommodation();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalAccommodation, 10);
		// 리스트 담기
		
		List<AccommodationReservation> list = service.getAccommodationList(pageInfo);
		
		modelAndView.addObject("list", list); 
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalAccommodation",totalAccommodation);
		modelAndView.setViewName("admin/adminAccommodationList");
		
		return modelAndView;
		
	}
	
	// (admin cupon) 페이지 이동, 리스트 출력
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
	
	// (admin qnaList) 페이지 이동, 리스트 출력
	@GetMapping(value = "/admin/qna")
	public ModelAndView qnaList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 총 쿠폰개수
		int totalQna= service.getCountQna();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalQna, 10);
		
		List<Qna> list = service.getQnaList(pageInfo);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalQna",totalQna);
		modelAndView.setViewName("admin/adminQnaList");
		
		return modelAndView;
		
	}
	
	// 1:1 문의 상세보기 페이지로 넘겨주는 메소드
	@GetMapping("/admin/qna/view")
	public ModelAndView QnaView(ModelAndView model,  @RequestParam int no) {
		Qna qna = null;
		QnaReply qnaReply = null;
		Member member = null;
		
		// 게시글 no 를 가지고 문의 게시판 상세보기를 가져오는 메소드
		qna = mypageService.findQnaByNo(no);
		// 게시글 no를 가지고 문의 게시판 작성자를 가져오는 메소드
		member = mypageService.findMemberByNo(no);
		// 게시글 no를 가지고 해당 번호를 가진 문의 게시글에 달린 답변을 가져오는 메소드
		qnaReply = mypageService.findReplyByNo(no);
		
		
		model.addObject("member", member);
		model.addObject("qna",qna);
		model.addObject("qnaReply",qnaReply);
		model.setViewName("/admin/adminQnaView");
		
		
		return model;
		}
	
	// 문의 답글 수정
	@PostMapping("/admin/qna/reply")
	public ModelAndView QnaUpdateReply(ModelAndView modelAndView,  @ModelAttribute QnaReply reply) {
		
		int result = 0;
		System.out.println("업데이트 확인" + reply);
		result = service.updateQnaReply(reply);
		
		if(result > 0) {
			modelAndView.addObject("msg", "답글이 정상적으로 수정되었습니다.");
		} else {
			modelAndView.addObject("msg", "답글 수정을 실패하였습니다.");
		}
		
		modelAndView.addObject("location", "/admin/qna/view?no=" + reply.getQnaNo());								
		modelAndView.setViewName("common/msg");
		
	
		return modelAndView;
		}
	

	// 문의 답변 삭제
	@GetMapping(value = "/admin/qna/delete")
	public ModelAndView qnaReplyDelete(ModelAndView modelAndView, @RequestParam int no, @RequestParam int replyno) {
		
		int result = service.replyDelete(no, replyno);
		
		if(result > 0) {
				modelAndView.addObject("msg", "답변이 삭제 되었습니다.");
		} else {
				modelAndView.addObject("msg", "다시 삭제해주세요.");
		}
		
		modelAndView.addObject("location", "/admin/qna/view?no=" + no);
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	
	/* 고객센터 */
	
	// (자주묻는질문) 페이지 이동, 리스트 출력
	@GetMapping(value = "/cs/faq")
	public ModelAndView faqList(ModelAndView modelAndView) {
		
		List<Faq> list = service.getFaqList();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("admin/csFaqList");
		
		return modelAndView;
		
	}
	
	// (1:1문의) 페이지 이동
	@GetMapping(value = "/cs/qna")
	public String qnaList(Model model) {
		
		return "admin/csQna";
	}
	
		
		
	// (공지사항) 리스트 페이지 이동, 목록출력
	@GetMapping(value = "/cs/notice")
	public ModelAndView noticeList(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		
		// 게시글 개수
		int totalNotice = service.getCountNotice();
		// 페이징
		PageInfo pageInfo = new PageInfo(page, 10, totalNotice, 10);
		// 리스트 담기
		
		List<Notice> fixList=service.getFixList();
		List<Notice> list = service.getNoticeList(pageInfo);
		
		modelAndView.addObject("fixList", fixList);
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.addObject("totalNotice",totalNotice);
		modelAndView.setViewName("admin/csNoticeList");
		
		return modelAndView;
		
	}

	// (공지사항) 상세 페이지 이동
	@GetMapping(value = "/cs/notice/view")
	public ModelAndView noticeView(ModelAndView modelAndView, @RequestParam int no) {
		
		Notice notice = service.findNotice(no);
		
		modelAndView.addObject("notice", notice);
		modelAndView.setViewName("admin/csNoticeView");
		
		return modelAndView;
		
	}
	

	// (공지사항) 글쓰기 페이지 이동,
	@GetMapping(value = "/cs/notice/write")
	public ModelAndView noticeWrite(ModelAndView modelAndView) {
		
		modelAndView.setViewName("admin/csNoticeWrite");
		
		return modelAndView;
	}
	
	// (공지사항) 글쓰기 삽입
	@PostMapping(value = "/cs/notice/write")
	public ModelAndView noticeInsert(ModelAndView modelAndView, @ModelAttribute("notice")Notice notice, @RequestParam("file") MultipartFile upfile) {
		
		int result = 0;
		
		// 첨부파일
		if(upfile != null && !upfile.isEmpty()) { 
			String location = null;
			String renamedFileName = null;
			
			try { 
				 location = resourceLoader.getResource("resources/upload/notice").getFile().getPath();
				 renamedFileName = MultipartFileUtil.save(upfile, location);
		 
			} catch (IOException e) { 
				e.printStackTrace(); 
			}
			
			if(renamedFileName != null) {
				 notice.setOriginalFileName(upfile.getOriginalFilename());
				 notice.setRenamedFileName(renamedFileName);
				 } 
		 }
		
		// 게시글 등록
		if(notice.getFix()==0){
			result = service.save(notice);
			
		}else {
			if(service.fixCheck()) {
			// 상단고정 2개이하 insert
				result = service.save(notice);
			}else {
				// 상단고정 3이상 insert
				result = service.updateSave(notice);
			}
		}
		if(result > 0) {
			modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			modelAndView.addObject("location", "/cs/notice/view?no=" + notice.getNo());
		} else {
			modelAndView.addObject("msg", "게시글 등록을 실패하였습니다.");
			modelAndView.addObject("location", "/cs/notice/write");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
		
	}
	
	// 상단고정 개수 확인
 	@ResponseBody
	@PostMapping("/notice/fixCheck")
	public boolean fixCheck() {
		
 		//개수가 1~2개이면 true, 3개이상이면 false
		return service.fixCheck();
	}
	
	
	
	// (공지사항) 글수정 페이지 이동
	@GetMapping(value = "/cs/notice/update")
	public ModelAndView noticeUpdatePage(ModelAndView modelAndView, @RequestParam int no) {
		
		
		Notice notice = service.findNotice(no);
		
		if(notice != null) {
			modelAndView.addObject("notice", notice);
			modelAndView.setViewName("admin/csNoticeUpdate");
		} else {
			modelAndView.addObject("msg", "다시 시도해 주세요");
			modelAndView.addObject("location", "/cs/notice/view?no=" + no );
			modelAndView.setViewName("common/msg");
		}
		return modelAndView;
	}
	
	// (공지사항) 글 수정
	@PostMapping(value = "/cs/notice/update")
	public ModelAndView noticeUpdate(ModelAndView modelAndView, @ModelAttribute("notice")Notice updateNotice, @RequestParam("file") MultipartFile upfile) {
		
		int result = 0;
		
		Notice notice = service.findNotice(updateNotice.getNo());
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/notice").getFile().getPath();
				
				if(notice.getRenamedFileName() != null) {
					MultipartFileUtil.delete(location + "/" + notice.getRenamedFileName());
				}
				renamedFileName = MultipartFileUtil.save(upfile, location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				updateNotice.setOriginalFileName(upfile.getOriginalFilename());
				updateNotice.setRenamedFileName(renamedFileName);
			}
			
		}
			
		if(updateNotice.getFix()==0){
			result = service.save(updateNotice);
			
		}else {
			if(service.fixCheck()) {
			// 상단고정 2개이하 insert
				result = service.save(updateNotice);
			}else {
				// 상단고정 3이상 insert
				result = service.updateSave(updateNotice);
			}
		}
		
		
		if(result > 0) {
			modelAndView.addObject("msg", "공지사항이 정상적으로 수정되었습니다.");
			modelAndView.addObject("location", "/cs/notice/view?no=" + updateNotice.getNo());				
		} else {
			modelAndView.addObject("msg", "공지사항 수정을 실패하였습니다.");
			modelAndView.addObject("location", "/cs/notice/update?no=" + updateNotice.getNo());								
		}
	
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
		
	}
	
	

	// (공지사항) 공지사항 삭제
	@GetMapping(value = "/cs/notice/delete")
	public ModelAndView noticeDelete(ModelAndView modelAndView, @RequestParam int no) {
		
		int result = service.noticeDelete(no);
		
		if(result > 0) {
				modelAndView.addObject("msg", "공지사항이 삭제 되었습니다.");
				modelAndView.addObject("location", "/cs/notice");
		} else {
				modelAndView.addObject("msg", "다시 삭제해주세요.");
				modelAndView.addObject("location", "/cs/notice/view?no=" + no);
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
}
