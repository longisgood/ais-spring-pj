package com.third.springpj.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.third.springpj.member.service.MemberService;
import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService ms;

	@Autowired
	JavaMailSender mailSender;

	//Loginボタンを押せばページで移動
	@GetMapping("/login-btn")
	public String loginbtn() {

		return "member/login";
	}

	//Logautボタンを押せばページで移動
	@GetMapping("/logout-btn")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";

	}

	//Login確認ボタンを押せば実行
	@PostMapping("/loginCheck")
	public String loginCheck(Model model, MemberVO user, HttpSession session) {

		MemberVO result = ms.loginCheck(user);

		if (result == null) {
			String message = "該当する情報が一致されません。";


			model.addAttribute("message", message);
			return "member/login";
		}
		if(result.getWithdraw().equals("N")){
			String message = "該当する情報が一致されません。";


			model.addAttribute("message", message);
			return "member/login";
		}

		session.setAttribute("userInfo", result);
		return "redirect:/";
	}

//   ID探すページで移動　　
	@GetMapping("/find1")
	public String find1(Model model) {

		model.addAttribute("find", "id");

		return "member/find";

	}

// パスワード探すページで移動
	@GetMapping("/find2")
	public String find2(Model model) {

		model.addAttribute("find", "pw");
		return "member/find";
	}

	// ID探すの情報を表示
	@PostMapping("/eMailFind")
	public @ResponseBody String eMailFind(String mEmail) {
		String id = ms.eMailFind(mEmail);
		return id;
	}
	
	
	// パスワード探すページの情報表示
	  @PostMapping("/pwFind")
	  @ResponseBody 
	  public String pwFind(MemberVO user) { 
		  String pw = ms.realPw(user);
		  return pw;
	  }
	
	//Emailでパスワード探す
	@PostMapping("/memberCheck")
	@ResponseBody
	public int memberCheck(MemberVO findMember) throws Exception {
		int result = ms.getPw(findMember);
		return result;
	}
	
	@GetMapping("/mypage")

	public String mypage(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("userInfo");
		String id = loginMember.getMId();
		List<PortFolioBaseVO> result = ms.getPortFolioList(id);
		model.addAttribute("portfolio", result);
		return "member/mypage";

	}
	
	// 가입 페이지로 이동
	// 加入ページに移動
	@GetMapping("/join")
	public String Join() {
		return "member/join";
	}

	// 아이디 중복확인 기능
	@PostMapping("/idCheck")
	@ResponseBody 
	public int idCheck(String mId) {

		return ms.idCheck(mId);
	}

	// 입력한 이메일로 가입한 유저가 있는지 확인
	@PostMapping("/emailCheck")
	@ResponseBody 
	public int emailCheck(String mEmail) {
		int result = ms.emailCheck(mEmail);
		return result;
	}

	// 회원 가입
	@PostMapping("/register")
	public String join(MemberVO user) {
		 ms.joinMember(user); 
		return "member/login";
	}

	// 수정페이지로 이동
	@GetMapping("/info")
	public String Info() {
		return "member/info";
	}

	// 회원정보 수정
	@PostMapping("/changeInfo")
	public String Info(MemberVO user, HttpSession session,RedirectAttributes rttr) {
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
		user.setMNum(userInfo.getMNum());
		int result = ms.modifyMember(user);
		if(result != 0) {
			MemberVO changeMember = ms.memberInfo(user.getMNum());
			
			session.removeAttribute("userInfo");
			session.setAttribute("userInfo",changeMember);
			
			String message = "成功的に修正されました。";
			rttr.addFlashAttribute("flashMessage",message);
			
			return "redirect:/member/mypage";
		}
		
		String message = "情報修正に失敗しました。もう一度お試しください。";
		rttr.addFlashAttribute("flashMessage",message);

		return "redirect:/member/info";
	}

	// 인증메일 전송
	@GetMapping("/checkEmail")
	@ResponseBody
	public String sendMail(@RequestParam("mEmail") String email) throws Exception {
		System.out.println(email);
		String code = "";
		for (int i = 0; i < 5; i++) {
			code += (int) (Math.random() * 10);
		}

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
		helper.setFrom("yukitozx7@gmail.com");
		helper.setTo(email);
		helper.setSubject("認証メールです。");
		helper.setText("認証コード : <h3>[" + code + "]</h3>", true);
		mailSender.send(message);
		System.out.println(code);
		return code;
	}

	@GetMapping("/delete")
	public String withdraw(HttpSession session,RedirectAttributes rttr) {
		MemberVO loginMember = (MemberVO) session.getAttribute("userInfo");
		int result = ms.withdrawMember(loginMember);
		if(result != 0) {
			
			session.removeAttribute("userInfo");
			String msg = "利用してくれてありがとうございます。";
			rttr.addFlashAttribute("msg",msg);
			
			return "redirect:/";
		}
		
		String msg = "脱退に失敗しました。もう一度お試しください。";
		rttr.addFlashAttribute("msg",msg);
		
		return "redirect:/member/info";
	}
	
	@GetMapping("/deleteP")
	public String deleteP(Model model,PortFolioBaseVO base,RedirectAttributes rttr) {
		
		int result = ms.deletePortFolio(base.getPNum());
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
