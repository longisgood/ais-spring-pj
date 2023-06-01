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
	public String Login() {

		return "member/login";
	}

	@PostMapping("/loginCheck")
	public String loginCheck(Model model, MemberVO user, HttpSession session) {

		MemberVO result = ms.loginCheck(user);
		if (result == null) {
			String message = "해당 정보는 일치하지 않습니다";
			model.addAttribute("message", message);
			return "member/login";
		}
		session.setAttribute("userInfo", result);
		return "redirect:/";
	}

	@GetMapping("/find")
	public String find() {
		return "member/find";
	}

	@GetMapping("/find1")
	public String find1(Model model) {

		model.addAttribute("find", "id");

		return "member/find";

	}

	@GetMapping("/find2")
	public String find2(Model model) {

		model.addAttribute("find", "pw");
		return "member/find";
	}

	@GetMapping("/idFind")
	public String idfind() {
		return "member/find";

	}

	@GetMapping("/pwFind")
	public String pwfind() {
		return "member/find";
	}

	@GetMapping("/login-btn")
	public String loginbtn() {
		return "member/login";
	}
	
	  @GetMapping("/logout-btn")
	  public String logout(HttpSession session) {
		  session.invalidate();
		  
		  return "redirect:/"; 
		  
	  }
	 
}
