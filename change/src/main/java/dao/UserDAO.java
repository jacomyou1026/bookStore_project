package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Criteria;
import vo.DeliveryVO;
import vo.OrderItemDTO;
import vo.UserVO;

public class UserDAO{
	
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.user_insert", vo);
		return res;
	}
	
	//로그인	
	 public UserVO selectOne(String id) { 
		 UserVO vo = sqlSession.selectOne("u.user_login", id); 
		 
		 return vo; 
	 }
	 
	 //유저목록
	 public List<UserVO> selectList(String name, String email, String tel){
			List<UserVO> list = sqlSession.selectList("u.user_list");
			
			return list;
		}
	 
	 //아이디 찾기, 회원가입 유무
	 public UserVO selectOne_search(String name) { 
		 UserVO vo = sqlSession.selectOne("u.user_search", name); 
		 
		 return vo; 
	 }
	 
	 //회원정보 수정
	 public int adjust(UserVO vo) {
		int res = sqlSession.update("u.user_update", vo);
			
		return res;
	 }
	 
	 //비밀번호 변경
	 public int adjust_pwd(UserVO vo) {
		int res = sqlSession.update("u.user_adjust", vo);
			
		return res;
	 }

	 //회원탈퇴
	 public int delete(String id) {
			int res = sqlSession.delete("u.delete", id);
			
			return res;
		}
		 
		
		//카카오페이 적립
		public int insert_pay(UserVO vo) {
			
			int res= sqlSession.update("u.updateMoney", vo);
			System.out.println(res+"일");
			return res;
				
		}
		
		//유저목록
		 public List<DeliveryVO> selectdelivery(String id){
				List<DeliveryVO> list = sqlSession.selectList("u.Delivery",id);
				return list;
			}

		 //게시판목록(페이징적용)
		public List<DeliveryVO> getListPaging(Criteria c) {
			List<DeliveryVO>  list = sqlSession.selectList("u.getListPaging",c);
			return list;
		}

		public int rowTotal() {
			int res = sqlSession.selectOne("u.board_count");
			return res;
		}

		public List<DeliveryVO> select(HashMap map) {
			List<DeliveryVO> list = sqlSession.selectList("u.board_list",map);
			return  list;
		}
//실행 못했음...
		public List<OrderItemDTO> itemselectList(String itemid) {
			List<OrderItemDTO> res = sqlSession.selectList("u.itemselectlist",itemid); 
			return res;
		}

		public List<OrderItemDTO> orderitemlist(String orderid) {
			List<OrderItemDTO> res = sqlSession.selectList("u.orderitemlist",orderid); 
			return res;
		}

		public DeliveryVO orderSelectOne(String orderid) {
			DeliveryVO res = sqlSession.selectOne("u.orderSelectOne", orderid);
			return res;
		}

		public int salpayupdate(DeliveryVO orderlist) {
			int res = sqlSession.update("u.salepayupdate",orderlist);
			return res;
		}

		public int getpointupdate(DeliveryVO orderlist) {
			int res = sqlSession.update("u.getpointudate",orderlist);
			return res;
		}

		public int paybacks(DeliveryVO orderlist) {
			int res = sqlSession.update("u.paybacks",orderlist);
			return res;
		}

		public int cancelupdate(DeliveryVO orderlist) {
			int res = sqlSession.update("u.cancelupdate",orderlist);
			return res;
		}
		
		//7일 후
		public int ordersuescces(String orderid) {
			int res = sqlSession.update("u.ordersuescces", orderid);
			return res;
		}
		 
		//14일 후(구매 확정)
		public int norefund(String orderid) {
			int res = sqlSession.update("u.norefund", orderid);
			return res;
		}
		
		
		
		
		
		
}
