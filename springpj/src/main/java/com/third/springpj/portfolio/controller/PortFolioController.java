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
	
	
	@GetMapping("detail")
	public String Detail(Model model, FullPortFolioDTO port) {
		
		port = ps.detailPort(2);
		
		model.addAttribute("port",port);
		
		
		return "portfolio/detail";
	}

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
		
		String msg = "作成した文書が登録しました。";
		
		model.addAttribute("message",msg);
		
		return "portfolio/detail";
	}
}
