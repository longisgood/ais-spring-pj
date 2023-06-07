package com.third.springpj.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.third.springpj.common.dao.MainDAO;
import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	private MainDAO md;

	@GetMapping("/")
	public String MainCall(HttpSession session, Model model) {
		
		List<PortFolioBaseVO> list = md.loadLastTitle();
		model.addAttribute("PortFolio",list);
		
		
		
		
		
		
		if (session.getAttribute("userInfo") != null) {

			MemberVO mv = (MemberVO) session.getAttribute("userInfo");

			List<PortFolioBaseVO> mylist = md.loadMemberTitle(mv.getMId());

			model.addAttribute("portFolio", mylist);

			return "index";

		}

		return "index";
	}
	

}
