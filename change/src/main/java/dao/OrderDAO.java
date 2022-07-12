package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DeliveryVO;
import vo.OrderItemDTO;
import vo.OrderVO;

public class OrderDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public List<OrderItemDTO> Onebookinfo(int num){
		List<OrderItemDTO> orderinfo = sqlSession.selectList("parchase.onebookInfo",num);
		return orderinfo;
		
	}
	
	public OrderItemDTO getOrderinfo(int num ) {
		OrderItemDTO orderinfo = sqlSession.selectOne("parchase.getOrderinfo",num);
		return orderinfo;
	}
			
	
	public int insertorder(DeliveryVO vo) {
		int res = sqlSession.insert("parchase.enrollOrder",vo);
		return res;
	}
	
	public int insertItem(OrderItemDTO vo) {
		int res = sqlSession.insert("parchase.enrollOrderItem",vo);
		return res;
	}
	
	
	//적립 넣기
	public int savePoint(DeliveryVO vo) {
		int res = sqlSession.update("parchase.savepoint",vo);
		return res;
	}
	
	//체크박스 삭제
	public int deleteShop(int vo) {
		int res = sqlSession.delete("parchase.deleteShopnum",vo);
		return res;
	}
	
	public OrderItemDTO onebookcnt(String id) {
		OrderItemDTO res = sqlSession.selectOne("parchase.oneboocnt",id);
		return res;
		
	}


	public int buybook(DeliveryVO vo) {
		
		int res = sqlSession.update("parchase.buybook", vo);
		return res;
	}


	public int usePoint(DeliveryVO delivert_vo) {
		
		int res = sqlSession.update("parchase.usePoint", delivert_vo);
		return res;

	}
	
	
	//주문하기
	public OrderVO findbook(int ord) {
		OrderVO goOrder= sqlSession.selectOne("shopping.findbook",ord);
		return goOrder;
		
	}

	
	
	
	
}
