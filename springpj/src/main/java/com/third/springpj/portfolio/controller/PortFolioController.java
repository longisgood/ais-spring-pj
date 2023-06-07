package com.third.springpj.portfolio.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.service.PortFolioService;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("portfolio")
public class PortFolioController {

	@Autowired
	private PortFolioService ps;

	@GetMapping("detail")
	public String Detail(Model model, int pNum) {
		model.addAttribute("port", ps.detailPort(pNum));
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
	public String Writing(FullPortFolioDTO portfolio, HttpSession session, MemberVO loginMember, Model model,RedirectAttributes rttr) {
		loginMember = (MemberVO) session.getAttribute("userInfo");
		portfolio.setMId(loginMember.getMId());
		ps.writePortFolio(portfolio);

		String msg = "作成した文書が登録できました。";

		rttr.addFlashAttribute("message",msg);

		return "redirect:/member/mypage";
	}

	@PostMapping("/modify")
	public String Modify(PortFolioBaseVO base, Model model) {
		FullPortFolioDTO result = ps.detailPort(base.getPNum());
		model.addAttribute("portfolio", result);

		return "portfolio/modify";
	}

	@PostMapping("/change")
	public String Change(FullPortFolioDTO portfolio, Model model,RedirectAttributes rttr,HttpSession session) {
		MemberVO loginMember = (MemberVO)session.getAttribute("userInfo");
		portfolio.setMId(loginMember.getMId());
		ps.modifyPort(portfolio);
		String message = "修正できました。";
		rttr.addFlashAttribute("msg",message);
		return "redirect:/member/mypage";

	}
	
	@GetMapping("/delete")
	public String Delete(Model model,PortFolioBaseVO base,RedirectAttributes rttr) {
		
		int result = ps.deletePort(base.getPNum());
		if(result == 1) {
			String message = "削除できました。";
			rttr.addFlashAttribute("msg",message);
			
			return "redirect:/member/mypage";
		}
		
		String message = "エラーが出ました。問題がある場合サイトの番号で連絡してください。";
		rttr.addFlashAttribute("msg",message);
		
		return "redirect:/member/mypage";
	}
	
}
