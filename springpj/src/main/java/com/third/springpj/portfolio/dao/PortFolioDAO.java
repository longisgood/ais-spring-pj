package com.third.springpj.portfolio.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;
import com.third.springpj.portfolio.vo.PortFolioDetailVO;

@Mapper
public interface PortFolioDAO {
	
	
	 //SQL013 - portfolio base 테이블에 값 입력
	@Insert("insert into tbl_portfolio_base(pTitle,mId,pJob,pComp,pEdu,pCareer,pLisence,viewCheck) "
			+ "values(#{base.pTitle},#{base.mId},#{base.pJob},#{base.pComp},#{base.pEdu},#{base.pCareer},#{base.pLisence}),#{base.viewCheck}")
	void insertPortBase(PortFolioBaseVO base);
	
	//SQL014 - portfolio detail 테이블에 값 입력
	@Insert("insert into tbl_portfolio_detail(pNum,pSkill,pText,pFile) values(#{detail.pNum},#{detail.pSkill},#{detail.pText},#{detail.pFile})")
	void insertPortDetail(PortFolioDetailVO detail);
	
	//SQL015 - viewCheck Y / N 체크
	@Select("select viewCheck from tbl_portfolio_base where pNum = #{pNum}")
	String viewCheck(int pNum);
	
	//SQL016 - 해당하는 portfolio_base자료 찾기
	@Select("select * from tbl_portfolio_base where pNum = #{pNum}")
	PortFolioBaseVO findBase(int pNum);
	
	//SQL017 - 해당하는 portfolio_detail자료 찾기
	@Select("select * from tbl_portfolio_detail where pNum = #{pNum}")
	PortFolioDetailVO findDetail(int pNum);
	
	//SQL018 - 해당하는 portfolio_base 테이블에 입력 받은 자료 업데이트
	@Update("update tbl_portfolio_base set pTitle = #{base.pTitle}, pJob = #{base.pJob}, pComp = #{pComp}, pEdu = #{base.pEdu}, "
			+ "pCareer = #{base.pCareer}, pLicense = #{base.pLicense}, viewCheck = #{base.viewCheck} where pNum = #{base.pNum}")
	int updateBase(PortFolioBaseVO base);
	
	//SQL019 - 해당하는 portfolio_detail 테이블에 입력받은 자료 업데이트
	@Update("update tbl_portfolio_detail set pSkill = #{detail.pSkill}, pText = #{detail.pText}, pFile = #{detail.pFile} "
			+ "where pNum  = #{detail.pNum}")
    int  updateDetail(PortFolioDetailVO detail);
	
	//SQL020 - 해당하는 포트폴리오 자료를 delete
	@Delete("delete from tbl_portfolio_base where pNum = #{pNum}")
	int deletePortFolio(int pNum);
	
	//SQL026 - base 테이블에서 게시글 번호 가져오기
	@Select("select pNum from tbl_portfolio_base where mId = #{mId} order by pNum desc limit 1")
	int findpNum(String mId);
}
