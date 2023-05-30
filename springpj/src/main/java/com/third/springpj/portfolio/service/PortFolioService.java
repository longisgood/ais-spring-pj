package com.third.springpj.portfolio.service;

import java.util.List;

import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

public interface PortFolioService {
	
	// 포트폴리오 작성 
	void writePortFolio(FullPortFolioDTO port);
	
	// 포트폴리오 공개여부 체크
	String viewCheck(int pNum);
	
	// 포트폴리오 상세보기
	FullPortFolioDTO detailPort(int pNum);
	
	// 포트폴리오 수정하기
	int modifyPort(FullPortFolioDTO port);
	
	// 포트폴리오 삭제하기
	int deletePort(int pNum);
	
	
}
