package com.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.service.ProductService;
import com.shopping.vo.ProductVO;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/")
	public String main(Model model) {
		System.out.println("main()");

		return "main/main";
	}

	// --------------- all 페이지
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String all(Model model,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@RequestParam(value = "subCategory", required = false, defaultValue = "all") String subCategory) {
		System.out.println("all()");

		List<ProductVO> productList = productService.getProductList(category, subCategory);

		model.addAttribute("productList", productList);
		model.addAttribute("view", "all");

		return "product/product";

	}

	// -------------- 카테고리 페이지
	@RequestMapping(value = "/category/{subCategory}", method = RequestMethod.GET)
	public String category(Model model,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@PathVariable("subCategory") String subCategory) {
		System.out.println("category()");

		List<ProductVO> productList = productService.getProductList(category, subCategory);

		System.out.println(productList);

		model.addAttribute("productList", productList);
		model.addAttribute("view", "category");
		model.addAttribute("subCategory", subCategory);

		return "product/product";
	}
	
	// -------------------- 상품 상세페이지
	public String productDetal() {
		System.out.println("productDetal");
		
		return "";
				
	}
}






