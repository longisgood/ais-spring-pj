package com.third.springpj.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.springpj.portfolio.dao.PortFolioDAO;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;


@Service
public class PortFolioServiceImpl implements PortFolioService {

	private PortFolioDAO  pd;
	
	@Override
	public void writePortFolio(FullPortFolioDTO port) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String viewCheck(int pNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FullPortFolioDTO detailPort(int pNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyPort(FullPortFolioDTO port) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int deletePort(int pNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
