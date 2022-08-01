package com.spring.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import dao.UserDAO;
import service.UserService;
import util.Common;
import util.PagingUser;
import vo.BookVO;
import vo.DeliveryVO;
import vo.OrderItemDTO;
import vo.UserVO;

@Controller
public class UserController {

	UserDAO user_dao;

	public void setUser_dao(UserDAO user_dao) {
		this.user_dao = user_dao;
	}

	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	DeliveryVO delvo;

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	HttpServletRequest response;

	static final String WEB_PATH = "/WEB-INF/views/";

	// 약관
	@RequestMapping("new_head.do")
	public String new_form1() {
		return WEB_PATH + "new_head.jsp";
	}

	// 회원가입전 아이디 유뮤 창
	@RequestMapping("new_check.do")
	public String new_form2() {
		return WEB_PATH + "new_check2.jsp";
	}

	@RequestMapping("IdCheckForm")
	public String idcheckform() {
		return WEB_PATH + "IdCheckForm.jsp";
	}

	@RequestMapping("check_id.do")
	@ResponseBody
	public String id_check(String id) {
		UserVO vo = user_dao.selectOne(id);
		String str = "yes";

		if (vo == null) {
			return str;
		} else {
			str = "no";
		}

		return str;
	}

	// 회원가입전 가입유무 검사
	@RequestMapping("check.do")
	@ResponseBody
	public String check(String name, String tel) {
		UserVO vo = user_dao.selectOne_search(name);
		String tel1 = tel.substring(0, 3);
		String tel2 = tel.substring(3, 7);
		String tel3 = tel.substring(tel.length() - 4, tel.length());
		;
		String str = "yes";
		System.out.println(tel1);
		System.out.println(tel2);
		System.out.println(tel3);

		if (vo == null) {
			return str;
		}

		// 이름 체크
		if (tel1.equals(vo.getTel1()) && name.equals(vo.getName()) && tel2.equals(vo.getTel2())
				&& tel3.equals(vo.getTel3())) { // 전화번호를 체크
			str = "no";
		}

		return str;
	}

	// 회원가입창
	@RequestMapping("new.do")
	public String new_form3(Model model, String name, String tel1, String tel2, String tel3) {

		model.addAttribute("name", name);
		model.addAttribute("tel1", tel1);
		model.addAttribute("tel2", tel2);
		model.addAttribute("tel3", tel3);
		return WEB_PATH + "new.jsp";
	}

	@RequestMapping("insert.do")
	public String insert(Model model, UserVO vo) {
		// vo가 가진 정보를 DB에 insert
		int res = user_dao.insert(vo);
		if (res == 1) {
			model.addAttribute("msg", "회원가입이 완료 되었습니다.");
		} else {
			model.addAttribute("msg", "회원가입실패");
		}
		return WEB_PATH + "include_user/redirect2.jsp";
	}

	// 로그인창
	@RequestMapping("login_form.do")
	public String login_form() {
		return WEB_PATH + "login_form2.jsp";
	}

	// 로그인
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String id, String pwd) {
		UserVO vo = user_dao.selectOne(id);
		String str = "no";

		if (vo == null) {
			return str;
		}
		// 아이디 체크
		if (id.equals(vo.getId()) && pwd.equals(vo.getPwd())) { // 아이디, 비밀번호를 체크
			str = "yes";
		}
		System.out.println(id);
		System.out.println(vo.getId());
		System.out.println(pwd);
		System.out.println(vo.getPwd());
		// 아이디와 비밀번호 체크에 문제가 없다면 vo객체를
		// 어디서든 사용가능하도록 sessionScope영역에 저장.
		HttpSession session = request.getSession(); // 세션영역을 가져온다
		session.setAttribute("id", id);
		session.setAttribute("pwd", vo.getPwd());
		session.setAttribute("name", vo.getName());
		session.setAttribute("nickname", vo.getNickname());
		session.setAttribute("postcode", vo.getPostcode());
		session.setAttribute("addr1", vo.getAddress1());
		session.setAttribute("addr2", vo.getAddress2());
		session.setAttribute("email", vo.getEmail());
		session.setAttribute("tel1", vo.getTel1());
		session.setAttribute("tel2", vo.getTel2());
		session.setAttribute("tel3", vo.getTel3());
		session.setAttribute("gender", vo.getGender());
		session.setAttribute("jumin1", vo.getJumin1());
		session.setAttribute("jumin2", vo.getJumin2());
		session.setAttribute("point", vo.getShopPoint());
		session.setAttribute("money", vo.getMoney());
		// 세션유지시간(기본값 30분)
		// response.sendRedirect("main.jsp");
		session.setMaxInactiveInterval(60 * 60);// 세션 유지시간을 1시간으로 설정

		return str;
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		System.out.println("로그아웃으로 간다.");
		HttpSession session = request.getSession();
		session.removeAttribute("vo");// 세션에서 vo라는 키값 제거
		System.out.println("과연");

		return WEB_PATH + "include_user/logout.jsp";
	}

	// 마이페이지
	@RequestMapping("mypage.do")
	public String mypage_form(Model model) {

		String id = (String) session.getAttribute("id");

		// 오늘 산 상품만 조회
		List<DeliveryVO> vo = user_dao.todaybuy(id);

		System.out.println(vo);

		if (vo != null) {
			model.addAttribute("vo", vo);

		} else {
			model.addAttribute("listCheck", "empty");
		}

		return WEB_PATH + "mypage.jsp";

	}

	// 주문내역
	@RequestMapping("orderlist.do")
	public String orderlist(String page, Model model) {

		// 유저 정보
		String id = (String) session.getAttribute("id");

		// page, 호출되는 페이지url,id
		// 페이징 처리1
		List<DeliveryVO> list = userService.pagging1(id, page, "orderlist.do");
		System.out.println(list);
		// 페이징 처리메뉴-2
		String pageMenu = userService.pagging2(id, "orderlist.do");

		// 전체 달력리스트의 배송중인 것만 +7 지나고 배송 완료 -> 주문상태로 변경 (환불가능)
		// 14일 후 환불 불가

		// 만약 7일 지났다면에 14일이 자났다면 체크
		if (!list.isEmpty()) {
			model.addAttribute("pageMenu", pageMenu);// 하단 페이지 메뉴 바인딩
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return WEB_PATH + "orderlist.jsp";
	}

	// 취소/교환 반품조회
	@RequestMapping("cancellist.do")
	public String cancelList(String page, Model model) {
		String id = (String) session.getAttribute("id");

		// user_dao.cancellist(map);
		List<DeliveryVO> list = userService.pagging1(id, page, "cancellist.do");
		System.out.println(list);

		// 페이징 처리메뉴
		String pageMenu = userService.pagging2(id, "cancellist.do");

		if (!list.isEmpty()) {
			model.addAttribute("pageMenu", pageMenu);// 하단 페이지 메뉴 바인딩
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return WEB_PATH + "cancellist.jsp";
	}

	@RequestMapping("openMyPage.do")
	public String openMyPage_form(Model model, String orderId) {
		System.out.println(orderId + " : orderid");

		List<OrderItemDTO> orderitemlist = user_dao.orderitemlist(orderId);

		System.out.println(orderitemlist);

		DeliveryVO orderlist = user_dao.orderSelectOne(orderId);

		List<OrderItemDTO> ords = new ArrayList<>();
		for (OrderItemDTO oit : orderitemlist) {
			oit.initSaleTotal();
			ords.add(oit);
		}

		orderlist.setOrders(ords);
		orderlist.getOrderPriceInfo();
		System.out.println(orderlist);

		model.addAttribute("item", orderitemlist);
		model.addAttribute("order", orderlist);

		return WEB_PATH + "openMyPage.jsp";
	}

	@RequestMapping("payback.do")
	@ResponseBody
	public String refundone(DeliveryVO vo,@RequestParam("url") String url) {

		String id = (String) session.getAttribute("id");
		UserVO user = userService.selectOne(id);
		
		String res =  userService.payback(vo.getOrderId(), id, url);
		
		
		System.out.println(vo.getShopPoint());
		

		HttpSession session = request.getSession(); // 세션영역을 가져온다
		session.setAttribute("point", user.getShopPoint());
		session.setAttribute("money", user.getMoney());
		System.out.println(res + "결과");
		return res;
	}
	

	@RequestMapping("chargePoint.do")
	@ResponseBody
	public String charge(int amount) {
		String id = (String) session.getAttribute("id");
		
		UserVO vo = new UserVO();
		
		
		vo.setId(id);
		vo.setAccount(amount);
		
		System.out.println(amount+"돈돈돈돈");
		

		System.out.println(vo.getAccount() + "충고");
		
		int res = user_dao.insert_pay(vo);
		System.out.println(res);
		
		UserVO user = userService.selectOne(id);

		System.out.println(res + "카카오페이");
		System.out.println(amount+"돈 - 해수");
		
		HttpSession session = request.getSession(); // 세션영역을 가져온다
		session.setAttribute("money", user.getMoney());

		String str = "no";// 안됨

		if (res == 1) {
			str = "yes";// 됨
		}

		return str;
	}

	

	// 아이디 찾기_이동
	@RequestMapping("search_id.do")
	public String id_form() {
		return WEB_PATH + "search/search.jsp";
	}

	// 아이디 찾기
	@RequestMapping("id.do")
	public String search_id(Model model, String name, String email, String tel) {
		String tel2 = tel.substring(3, 7);
		String tel3 = tel.substring(tel.length() - 4, tel.length());

		UserVO vo = user_dao.selectOne_search(name);
		model.addAttribute("msg", "이름, 이메일, 전화번를 올바르게 입력하세요");
		model.addAttribute("url", "search_id.do");

		if (vo == null) {
			return WEB_PATH + "include_user/redirect.jsp";
		}

		if (vo.getEmail().equals(email) && vo.getTel2().equals(tel2) && vo.getTel3().equals(tel3)) {
			model.addAttribute("vo", vo);
			return WEB_PATH + "search/user_id.jsp";
		}

		return WEB_PATH + "include_user/redirect.jsp";
	}

	// 비밀번호 찾기_이동
	@RequestMapping("search_pwd.do")
	public String pwd_form() {
		return WEB_PATH + "search/search_pwd.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("pwd.do")
	public String search_pwd(Model model, String id, String name, String email) {

		UserVO vo = user_dao.selectOne_search(name);
		model.addAttribute("msg", "아이디, 이름, 이메일을 올바르게 입력하세요");
		model.addAttribute("url", "search/search_pwd.do");

		if (vo == null) {
			return WEB_PATH + "include_user/redirect.jsp";
		}

		if (vo.getId().equals(id) && vo.getEmail().equals(email)) {
			model.addAttribute("vo", vo);
			return WEB_PATH + "search/user_pwd.jsp";
		}

		return WEB_PATH + "include_user/redirect.jsp";
	}

	// -------------------------------------------------------------------------------------------------------
	// 마이 유저
	@RequestMapping("charge.do")
	public String charge_form() {
		return WEB_PATH + "/mypage/charge_form.jsp";
	}

	// 회원정보 수정 사이트 이동
	@RequestMapping("adjust_form.do")
	public String adjust_form() {
		return WEB_PATH + "/mypage/adjust_form2.jsp";
	}

	// 회원정보 수정
	@RequestMapping("adjust.do")
	public String adjust(Model model, UserVO vo) {
		int res = user_dao.adjust(vo);

		if (res == 0) {
			model.addAttribute("msg", "수정실패, 관리자에게 문의하세요");
			model.addAttribute("url", "adjust_form.do");
		} else {
			model.addAttribute("msg", "수정완료");
			model.addAttribute("url", "main.do");
		}

		HttpSession session = request.getSession(); // 세션영역을 가져온다
		session.setAttribute("id", vo.getId());
		session.setAttribute("pwd", vo.getPwd());
		session.setAttribute("name", vo.getName());
		session.setAttribute("nickname", vo.getNickname());
		session.setAttribute("postcode", vo.getPostcode());
		session.setAttribute("addr1", vo.getAddress1());
		session.setAttribute("addr2", vo.getAddress2());
		session.setAttribute("email", vo.getEmail());
		session.setAttribute("tel1", vo.getTel1());
		session.setAttribute("tel2", vo.getTel2());
		session.setAttribute("tel3", vo.getTel3());
		session.setAttribute("gender", vo.getGender());
		session.setAttribute("jumin1", vo.getJumin1());
		session.setAttribute("jumin2", vo.getJumin2());
		session.setAttribute("point", vo.getShopPoint());
		session.setAttribute("money", vo.getMoney());

		session.setMaxInactiveInterval(60 * 60);// 세션 유지시간을 1시간으로 설정

		return WEB_PATH + "include_user/redirect.jsp";
	}

	// 비밀번호 체크 사이트 이동
	@RequestMapping("adjust_check_form.do")
	public String adjust_check_form() {
		return WEB_PATH + "/mypage/adjust_check_form.jsp";
	}

	// 비밀번호 체크
	@RequestMapping("adjust_pwd_check.do")
	@ResponseBody
	public String pwd_check(String pwd) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		UserVO vo = user_dao.selectOne(id);
		String str = "no";

		if (vo == null) {
			return str;
		}

		System.out.println(vo.getPwd());
		System.out.println(pwd);

		// 이름 체크
		if (pwd.equals(vo.getPwd())) {
			str = "yes";
		}

		return str;
	}

	// 비밀번호 수정 사이트 이동
	@RequestMapping("adjust_pwd_form.do")
	public String adjust_pwd_form() {
		return WEB_PATH + "/mypage/adjust_pwd_form.jsp";
	}

	// 비밀번호 변경
	@RequestMapping("adjust_pwd.do")
	public String pwd_adjust(Model model, UserVO vo) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		int res = user_dao.adjust_pwd(vo);

		if (res == 0) {
			model.addAttribute("msg", "변경실패, 관리자에게 문의하세요");
			model.addAttribute("url", "adjust_pwd_form.do");
		} else {
			model.addAttribute("msg", "변경완료");
			model.addAttribute("url", "main.do");
		}

		return WEB_PATH + "include_user/redirect.jsp";
	}

	// 회원탈퇴 사이트 이동
	@RequestMapping("delete_check_form.do")
	public String check_form() {
		return WEB_PATH + "/mypage/delete_check_form.jsp";
	}

	// 회원탈퇴_비밀번호 체크
	@RequestMapping("delete_check.do")
	@ResponseBody
	public String pwd_check2(String id, String pwd) {
		UserVO vo = user_dao.selectOne(id);
		String str = "no";

		if (vo == null) {
			return str;
		}

		// 이름 체크
		if (pwd.equals(vo.getPwd()) && id.equals(vo.getId())) {
			str = "yes";
		}

		return str;
	}

	// 회원탈퇴 사이트 이동
	@RequestMapping("delete_form.do")
	public String delete_form() {
		return WEB_PATH + "/mypage/delete.jsp";
	}

	// 회원탈퇴
	@RequestMapping("delete.do")
	public String delete(Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		int res = user_dao.delete(id);

		if (res == 0) {
			model.addAttribute("msg", "탈퇴실패, 관리자에게 문의하세요");
			model.addAttribute("url", "delete_form.do");
		} else {
			model.addAttribute("msg", "탈퇴완료");
			model.addAttribute("url", "logout.do");
		}

		return WEB_PATH + "include_user/redirect.jsp";
	}

	// main
	@RequestMapping("/mainpage.do")
	public String mainpage() {
		return WEB_PATH + "main.jsp";
	}

//	DB insert
	@RequestMapping("insertbook.do")
	public String insertbook() throws ParserConfigurationException, SAXException, IOException {
		String name = "https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbjacomyou10262248001&QueryType=ItemNewAll&MaxResults=25&start=1&SearchTarget=Book&output=xml&Version=20131101&CategoryId=51300";
		StringBuilder urlBuilder = new StringBuilder(name);
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder();
		Document doc = builder.parse(urlBuilder.toString());

		System.setProperty("https.protocols", "TLSv1.2");
		doc.normalize();
		// author,pudate,er,price,intro,stock,img,
		NodeList bookitem = doc.getElementsByTagName("item");
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < bookitem.getLength(); i++) {
			NodeList childNodes = bookitem.item(i).getChildNodes();
			for (int j = 0; j < childNodes.getLength(); j++) {
				switch (childNodes.item(j).getNodeName()) {
				case "author":
				case "title":
				case "pubDate":
				case "publisher":
				case "priceStandard":
				case "description":
				case "cover":
					// System.out.println(childNodes.item(j).getNodeName() + "-" +
					// childNodes.item(j).getTextContent());
					map.put(childNodes.item(j).getNodeName(), childNodes.item(j).getTextContent());
				}
			}
			System.out.println("map" + map.get("author") + "/" + map.get("pubDate") + "/" + map.get("publisher"));
			int res = user_dao.insertDB(map);
			System.out.println(res);
			// map.clear();
		}
		map.clear();

		return "redirect:main";
	}

}
