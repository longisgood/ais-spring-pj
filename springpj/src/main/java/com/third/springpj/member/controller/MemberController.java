package com.third.springpj.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.third.springpj.member.service.MemberService;
import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
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
	

	@GetMapping("/mypage")
	public String MyPage(HttpSession session,MemberVO loginMember,Model model) {
		loginMember = (MemberVO) session.getAttribute("userInfo");
		List<PortFolioBaseVO> result = ms.getPortFolioList(loginMember.getMId());
		model.addAttribute("portfolio",result);
		
		return "member/mypage";
	}

	// 가입 페이지로 이동
	// 加入ページに移動
	@GetMapping("join")
	public String Join() {
		return "member/join";
	}

	// 아이디 중복확인 기능
	@PostMapping("/idCheck")
	public @ResponseBody int idCheck(String mId) {

		return ms.idCheck(mId);
	}
	
	
	//입력한 이메일로 가입한 유저가 있는지 확인
	@PostMapping("/emailCheck")
	public @ResponseBody int emailCheck(String mEmail) {
		return ms.emailCheck(mEmail);
	}

	// 회원 가입
	@PostMapping("/join")
	public String join(MemberVO user) {
		
		log.info("회원가입 실행");
			
		ms.joinMember(user);
		return "redirect:./login";
	}
	
	
	

	// 수정페이지로 이동
	@GetMapping("info")
	public String Info(Model model, MemberVO user) {
		log.debug("수정 페이지로 이동");

		user.setMId("asdasd");
		user.setMPw("asdasda");
		MemberVO result = ms.loginCheck(user);

		model.addAttribute("member", result);

		return "member/info";
	}
	
	
	// 회원정보 수정
		@PostMapping("info")
		public String Info(MemberVO user) {
			ms.modifyMember(user);


			return "redirect:../";
		}

}
