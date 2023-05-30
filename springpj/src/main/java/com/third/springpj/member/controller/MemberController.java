package com.third.springpj.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.springpj.member.service.MemberService;
import com.third.springpj.member.vo.MemberVO;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@GetMapping("/mypage")
	public String MyPage(Model model, MemberVO user) {
		user.setMId("asia");
		user.setMPw("1234");
		MemberVO result = ms.loginCheck(user);
		
		model.addAttribute("member",result);
		
		return "member/mypage";
	}

}
