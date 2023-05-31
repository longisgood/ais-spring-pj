package com.third.springpj.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.springpj.portfolio.service.PortFolioService;
import com.third.springpj.portfolio.vo.FullPortFolioDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("portfolio")
public class PortFolioController {
	
	@Autowired
	private PortFolioService ps;
	
	
	@GetMapping("detail")
	public String Detail(Model model, FullPortFolioDTO port) {
		
		port = ps.detailPort(2);
		
		model.addAttribute("port",port);
		
		
		return "portfolio/detail";
	}

}
