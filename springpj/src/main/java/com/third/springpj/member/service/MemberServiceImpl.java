package com.third.springpj.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.springpj.member.dao.MemberDAO;
import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO md;

	@Override
	public MemberVO loginCheck(MemberVO user) {

		return md.findMember(user);
	}

	@Override
	public int idCheck(String mId) {
		return md.findId(mId);
	}

	@Override
	public int emailCheck(String mEmail) {
		
		return md.findEmail(mEmail);
	}

	@Override
	public int getPw(MemberVO user) {
		// TODO Auto-generated method stub
		return md.findPw(user);
	}

	@Override
	public List<PortFolioBaseVO> getPortFolioList(String mId) {
		return md.findBasePortFolio(mId);
	}

	@Override
	public int deletePortFolio(int pNum) {
		int result = md.deleteBasePortFolio(pNum);
		return result;
	}

	@Override
	public void joinMember(MemberVO user) {
		md.registerMember(user);
		
	}

	@Override
	public MemberVO memberInfo(int mNum) {
		return md.findLoginMember(mNum);
	}

	@Override
	public int modifyMember(MemberVO loginMember) {
		return md.updateMember(loginMember);
	}

	@Override
	@Transactional
	public int withdrawMember(MemberVO user) {
		int result = md.changeWithdraw(user);
		if(result != 0) {
			md.deletePortFolios(user.getMId());
			
			return result;
		}
		
		return 0;
	}
	@Override
	public String eMailFind(String mEmail) {
		// TODO Auto-generated method stub
		return md.eMailFind(mEmail);
	}

	@Override
	public String realPw(MemberVO user) {
		return md.findRealpw(user);
	}

}
