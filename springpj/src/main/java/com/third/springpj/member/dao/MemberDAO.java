package com.third.springpj.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.third.springpj.member.vo.MemberVO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;
import com.third.springpj.portfolio.vo.PortFolioDetailVO;

@Mapper
public interface MemberDAO {
	
	// SQL001 - 아이디,비밀번호가 일치하는 회원정보 검색
	@Select("select * from tbl_pmember where mId = #{user.mId} and mPw = #{user.mPw}")
	MemberVO findMember(MemberVO user);
	
	// SQL002 - 일치하는 아이디 찾기
	@Select("select count(*) from tbl_pmember where mId = #{mId}")
	int findId(String mId);
	
	//SQL003 - 일치하는 Email 찾기
	@Select("select count(*) from tbl_pmember where mEmail = #{mEmail}")
	int findEmail(String mEmail);
	
	//SQL004 - 아이디랑 이메일로 비밀번호 찾기
	@Select("select mPw from tbl_pmember where mId = #{user.mId} and mEmail = #{user.mEmail}")
	String findPw(MemberVO user);
	
	//SQL005 - 멤버 아이디로 해당 아이디가 들어간 모든  기본 포트폴리오 찾기
	@Select("select * from tbl_portfolio_base where mId = #{mId} order by pNum desc ")
	List<PortFolioBaseVO> findBasePortFolio(String mId);
	
	//SQL006 - 탈퇴회원여부 체크
	@Select("select withdraw from tbl_pmember where mId = #{mId}")
	String  checkWithdraw(String mId);
	
	//SQL007 - 포트폴리오 번호에 해당하는 정보 삭제
	@Delete("delete from tbl_portfolio_base where pNum = #{pNum}")
	int deleteBasePortFolio(int pNum);
	
	//SQL008 - 회원정보 생성
	@Insert("insert into tbl_pmember(mId,mPw,mName,mAge,mGender,mEmail,mTnail) values(#{user.mId}),"
			+ "#{user.mPw},#{user.mName},#{user.mAge},#{user.mGender},#{user.mEmail},#{user.mTnail}")
	void registerMember(MemberVO user);
	
	//SQL009 - 회원번호로 해당하는 회원정보 찾기
	@Select("select * from tbl_pmember where mNum = #{mNum}")
	MemberVO findLoginMember(int mNum);
	
	//SQL010 - 회원정보 업데이트
	@Update("update tbl_pmember set mPw = #{loginMember.mPw}, mName = #{loginMember.mName}, mAge = #{loginMember.mAge}, "
			+ "mGender = #{loginMember.mGender}, mEmail = #{loginMember.mEmail}, mTnail = #{loginMember.mTnail} where mNum = #{loginMember.mNum}")
	int updateMember(MemberVO loginMember);
	
	//SQL011 - 회원탈퇴 여부 변경
	@Update("update tbl_pmember set withdraw = 'N' where mNum = #{mNum}")
	int changeWithdraw(int mNum);
	
	//SQL012 - 탈퇴회원 아이디에 해당하는 포트폴리오 전체를 삭제
	@Delete("delete from tbl_portfolio_base where mId = #{mId}")
	int deletePortFolios(String mId);
	
	  //SQL0027  일치하는 메일로 아이디찾기
	   @Select ("select mId from tbl_pmember where mEmail = #{mEmail}")
	   String emailFind(String mEmail);
	
}
