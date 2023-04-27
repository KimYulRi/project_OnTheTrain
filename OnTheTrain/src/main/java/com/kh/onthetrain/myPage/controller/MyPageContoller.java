package com.kh.onthetrain.myPage.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.common.util.MultipartFileUtil;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.member.service.MemberService;
import com.kh.onthetrain.myPage.model.entity.ReservationCheck;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.service.MyPageService;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
//@RequestMapping("/myPage")
public class MyPageContoller {
	
	@Autowired
	private MyPageService service;
	
	  @Autowired
	   private MemberService memberService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	@GetMapping("/myPage/myPageTicket")
	// 마이페이지 티켓(마이페이지 접속시 기본화면)으로 보내는 메소드
	public ModelAndView toMyTicket(ModelAndView model,
							@RequestParam(defaultValue = "1") int page,
							@SessionAttribute("loginMember") Member loginMember) throws LoginException {

		int listCount = service.getTicketCount(loginMember.getNo());
		PageInfo pageInfo = new PageInfo(page, 3, listCount, 3);
		List<TrainTicket> ticketList = service.getTicketListByMemberNo(loginMember.getNo(),pageInfo);
		
		System.out.println(ticketList);
		model.addObject("pageInfo",pageInfo);
		model.addObject("ticketList",ticketList);
		model.setViewName("/myPage/myPageTicket");
		
		return model;
	}
	
	@GetMapping("/myPage/myPageAccommodation")
	// 마이페이지 결제 완료 숙소 확인 페이지로 보내는 메소드
	public ModelAndView toMyAccommodation(ModelAndView model,
									@RequestParam(defaultValue = "1") int page,
									@SessionAttribute("loginMember") Member loginMember){
		log.info("toMyAcc 메소드 실행");
		
		int listCount = service.getAccommodationCount(loginMember.getNo());
		PageInfo pageInfo = new PageInfo(page, 3, listCount, 5);
		List<Accommodation> accommodationList = service.getAccommodationListByMemberNo(loginMember.getNo(),pageInfo);
		
		
		System.out.println(accommodationList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("accommodationList", accommodationList);
		model.setViewName("myPage/myPageAccommodation");

		
		return model;
	}
	
	@GetMapping("/myPage/myPageAccommodationCheck")
	//마이페이지 결제 완료 숙소 예약 확인 버튼을 눌렀을때 해당 페이지로 보내는 메소드
	public ModelAndView toAccommodationCheck(ModelAndView model,@RequestParam("accNo") int no,@SessionAttribute("loginMember") Member loginMember ) {
			int memberNo = loginMember.getNo();
			Accommodation accommodation = null;
			ReservationCheck reservationCheck = null;
			System.out.println(no);
			
			// 결제완료 예약 확인 no 를 가지고 숙소의 정보를 가져오는 메소드
			accommodation = service.findAccommodationByNo(no);
			
			// 숙소 번호 및 유저 번호를 가지고 예약 정보를 가져오는 메소드
			reservationCheck = service.findReservationByNo(no,memberNo);
			
			
//			reservationCheck = service.findReservationCheckByNo(no);

			
			
			System.out.println("테스트 테스트" +reservationCheck);
			System.out.println("테스트 테스트" +accommodation);
			model.addObject("accommodation", accommodation);
			model.addObject("reservationCheck",reservationCheck);
			model.setViewName("/myPage/myPageAccommodationCheck");
			
			
			return model;
	}
	
	@GetMapping("/myPage/myPageTicketWaiting")
	// 마이페이지 결제 대기 티켓 확인 페이지로 보내는 메소드
	public String toMyTicketWaiting(){
		log.info("toMyTicketWaiting 메소드 실행");
		return "myPage/myPageTicketWaiting";
	}
	

	
	@GetMapping("/myPage/myPageMyScheduler")
	// 마이페이지 나의 스케줄러 페이지로 보내는 메소드
	public ModelAndView toMyScheduler(ModelAndView model,
								@RequestParam(defaultValue = "1") int page,
								@SessionAttribute("loginMember") Member loginMember) {
		log.info("toMyScheduler 메소드 실행");
		
		int listCount = service.getSchedulerCount(loginMember.getNo());
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		List<Scheduler> schedulerList = service.getSchedulerListByMemberNo(loginMember.getNo(),pageInfo);
		
		System.out.println(schedulerList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("schedulerList", schedulerList);
		model.setViewName("myPage/myPageMyScheduler");
		
		
		
		return model;
	}
	
	@GetMapping("/myPage/myPageCoupon")
	// 마이페이지 쿠폰함으로 보내는 메소드
	public ModelAndView toMyCoupon(ModelAndView model,
								@RequestParam(defaultValue = "1") int page,
								@SessionAttribute("loginMember") Member loginMember) {
		
		model.setViewName("myPage/myPageCoupon");
		
		
		log.info("/myPage/toMyCoupon 메소드 실행");
		return model;
	}
	

	
	@GetMapping("/myPage/myPageQna")
	// 마이페이지 1:1 문의 내역으로 보내는 메소드
	public ModelAndView toMyQna(ModelAndView model,
								@RequestParam(defaultValue = "1") int page,
								@SessionAttribute("loginMember") Member loginMember) {
		int listCount = service.getQnaCount(loginMember.getNo());
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		List<Qna> qnaList = service.getQnaListByMemberNo(loginMember.getNo(),pageInfo);
		
		
		log.info("toMyQna 메소드 실행");
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("qnaList", qnaList);
		model.setViewName("myPage/myPageQna");
		
		
		
		return  model;
	}
	
	@GetMapping("/myPage/myPageQnaWrite")
	// 1:1 문의 작성 페이지로 보내는 메소드
	public String toMyQnaWrite() {
		log.info("toMyQnaWrite 메소드 실행");
		return "myPage/myPageQnaWrite";
	}
	
	@PostMapping("/myPage/myPageQnaWrite")
	// 1:1 문의 작성하는 메소드
	public ModelAndView writeQna(
	    ModelAndView modelAndView,
	    @RequestParam("qnatitleinput") String title,
	    @RequestParam("qnatype") String type,
	    @RequestParam("qnacontentinput") String content,
	    @RequestParam("qnafileinput") MultipartFile upfile,
	    @SessionAttribute("loginMember") Member loginMember){

	    Qna qna = new Qna();
	    int qnaNo = qna.getQnaNo();
	    qna.setTitle(title);
	    qna.setType(type);
	    qna.setQnaContent(content);
	    qna.setWriterNo(loginMember.getNo()); 

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

	    if(result > 0) {
	         modelAndView.addObject("msg", "답글이 정상적으로 등되었습니다.");
	      } else {
	         modelAndView.addObject("msg", "답글 수정을 실패하였습니다.");
	      }
	      
	      modelAndView.addObject("location", "/admin/qna/view?no=" + qnaNo );                        

	    modelAndView.setViewName("common/msg");

	    return modelAndView;
	}
	
	// 1:1 문의 상세보기 페이지로 넘겨주는 메소드
	@GetMapping("/myPage/myPageQnaView")
	public ModelAndView QnaView(ModelAndView model,  @RequestParam int no) {
		Qna qna = null;
		QnaReply qnaReply = null;
		Member member = null;
		
		// 게시글 no 를 가지고 문의 게시판 상세보기를 가져오는 메소드
		qna = service.findQnaByNo(no);
		// 게시글 no를 가지고 문의 게시판 작성자를 가져오는 메소드
		member = service.findMemberByNo(no);
		// 게시글 no를 가지고 해당 번호를 가진 문의 게시글에 달린 답변을 가져오는 메소드
		qnaReply = service.findReplyByNo(no);
		
		
		model.addObject("member", member);
		model.addObject("qna",qna);
		model.addObject("qnaReply",qnaReply);
		model.setViewName("/myPage/myPageQnaView");
		
		
		return model;
	}
	
	// 관리자가 답변을 작성하는 메소드
	@PostMapping("/myPage/myPageQnaView")
	public ModelAndView QnaReplyWrite(ModelAndView model,@RequestParam("qnaNo") int qnaNo,@RequestParam("qnamodalreply") String qnamodalreply ) {
		int result = 0;
	
	
			
		System.out.println(qnaNo);
		System.out.println(qnamodalreply);
		
		result = service.insertQnaReply(qnaNo, qnamodalreply);
		
		
		
		model.setViewName("redirect:/myPage/myPageQna");
		return model;
	}
	
	@GetMapping("/myPage/myPageInfoCheck")
	// 마이페이지 개인정보 페이지 접속전 본인 확인하는 페이지로 보내는 메소드
	public String toMyInfoCheck() {
		log.info("toMyInfoCheck 메소드 실행");
		return "myPage/myPageInfoCheck";
	}
	
	
	@PostMapping("/myPage/myPageInfoCheck")
	public ModelAndView memberCheck(ModelAndView model,
	                                @RequestParam("idcheck") String id,
	                                @RequestParam("pwdcheck") String pwd,
	                                @SessionAttribute("loginMember") Member loginMember) {
	    // 입력된 id와 pwd를 이용해 회원 정보를 확인
		
		System.out.println(id);
		System.out.println(pwd);
	    Member member = service.checkMember(id, pwd);
	    
	    if (member == null || !member.getId().equals(loginMember.getId()) || !member.getPassword().equals(loginMember.getPassword())) {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/myPage/myPageInfoCheck");
			model.setViewName("common/msg");
	    } else {
	        model.addObject("msg", "본인인증에 성공하였습니다."); // 
	        model.setViewName("/myPage/myPageInfo");
	    }
	    
	    return model;
	}


	
	
	
	@GetMapping("/myPage/myPageInfo")
	// 마이페이지 개인정보 페이지 본인확인후 개인정보 페이지로 보내는 메소드
	public String toMyInfo() {
		log.info("toMyInfo 메소드 실행");
		return "myPage/myPageInfo";
	}
	
	@PostMapping("/myPage/myPageInfo")
	public ModelAndView updateInfo(ModelAndView model,
								@RequestParam("name")String name,
								@RequestParam("userId")String id,
								@RequestParam("nickname")String nickname,
								@RequestParam("phone")String phone,
								@RequestParam("address1")String address1,
								@RequestParam("address2")String address2,
								@SessionAttribute("loginMember") Member loginMember,
								HttpSession session) {
		
		int no = loginMember.getNo();
		String address = address1 + " " + address2;
		
		int result = service.updateMember(name,id,nickname,phone,address,no);
		
		if(result > 0) {
			
			// 개인정보 페이지에 들어갈때마다 member 테이블의 amount(총결제금액)컬럼을 확인하고 membership 업데이트하기
			result = service.updateMemberShip(no);
			
		}
		
		// HttpSession 무효화                                                   
		session.invalidate();
		model.addObject("msg", "정보가 정상적으로 수정되었습니다 다시 로그인해주시기 바랍니다.");
		model.addObject("location", "/login");
		model.setViewName("common/msg");

		return model;
	}

	
	
 	// 아이디 중복확인
 	@ResponseBody
	@PostMapping("/myPage/myPageIdCheck")
	public boolean idCheck(@RequestParam("userId") String userId) {
		
 		
 		System.out.println(userId);
 		//아이디가 없으면 true, 있으면 false
		return memberService.isDuplicateId(userId);
	}
 	
 	// 닉네임 중복확인
 	@ResponseBody
	@PostMapping("/myPage/myPageNicknameCheck")
	public boolean nicknameCheck(@RequestParam("nickname") String nickname) {
		
 		System.out.println(nickname);
 		//닉네임이 없으면 true, 있으면 false
		return memberService.isDuplicateNickname(nickname);
	}
 	
 	@PostMapping("/myPage/myPageInfoPwd")
 	// 비밀번호 변경을하는 메소드
 	public ModelAndView updatePwd(ModelAndView model,
 									@RequestParam("currentPwd") String oldPwd ,
 									@RequestParam("newPwd") String newPwd,
 									@SessionAttribute("loginMember") Member loginMember,
 									HttpSession session) {
 		int no = loginMember.getNo();
// 		boolean pwdCheck = service.checkPwd(oldPwd, no);
 		
 		
 		int result = service.updatePwd(oldPwd, newPwd,no);
 		
 		//비밀번호 변경 성공
 		if(result > 0) {
 			session.invalidate();
			model.addObject("msg", "비밀번호가 정상적으로 수정되었습니다 다시 로그인해주시기 바랍니다.");
			model.addObject("location", "/login");
			model.setViewName("common/msg");
 		} else {
			model.addObject("msg", "잘못된 비밀번호를 입력하였습니다.");
			model.addObject("location", "/myPage/myPageInfo");
			model.setViewName("common/msg");
 			
 		}
 		
 		return model;
 	}
 	
 	@GetMapping("/myPage/myPageWithdraw")
 	//회원탈퇴 페이지 불러오기
 	public String toWithdraw() {
 		
 		
 		return"/myPage/myPageWithdraw";
 	}
 	
 	@PostMapping("/myPage/myPageWithdraw")
 	// 회원탈퇴
	public ModelAndView withdraw(ModelAndView model,@RequestParam("nameCheck") String nameCheck ,@SessionAttribute("loginMember") Member loginMember,HttpSession session) {
 		int no = loginMember.getNo();
 		
 		if (loginMember.getName().equals(nameCheck)) {	
	 		if(loginMember.getSnsLogin().equals("Y")) {
	 			
	 			int result = service.deleteSnsMember(no);
	 	 		if(result > 0) {
	 	 			session.invalidate();
	 				model.addObject("msg", "회원 탈퇴가 정상적으로 완료되었습니다.");
	 				model.addObject("location", "/login");
	 				model.setViewName("common/msg");
	 	 		} else {
	 				model.addObject("msg", "회원탈퇴에 실패했습니다.");
	 				model.addObject("location", "/myPage/myPageWithdraw");
	 				model.setViewName("common/msg");
	 	 			
	 	 		}
	 	 		
	 			
	 		} else {
	 		
	 			int result = service.deleteMember(no);
	 	 		if(result > 0) {
	 	 			session.invalidate();
	 				model.addObject("msg", "회원 탈퇴가 정상적으로 완료되었습니다.");
	 				model.addObject("location", "/login");
	 				model.setViewName("common/msg");
	 	 		} else {
	 				model.addObject("msg", "회원탈퇴에 실패했습니다.");
	 				model.addObject("location", "/myPage/myPageWithdraw");
	 				model.setViewName("common/msg");
	 	 			
	 	 		}
	 	 		
	 		
 			}
 		} else {
 			model.addObject("msg", "입력하신 이름이 일치하지 않습니다.");
			model.addObject("location", "/myPage/myPageWithdraw");
			model.setViewName("common/msg");
 		}

 		
 		
 		return model;
 	}
 	
 	@GetMapping("/weather/weather")
 	public String weather() {
 		
 		return "weather/weather";
 	}
 	
	
}
