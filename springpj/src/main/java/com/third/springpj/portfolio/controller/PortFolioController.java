package com.third.springpj.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.service.PortFolioService;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("portfolio")
public class PortFolioController {
	
	@Autowired
	private PortFolioService ps;

	// 작성페이지 이동
	@GetMapping("/write")
	public String WritePage(HttpSession session) {
		MemberVO user = new MemberVO();
		user.setMId("asia");
		
		session.setAttribute("userInfo", user);
		return "portfolio/write";
	}
	
	// 글작성 
	@PostMapping("/regi")
	public String Writing(FullPortFolioDTO portfolio, HttpSession session,MemberVO loginMember,Model model) {
		loginMember = (MemberVO) session.getAttribute("userInfo");
		portfolio.setMId(loginMember.getMId());
		ps.writePortFolio(portfolio);
		
		String msg = "작성하신 글 등록이 완료되었습니다.";
		
		model.addAttribute("message",msg);
		
		return "portfolio/detail";
	}
}
