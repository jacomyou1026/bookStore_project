package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDAO;
import util.Common;
import util.PagingUser;
import vo.DeliveryVO;
import vo.OrderItemDTO;
import vo.UserVO;


public class UserServiceImpl implements UserService {
	@Autowired
	HttpServletRequest request;


	UserDAO dao;
	UserVO user ;

	public UserServiceImpl(UserDAO dao) {
		this.dao = dao;
	}

	int nowPage = 1;
	List<DeliveryVO> list;

	public List<DeliveryVO> pagging1(String id, String page, String url) {

		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);

		}

		int start = (nowPage - 1) * Common.Notice.BLOCKLIST + 1;
		int end = start + Common.Notice.BLOCKLIST - 1;

		System.out.println(start + " : staty");
		System.out.println(end + " : end");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("s", start);
		map.put("e", end);
		map.put("id", id);

		if (url.equals("orderlist.do")) {
			list = dao.select(map);
			update_date();
		} else if (url.equals("cancellist.do")) {
			list = dao.cancellist(map);
		}
		return list;
	}

	public String pagging2(String id, String url) {
		int row_total = 0;
		if (url.equals("orderlist.do")) {
			row_total = dao.rowTotal(id);
		} else if (url.equals("cancellist.do")) {
			row_total = dao.cacellistrowTotal(id);
		}

		System.out.println(row_total + "row_total");

		String pageMenu = PagingUser.getPaging(url, // 호출되는 페이지url
				nowPage, // 현재 페이지 번호
				row_total, // 전체 게시물 수
				Common.Notice.BLOCKLIST, // 한페이지에 몇개 보여줄지
				Common.Notice.BLOCKPAGE);
		return pageMenu;
	}
	
	
	@Override
	public UserVO selectOne(String id) {
		user = dao.selectOne(id);
		return user;
	}

	
	@Override
	public String payback(String orderId, String id, String url) {

		List<OrderItemDTO> orderitemlist = dao.orderitemlist(orderId);

		System.out.println(orderitemlist);

		DeliveryVO orderlist = dao.orderSelectOne(orderId);

		orderlist.setId(id);

		List<OrderItemDTO> ords = new ArrayList<>();
		for (OrderItemDTO oit : orderitemlist) {
			oit.initSaleTotal();
			ords.add(oit);
		}

		System.out.println(orderlist.getAddressee());

		orderlist.setOrders(ords);
		orderlist.getOrderPriceInfo();

		System.out.println("해수- orderlist : " + orderlist);
		
		System.out.println(orderlist.getShopPoint());

		String res = "no";

		
		//주문취소
		if (url.equals("refund")) {

			// 사용포인트 회수/복구
			int salepay = dao.salpayupdate(orderlist);
			System.out.println(salepay+"salepay - 해수");
			
			
			System.out.println(user.getShopPoint()+" - 해수 샵포인트");
			
			// 만약 포인트가 음수라면 포인트 0으로 변경
			if (user.getShopPoint() < 0) {
				int zeroPoint = dao.updaetzero(orderlist);
			}
			
			
			System.out.println(salepay);

			System.out.println(orderlist.getId() + " : id");

			// 상태정보 '주문취소'로 바뀌
			int cancelupdate = dao.cancelupdate(orderlist);
			System.out.println(cancelupdate);

			// 주문 금액 교보코인에 화불
			int paybacks = dao.paybacks(orderlist);
			System.out.println(paybacks);
			if (salepay == 1 && paybacks == 1 && cancelupdate == 1) {
						res= "Yes";
			}
			
			//반품취소
		}else if(url.equals("cancelreq")) {
			orderlist.setId(id);
			
			System.out.println(orderlist.getOrderFinalSalePrice());
			//돈이 적을 경우
			if(user.getMoney()<orderlist.getOrderFinalSalePrice()) {
							res= "no";
			}
			

			int cancelPoint = dao.cancelPoint(orderlist);
			
			// 만약 포인트가 음수라면 포인트 0으로 변경
			if (user.getShopPoint() < 0) {
				int zeroPoint = dao.updaetzero(orderlist);
			}
			
			// 상태정보 '반품취소'로 바뀌
			int returncacel = dao.returnUpdate(orderlist);

			// money=money - #{paybackMoney}(salebook+delivery)
			int returnmoney = dao.returnmoney(orderlist);
			
			System.out.println(orderlist.getPaybackMoney()+"페이백 머니다");
			
			
			if (returncacel == 1 && returnmoney == 1 && cancelPoint == 1) {
				res="Yes";
			}
			
			
		}


		return res;
	}
	
	

	// 메소드
	void update_date() {
		for (int i = 0; i < list.size(); i++) {
			String orderid = list.get(i).getOrderId();
			if (list.get(i).getOrderState().equals("배송준비") || list.get(i).getOrderState().equals("주문완료")|| list.get(i).getOrderState().equals("반품취소")) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				// 구하려는 값
				java.util.Date d1 = new java.util.Date();
				// 7일 후
				java.util.Date d2 = new java.util.Date(list.get(i).getOrderDate().getTime() + 7 * 1000 * 60 * 60 * 24);
				// 14일 후
				java.util.Date d3 = new java.util.Date(list.get(i).getOrderDate().getTime() + 14 * 1000 * 60 * 60 * 24);

				String order = sdf.format(d1);
				String seven = sdf.format(d2);
				String forth = sdf.format(d3);

				if (d2.before(d1)) {
					if (d3.before(d1)) {
						// 14일 지났으면--환불불가
						int norefund = dao.norefund(list.get(i).getOrderId());
					} else {
						// 7일 지났으면--배송완료(환불가능)
						int ordersuescces = dao.ordersuescces(list.get(i).getOrderId());
					}
				}

			}
		}

	}


}
