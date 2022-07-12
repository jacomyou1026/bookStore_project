package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BookPurchaseVO;
import vo.DeliveryVO;
import vo.OrderVO;
import vo.UserVO;

public class BookPurchaseDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
//	book table +  table (join) +구매
	public List<OrderVO> selectlist(String id) {
		List<OrderVO> list= sqlSession.selectList("parchase.order_list1",id);
		return list;

	}
	
//	book table +  +purchase table(join)
//	public List<OrderVO> purchaselist(String id) {
//		List<OrderVO> list= sqlSession.selectList("parchase.purchaselist",id);
//		
//		return list;
//		
//	}
	
	
	//totalprice
	public int totalPrice(String id) {
		int totalprice= sqlSession.selectOne("parchase.totalPrice",id);
		
		return totalprice;

	}
	
	//purchase 테이븍바로구매-구매
	public int inserpurchase(OrderVO vo) {
		int inserpurchase= sqlSession.insert("parchase.inserpurchase",vo);
		return inserpurchase;
	}
	
	
	//purchase 주소(기본 배송지)
	public int delivery(DeliveryVO updatevo1) {
		int delivery= sqlSession.insert("parchase.delivery",updatevo1);
		return delivery;
	}
	
	//변경후 주소
	public int updatedeliverys(DeliveryVO vo1) {
		int updatedelivery= sqlSession.insert("parchase.updatedeliverys",vo1);
		System.out.println(updatedelivery+"변경 후");
		return updatedelivery;
	}
	
	//장바구니 삭제
	public int delshoppingCart(int shopnum) {
		int delshoppingCart= sqlSession.insert("parchase.delshoppingCart",shopnum);
		return delshoppingCart;
	}

	
	//장바구니로 이동시 purchasetable 삭제
	public int delppurchse(String id) {
		int delgoshoppurchse= sqlSession.delete("parchase.delgoshoppurchse",id);
		
		return delgoshoppurchse;
	}
	
	//총 주문 개수 
		public int totalcnt(String id) {
			int cnt= sqlSession.selectOne("parchase.totalcnt",id);
			return cnt;
		}
		
	//기존배송지와 이외 배송지 구분을 초기화
	public int initdeliverysep(String id) {
		int initdeliverysep = sqlSession.update("parchase.initdeliverysep",id);
		return initdeliverysep;
	}
		


	//총 합(책 전체)
	public int totalpriceSelect() {
		int  totalprice = sqlSession.selectOne("parchase.totalprice");
		return totalprice;
	}
	
	
	
	
	//최종 결제 금액(배송비 제외)--
	public int finalprice() {
		int cnt= sqlSession.selectOne("parchase.finalprice");
		System.out.println(cnt+"cnt");
		return cnt;
	}
	
	//적립
	public int savepoint() {
		int savepoint = sqlSession.selectOne("parchase.savepoint");
		return savepoint ;
	}
	
	//변경된 배송지 추가
	public int insertdelivery(DeliveryVO vo) {
		int delivery = sqlSession.insert("parchase.isnertdelivery",vo);
		return delivery;
	}
	
	//배송지 변경된 것이지 구분
	public int updatedeliverysep(String id) {
		int updateDeliveryNum = sqlSession.update("parchase.updatedeliverysep",id);
		return updateDeliveryNum;
	}
	
	//사용자 포인트 - 상품금액 업데이트(사용자 포인트가 더 클경우)
	public int bigshoppingpoint(OrderVO vo) {
		int delshoppingCart= sqlSession.update("parchase.bigshoppingpoint",vo);
		
		return delshoppingCart;
	}
	
	
	//적립
	public int UpdateShoppingPoing(OrderVO vo) {
		int UpdateShoppingPoing = sqlSession.update("parchase.UpdateShoppingPoing",vo);
		return UpdateShoppingPoing;
	}
	
	//money_update
	public int UpdateMoney(OrderVO vo) {
		int UpdateMoney = sqlSession.update("parchase.UpdateMoney",vo);
		return UpdateMoney;
	}
	

	//바로구매 1개 구매
	public OrderVO bookone(OrderVO vo) {
		OrderVO bookone= sqlSession.selectOne("parchase.bookone",vo);
		return bookone;
	}
	
	
	
	
	
	
}
