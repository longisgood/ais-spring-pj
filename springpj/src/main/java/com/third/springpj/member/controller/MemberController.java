package com.third.springpj.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.springpj.member.service.MemberService;
import com.third.springpj.member.vo.MemberVO;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@GetMapping("/login")
	public String Login()  {
		return "member/login";
	}
	
	
	
	
}
