package com.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CustomerService;
import com.shopping.vo.CustomerVO;

@RequestMapping("/customer")
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	/* 로그인 페이지 이동 */

	
	@RequestMapping(value = "/loginPage")
	public String loginForm() {
			
		System.out.println("loginPage Controller()");
		
		return "customer/login";
	}
	
	
	///////////////////////////////////////////////
	
	/* 로그인 */

	@RequestMapping(value = "/login")
	public String login(@ModelAttribute CustomerVO customerVO
						,HttpSession session
						,Model model) {
		
		String message = "아이디 또는 비밀번호를 잘못입력했습니다. \n<br> 입력하신 내용을 다시 확인해주세요.";

	
		System.out.println("login Controller()" + customerVO);
		CustomerVO authCustomer = customerService.login(customerVO);
		
		if(authCustomer == null) {
			model.addAttribute("message", message);
			return "customer/login";
		}else {
			session.setAttribute("authCustomer", authCustomer);
			return "redirect:/main/";
		}
	}

	///////////////////////////////////////////////
	
	/* 로그아웃 */
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) { 
		System.out.println("logout Controller()");
		session.removeAttribute("authCustomer");
		session.invalidate();
		
		return "redirect:/main/";
	}
	
	
	///////////////////////////////////////////////
	
	/* 회원가입 페이지 이동 */
	
	@RequestMapping(value = "/joinPage")
	public String joinForm() {
		
		System.out.println("JoinPage Controller()");
		
		return "customer/join";
	}
	
	
	///////////////////////////////////////////////

	
	/* 회원가입 */
	/* 가입 성공 후에는 로그인 페이지로 이동 */
	@RequestMapping(value = "/join")
	public String join(@ModelAttribute CustomerVO customerVO) {
		
		System.out.println("join Controller" + customerVO);
		
		int joinRow = customerService.join(customerVO);
		
		if(joinRow > 0) { 
			System.out.println("가입성공");
		}
		
		return "redirect:/customer/loginPage";
	}
	
	
	///////////////////////////////////////////////
	
	
	/*  AJAX로 회원아이디 유효성 체크*/
	
	@ResponseBody
	@RequestMapping(value ="/checkId")
	public JasonResult checkId(@ModelAttribute CustomerVO customerVO) { 
		
		JasonResult jasonResult = new JasonResult();
		
		boolean result = customerService.checkId(customerVO);
		System.out.println("Controller로 돌아온 정보" + result);
		
		jasonResult.success(result);
		
		return jasonResult;
	}
	
	///////////////////////////////////////////////
	
	
	/* 고객 정보 리스트*/
	
	
	@RequestMapping(value = "/customerView")	
	public String customerView(Model model) {
			
		
		System.out.println("customerView Controller");
		
		List<CustomerVO> customerList = customerService.selectAllCustomer();
		
		model.addAttribute("customerList", customerList);
		
		
		return "adminTest/ccview";
	}

	
	/*고객 검색*/
	@RequestMapping(value = "/search")	
	public String customerSearch(@RequestParam("searchOption") String searchOption
								 ,@RequestParam("keyword") String keyword
								 ,Model model) {
		
		
		customerService.SearchCustomer(searchOption,keyword);
		
		
		
		System.out.println("customerSearch Controller");
		
		
		
		
		return "redirect:";
	}
	
	
}