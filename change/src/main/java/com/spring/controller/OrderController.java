package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import dao.OrderDAO;
import dao.UserDAO;
import vo.BookVO;
import vo.DeliveryVO;
import vo.OrderItemDTO;
import vo.OrderPageDTO;
import vo.OrderVO;
import vo.UserVO;

@Controller
public class OrderController {
	@Autowired // 자동주입 : 스프링에서 제공하는 클래스에 대해 자동으로 객체를 만들어주는 기능
	// 이 기능을 사용하려면 servlet-context.xml에 <context:annotation-config/>속성을 추가해둬야 한다
	HttpServletRequest request; // Autowired를 통해 자동으로 객체생성이 된다
	@Autowired
	HttpSession session;

	@Autowired
	ServletContext application; // 현재프로젝트의 정보를 저장하고 있는 클래스

	static final String WEB_PATH = "/WEB-INF/views/shop&purchase/";

	UserDAO user_dao;

	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}

	BookDAO book_dao;

	public void setBook_dao(BookDAO book_dao) {
		this.book_dao = book_dao;
	}

	DeliveryVO delivert_vo;

	public DeliveryVO getDelivert_vo() {
		return delivert_vo;
	}

	public void setDelivert_vo(DeliveryVO delivert_vo) {
		this.delivert_vo = delivert_vo;
	}

	OrderDAO order_dao;

	public void setOrder_dao(OrderDAO order_dao) {
		this.order_dao = order_dao;
	}

	@RequestMapping(value = "/purchase.do")
	public String list(Model model, OrderPageDTO opd) {
		// 체크박스
		System.out.println("구매orders : " + opd.getOrders());

		List<OrderVO> checkbook = opd.getOrders();

		List<OrderVO> result = new ArrayList<OrderVO>();

		for (OrderVO ord : opd.getOrders()) {
			OrderVO findbook = order_dao.findbook(ord.getBookNum());
			findbook.setBookCnt(ord.getBookCnt());
			findbook.setShopnum(ord.getShopnum());
			findbook.initSaleTotal();
			result.add(findbook);
		}

		System.out.println("result : " + result);

		// 유저 정보
		String id = (String) session.getAttribute("id");

		UserVO list1 = user_dao.selectOne(id);

		// 책정보
		List<BookVO> list2 = book_dao.selectlist();

		model.addAttribute("user", list1);
		model.addAttribute("book", list2);
		model.addAttribute("checkbook", result);

		return WEB_PATH + "payment.jsp";

	}

	// 주문완료화면으로 이동(주문 완료 페이지)
	@RequestMapping("success_payment.do")
	public String success_payment(Model model, DeliveryVO v, OrderItemDTO vo) {

		v.setUsePoint(v.getUsePoint());

		// 주문테이블 insert
		String id = (String) session.getAttribute("id");

		System.out.println("id : " + id);


		List<OrderItemDTO> ords = new ArrayList<>();

		for (OrderItemDTO oit : v.getOrders()) {
			// 장바구니 삭제
			System.out.println("샵 넘 : " + oit.getShopnum());
			if(oit.getShopnum()!=0) {
				int deleteShopnum = order_dao.deleteShop(oit.getShopnum());
			}
			OrderItemDTO orderItem = order_dao.getOrderinfo(oit.getBooknum());

			orderItem.setBookcnt(oit.getBookcnt());

			orderItem.initSaleTotal();

			ords.add(orderItem);

		}

		System.out.println("delivert_vo 변경 전 : " + delivert_vo);

		delivert_vo.setOrders(ords);

		delivert_vo.setUsePoint(v.getUsePoint());

		delivert_vo.setOrderSalePrice(0);

		delivert_vo.getOrderPriceInfo();

		delivert_vo.setAddressee(v.getAddressee());

		delivert_vo.setDeliverytel1(v.getDeliverytel1());
		delivert_vo.setDeliverytel2(v.getDeliverytel2());
		delivert_vo.setDeliverytel3(v.getDeliverytel3());
		delivert_vo.setMemberAddr1(v.getMemberAddr1());
		delivert_vo.setMemberAddr2(v.getMemberAddr2());
		delivert_vo.setId(v.getId());
		delivert_vo.setMemberAddr3(v.getMemberAddr3());


		System.out.println("delivert_vo 변경 : " + delivert_vo);

//		DB주문
		long nano = System.currentTimeMillis();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm.SSS");
		String orderId = id + format.format(nano);
		System.out.println(orderId);
		v.setOrderId(orderId);
		v.setId(id);

		
		// db넣기 enrollOrder
		int enrollorder = order_dao.insertorder(v);

		List<Integer> totalbookcnt = new ArrayList<Integer>();
		for (OrderItemDTO oit : v.getOrders()) {
			oit.setOrderId(orderId);
			int insertItem = order_dao.insertItem(oit);
			totalbookcnt.add(oit.getBookcnt());

		}
		
		delivert_vo.setOrderId(v.getOrderId());
		delivert_vo.setUsePoint(v.getUsePoint());

		delivert_vo.setOrderFinalSalePrice(v.getOrderFinalSalePrice());
		System.out.println(v.getOrderFinalSalePrice());
		
		
		
		delivert_vo.setId(id);
	
		
		
	
		
		System.out.println("v를 찾아서"+v);

		int savepoint = v.getSavePoint();
		
		
		System.out.println(savepoint);
		
		// point-usepoint+적립예정포인트(savepoint)
		int usePoint = order_dao.usePoint(v);
		System.out.println(usePoint+"usePoint");
		
		//책사기(money - salePrice)
		int buy = order_dao.buybook(delivert_vo);
		
		//만약 usePoint가 음수가 된다면 0으로 대체

		System.out.println("돈돈돈 : :" + vo.getTotalPrice());

		model.addAttribute("savePoint", savepoint);
		model.addAttribute("totalbookcnt", totalbookcnt);
		return WEB_PATH + "success_payment.jsp";
	}

	// 주문 상세페이지
	@RequestMapping("/detail_page.do")
	public String content_page(Model model) {

		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		String date = sDate.format(new Date());

		List<OrderItemDTO> ords = new ArrayList<>();
		OrderItemDTO orderItem = null;
			for (OrderItemDTO oit : delivert_vo.getOrders()) {

				orderItem = order_dao.getOrderinfo(oit.getBooknum());

				orderItem.setBookcnt(oit.getBookcnt());

				orderItem.setTotalPrice(oit.getTotalPrice());

				orderItem.initSaleTotal();

				ords.add(orderItem);

			}

			delivert_vo.setOrders(ords);


		model.addAttribute("order", ords);
		model.addAttribute("date", date);
		model.addAttribute("delivery", delivert_vo);

		return WEB_PATH + "detail_page.jsp";
	}

	@RequestMapping("/main.do")
	public String main() {

		String id = (String) session.getAttribute("id");
		delivert_vo.setId(id);
		
		UserVO vo =user_dao.selectOne(id);
		HttpSession session = request.getSession(); // 세션영역을 가져온다
		session.setAttribute("point", vo.getShopPoint());
		session.setAttribute("money", vo.getMoney());

		return "/WEB-INF/views/main.jsp";
	}

//	장바구니로 이동
	@RequestMapping("/goshopping.do")
	public String goshopping(OrderVO vo) {

		return "redirect:shoppingCart.do";
	}

}