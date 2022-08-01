package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BookDAO;
import dao.ShoppingCartDAO;
import dao.UserDAO;
import vo.OrderPageDTO;
import vo.OrderVO;
import vo.ShoppingCartVO;
import vo.UserVO;

@Controller
public class ShoppingCartController {
	@Autowired // 자동주입 : 스프링에서 제공하는 클래스에 대해 자동으로 객체를 만들어주는 기능
	// 이 기능을 사용하려면 servlet-context.xml에 <context:annotation-config/>속성을 추가해둬야 한다
	HttpServletRequest request; // Autowired를 통해 자동으로 객체생성이 된다

	@Autowired
	ServletContext application; // 현재프로젝트의 정보를 저장하고 있는 클래스

	@Autowired
	HttpSession session;
	
	static final String WEB_PATH = "/WEB-INF/views/shop&purchase/";

	UserDAO user_dao;

	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}

	BookDAO book_dao;

	public void setBook_dao(BookDAO book_dao) {
		this.book_dao = book_dao;
	}
	
	ShoppingCartDAO shopping_dao;

	public void setShopping_dao(ShoppingCartDAO shopping_dao) {
		this.shopping_dao = shopping_dao;
	}
	

	ShoppingCartVO shoppingCart_vo;
	
	public void setShoppingCart_vo(ShoppingCartVO shoppingCart_vo) {
		this.shoppingCart_vo = shoppingCart_vo;
	}
	
	//장바구니 insert
	@RequestMapping(value= "/shoppingCart_insert.do")
	public String shoppingCartInsert(int num, int bookNum) {
		
		String id = (String) session.getAttribute("id");
		shoppingCart_vo.setBookNum(bookNum);
		shoppingCart_vo.setBookCnt(num);
		shoppingCart_vo.setId(id);
		
		int res = shopping_dao.insert(shoppingCart_vo);

		return "redirect:shoppingCart.do";
	}
	
	
	//장바구니 상세정보
	@RequestMapping(value= "shoppingCart.do")
	public String shoppingCart(Model model) {
		
		String id = (String) session.getAttribute("id");
		//유저 정보
		UserVO list1 =  user_dao.selectOne(id);
		
		//shoppoing_Car+&book table
		List<OrderVO> list2 =shopping_dao.selectlist(id);
		
		
		
		
		model.addAttribute("user", list1);
		model.addAttribute("list2", list2);
		
		return WEB_PATH+"ShoppingCart.jsp";
	}
	
	
	@RequestMapping("UpdateCnt.do")
	@ResponseBody
	public String UpdateCnt(OrderVO vo) {
		int res= shopping_dao.updateCnt(vo); 
		return ""+res;
	}
	
	@RequestMapping("/checkdel.do")
	public String checkDel(HttpServletRequest request) {
		String[] arr = request.getParameterValues("valueArr");
		int[] intArr = null;
		int del =0;
		if(arr !=null) {
			intArr = new int[arr.length];
		}
		for (int i = 0; i < intArr.length; i++) {
			intArr[i] = Integer.parseInt(arr[i]);
			del = shopping_dao.checkdel(intArr[i]);
		}
		
		return "redirect:shoppingCart.do";
	}
	
	
//삭제하나
	@RequestMapping("/delone.do")
	@ResponseBody
	public String delone(int shopnum) {
		int res= shopping_dao.delOne(shopnum);
		
		System.out.println("삭제하나"+res);
		
		return ""+res;
	}
	
	
	 //주문하기
	  
	  @RequestMapping("checkorder.do")
	  public String goOrder(OrderPageDTO opd, Model model,HttpServletRequest request) {
		  
		  System.out.println("orders : " + opd.getOrders());
		  System.out.println(opd.getOrders());
		
	  
	  return "redirect:purchase.do"; 
	  }

}
