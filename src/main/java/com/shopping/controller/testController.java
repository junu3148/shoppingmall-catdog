package com.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

	
	@RequestMapping("/test")
	public String test() {
		
		System.out.println("test입니다...");
		System.out.println("수정했습니다.");
		System.out.println("다시 수정했습니다.");
		System.out.println("다시다시다시다 수정했습니다.");
		
		return "adminTest/CustomerModify";
	}
	

	
}
