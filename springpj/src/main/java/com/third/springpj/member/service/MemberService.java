package com.third.springpj.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

public interface MemberService {

	// 로그인 체크
	//　ログインチェック
	MemberVO loginCheck(MemberVO user);
	
	// 아이디 중복체크
	// ID重複チェック
	int idCheck(String mId);
	
	// Email 중복체크
	// Email重複チェック
	int emailCheck(String mEmail);
 
	// 비밀번호 불러오기
	// パスワ－ド出力
	String getPw(String mId);
	
	// 로그인한 멤버 포트폴리오 게시물 불러오기
	// ログインしたユーザーのポートポートフォリオ出力
	List<FullPortFolioDTO> getPortFolioList(String mId);
	
	// 마이페이지에서 로그인한 멤버 포트폴리오 삭제하기
	// マイページでポートフォリオ削除
	int deletePortFolio(int pNum);
	
	// 회원가입 
	// ユーザー加入
	void joinMember(MemberVO user);
	
	// 회원 개인정보 불러오기
	// ユーザー情報出力
	MemberVO memberInfo(int mNum);
	
	// 회원정보수정
	// ユーザー情報更新
	int modifyMember(MemberVO loginMember);
	
	// 회원 탈퇴
	// 会員退会
	int withdrawMember(int mNum);
}
