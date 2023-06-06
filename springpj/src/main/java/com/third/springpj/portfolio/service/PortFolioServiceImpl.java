package com.third.springpj.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.springpj.portfolio.dao.PortFolioDAO;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;
import com.third.springpj.portfolio.vo.PortFolioBaseVO;
import com.third.springpj.portfolio.vo.PortFolioDetailVO;

@Service
public class PortFolioServiceImpl implements PortFolioService {

	@Autowired
	private PortFolioDAO pd;

	@Override
	public void writePortFolio(FullPortFolioDTO port) {
		PortFolioBaseVO base = port.seperBase(port);
		pd.insertPortBase(base);

		int pNum = pd.findpNum(base.getMId());

		PortFolioDetailVO detail = port.seperDetail(port);
		detail.setPNum(pNum);
		pd.insertPortDetail(detail);

	}

	@Override
	public String viewCheck(int pNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FullPortFolioDTO detailPort(int pNum) {
		FullPortFolioDTO result = new FullPortFolioDTO(pd.findBase(pNum), pd.findDetail(pNum));

		return result;
	}

	@Override
	public void modifyPort(FullPortFolioDTO port) {
		PortFolioBaseVO base = port.seperBase(port);
		PortFolioDetailVO detail = port.seperDetail(port);
		pd.updateBase(base);
		pd.updateDetail(detail);
	}

	@Override
	@Transactional
	public int deletePort(int pNum) {
		int result = pd.deletePortFolio(pNum);
		return result;
	}

}
