package com.third.springpj.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.third.springpj.common.dao.MainDAO;

@Controller
public class MainController {

	private MainDAO md;

	@GetMapping("/")
	public String MainCall() {
		
		return "index";
	}
}
