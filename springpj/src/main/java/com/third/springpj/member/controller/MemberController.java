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

	// 로그인로고버튼 클릭시 로그인 페이지 이동
	@GetMapping("/login-btn")
	public String loginbtn() {
		return "member/login";
	}

	// 로그아웃버튼 클릭시 메인 페이지 이동
	@GetMapping("/logout-btn")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";

	}

	// 로그인확인버튼 클릭시 수행
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

//   아이디 찾기 화면으로이동
	@GetMapping("/find1")
	public String find1(Model model) {

		model.addAttribute("find", "id");

		return "member/find";

	}

// 비번 찾기 화면으로이동
	@GetMapping("/find2")
	public String find2(Model model) {

		model.addAttribute("find", "pw");
		return "member/find";
	}

	// 아이디 찾기 부분에서 찾기버튼 클릭시 이메일 체크
	@PostMapping("/eMailFind")
	public @ResponseBody String eMailFind(String mEmail) {

		int result = ms.emailCheck(mEmail);
		if (result == 0) {
			String message = "해당 정보는 일치하지 않습니다";
			return message;
		} else {
			return ms.eMailFind(mEmail);
		}

	}

	// 비밀번호 찾기 페이지에서 아이디 체크 버튼 클릭시 아이디유무 확인
	/*
	 * @PostMapping("/mId") public @ResponseBody String pwfindId(String mId) {
	 * 
	 * int result = ms.idCheck(mId);
	 * 
	 * if (result == 1) { String message = "確認しました."; return message; } else {
	 * String message = "確認ができません"; return message; } }
	 */
	
	
	// 비밀번호 찾기 페이지에서 이메일 체크 버튼 클릭시 이메일 체크
	/*
	 * @PostMapping("/mEmail") public String pwfindeMail(String mEmail) { int result
	 * = ms.emailCheck(mEmail);
	 * 
	 * if (result == 1) { String message = "確認しました."; return message; } else {
	 * String message = "確認ができません"; return message; } }
	 */
	@GetMapping("/mypage")
	public String MyPage(HttpSession session, MemberVO loginMember, Model model) {
		loginMember = (MemberVO) session.getAttribute("userInfo");

		System.out.println(loginMember.toString());
		List<PortFolioBaseVO> result = ms.getPortFolioList(loginMember.getMId());
		model.addAttribute("portfolio", result);

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

	// 입력한 이메일로 가입한 유저가 있는지 확인
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

		user.setMId("aaaa");
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

	@PostMapping("delete")
	public @ResponseBody int Delete(int mNum) {

		System.out.println(mNum);

		return ms.withdrawMember(mNum);
	}

}