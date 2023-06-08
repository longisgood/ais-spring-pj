package com.third.springpj.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.third.springpj.portfolio.vo.PortFolioBaseVO;

@Mapper
public interface MainDAO {

	// SQL021 - 로그인 한 멤버의 포트폴리오 Title 가져오기
	//　該当するユーザーが作成したポートフォリオのタイトルを出力
	@Select("select pTitle,pNum from tbl_portfolio_base where mId = #{mId}")
	List<PortFolioBaseVO> loadMemberTitle(String mId);

	// SQL022 - 최신 포트폴리오 제목,아이디 6개 가져오기
	//　最新のポートフォリオを6つまで出力
	@Select("select mId,pTitle,pNum from tbl_portfolio_base order by pNum desc limit 6")
	List<PortFolioBaseVO> loadLastTitle();

	// SQL023 - 해당하는 유저의 썸네일 이미지 가져오기
	//　該当するユーザーのサムネを出力
	@Select("select mTnail from tbl_pmember where mId = #{mId}")
	String loadThemnail(String mId);

	// SQL024 - 직업별 최신 포트폴리오 제목,아이디 6개 가져오기
	//　該当する職業のポートフォリオ中で最新のポートフォリオを6つまで出力
	@Select("select mId,pTitle from tbl_portfolio_base order by pNum desc limit6 where pJob = #{pJob}")
	List<PortFolioBaseVO> loadJobTitle(String pJob);
	
	// SQL025 - 해당하는 유저의 이름 가져오기
	//　ログイン中のユーザーの名前を出力
	@Select("select mName from tbl_pmember where mId = #{mId}")
	String loadmemname(String mId);
}
