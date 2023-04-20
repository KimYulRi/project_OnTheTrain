package com.kh.onthetrain.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.admin.Service.AdminService;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class AdminController {
   
   @Autowired
   private AdminService service;
   

   // admin member 페이지
   @GetMapping(value = "/admin/member")
   public ModelAndView member(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, HttpSession session) {
	   
	   int totalMember = service.getCountMember();
	   
	   PageInfo pageInfo = new PageInfo(page, 10, totalMember, 10);
	   
	  
	   List<Member> list = service.getMemberList(pageInfo);
	   
	   
	   modelAndView.addObject("list", list);
	   modelAndView.addObject("pageInfo",pageInfo);
	   modelAndView.setViewName("admin/adminMember");
	   
	   return modelAndView;
      }
   

   // admin dashboard 페이지
   @GetMapping(value = "/admin/dashboard")
   public String dashboard(Model model, HttpSession session) {
	   
      return "admin/adminDashboard";
      }


    
}
