package com.third.springpj.portfolio.service;

import java.util.List;

import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;

public interface PortFolioService {
	
	// 포트폴리오 작성 
	// ポートフォリオ作成
	void writePortFolio(FullPortFolioDTO port);
	
	// 포트폴리오 공개여부 체크
	// ポートフォリオ詳細情報公開可否
	String viewCheck(int pNum);
	
	// 포트폴리오 상세보기
	// ポートフォリオの詳細情報出力
	FullPortFolioDTO detailPort(int pNum);
	
	// 포트폴리오 수정하기
	// ポートフォリオ修正
	void modifyPort(FullPortFolioDTO port);
	
	// 포트폴리오 삭제하기
	// ポートフォリオ削除
	int deletePort(int pNum);
	
	
}
