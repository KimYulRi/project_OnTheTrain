package com.kh.onthetrain.myPage.contoller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.common.util.MultipartFileUtil;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class MyPageContoller {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	@GetMapping("/myPageTicket")
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
	public ModelAndView toMyQna(ModelAndView model) {
		List<Qna> qnaList = service.getQnaListByMemberNo(1);
		
		
		log.info("toMyQna 메소드 실행");
		
		model.addObject("qnaList", qnaList);
		model.setViewName("myPage/myPageQna");
		
		
		
		return  model;
	}
	
	@GetMapping("myPageQnaWrite")
	// 1:1 문의 작성 페이지로 보내는 메소드
	public String toMyQnaWrite() {
		log.info("toMyQnaWrite 메소드 실행");
		return "myPage/myPageQnaWrite";
	}
	
	@PostMapping("/myPageQnaWrite")
	// 1:1 문의 작성하는 메소드
	public ModelAndView writeQna(
	    ModelAndView modelAndView,
	    @RequestParam("qnatitleinput") String title,
	    @RequestParam("qnatype") String type,
	    @RequestParam("qnacontentinput") String content,
	    @RequestParam("qnafileinput") MultipartFile upfile){

	    Qna qna = new Qna();
	    qna.setTitle(title);
	    qna.setType(type);
	    qna.setQnaContent(content);
//	    qna.setWriterNo(loginMember.getNo()); 로그인 구현후 주석 해제
	    qna.setWriterNo(1);

	    // 1. 파일을 업로드 했는지 확인 후 파일을 저장.
	    if (upfile != null && !upfile.isEmpty()) {
	        String location = null;
	        String renamedFileName = null;
	        try {
	            location = resourceLoader.getResource("resources/upload/qna").getFile().getPath();

	            renamedFileName = MultipartFileUtil.save(upfile, location);

	            System.out.println(renamedFileName);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        if (renamedFileName != null) {
	            qna.setQnaOriginalFileName(upfile.getOriginalFilename());
	            qna.setQnaRenamedFileName(renamedFileName);
	        }

	    }

	    // 2. 작성한 문의글 데이터를 데이터베이스에 저장
	    int result = service.save(qna);

	    if (result > 0) {
	        modelAndView.addObject("msg", "문의글이 정상적으로 등록되었습니다.");
	        modelAndView.addObject("location", "/myPage/myPageQna");

	    } else {
	        modelAndView.addObject("msg", "문의글 등록을 실패하였습니다.");
	        modelAndView.addObject("location", "/myPageQnaWrite");


	    }

	    modelAndView.setViewName("common/msg");

	    return modelAndView;
	}
	
	// 1:1 문의 상세보기 페이지로 넘겨주는 메소드
	@GetMapping("/myPageQnaView")
	public ModelAndView QnaView(ModelAndView model,  @RequestParam int no ) {
		Qna qna = null;
		QnaReply qnaReply = null;
		
		qna = service.findQnaByNo(no);
		qnaReply = service.findReplyByNo(no);
		
		model.addObject("qna",qna);
		model.addObject("qnaReply",qnaReply);
		model.setViewName("/myPage/myPageQnaView");
		
		
		return model;
	}
	
	// 관리자가 답변을 작성하는 메소드
	@PostMapping("myPageQnaView")
	public ModelAndView QnaReplyWrite(ModelAndView model,@RequestParam("qnaNo") int qnaNo,@RequestParam("qnamodalreply") String qnamodalreply ) {
		int result = 0;
	
	
			
		System.out.println(qnaNo);
		System.out.println(qnamodalreply);
		
		result = service.insertQnaReply(qnaNo, qnamodalreply);
		
		
		
		model.setViewName("redirect:/myPage/myPageQna");
		return model;
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
