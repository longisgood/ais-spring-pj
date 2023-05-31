package com.third.springpj.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.springpj.member.dao.MemberDAO;
import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;

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
	public String getPw(String mId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FullPortFolioDTO> getPortFolioList(String mId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deletePortFolio(int pNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void joinMember(MemberVO user) {
		md.registerMember(user);
		
	}

	@Override
	public MemberVO memberInfo(int mNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyMember(MemberVO loginMember) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int withdrawMember(int mNum) {
		// TODO Auto-generated method stub
		return 0;
	}



}
