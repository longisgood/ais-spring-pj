package com.third.springpj.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.springpj.portfolio.service.PortFolioService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("portfolio")
public class PortFolioController {
	
	private PortFolioService ps;

}
