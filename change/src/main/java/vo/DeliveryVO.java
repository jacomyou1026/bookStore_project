package vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class DeliveryVO {
	/* 주문 번호 */
	private String orderId;
	
	private int deliverytel1,deliverytel2,deliverytel3;
	
	private int bookcnt;
	
	
	private Date passdate;
	
	private int shopnum;

	
	//savePoint;
	private int savePoint;
	
	//usePoint	
	private int usePoint;
	
	/* 배송 받는이 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String id;
	
	/* 우편번호 */
	private String memberAddr1;
	
	/* 회원 주소 */
	private String memberAddr2;
	
	/* 회원 상세주소 */
	private String memberAddr3;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;	
	
	/* 배송비 */
	private int deliveryCost;
	
	/* 사용 포인트 */
	private int shopPoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이a터 */
	
	/* 판매가(모든 상품 비용) */
	private int orderSalePrice;
	
	/* 적립 포인트 */
	private int orderSavePoint;
	
	/* 최종 판매 비용 */
	private int orderFinalSalePrice;
	
    
	


	@Override
	public String toString() {
		return "DeliveryVO [orderId=" + orderId + ", deliverytel1=" + deliverytel1 + ", deliverytel2=" + deliverytel2
				+ ", deliverytel3=" + deliverytel3 + ", bookcnt=" + bookcnt + ", savePoint=" + savePoint + ", usePoint="
				+ usePoint + ", addressee=" + addressee + ", id=" + id + ", memberAddr1=" + memberAddr1
				+ ", memberAddr2=" + memberAddr2 + ", memberAddr3=" + memberAddr3 + ", orderState=" + orderState
				+ ", orders=" + orders + ", deliveryCost=" + deliveryCost + ", shopPoint=" + shopPoint + ", orderDate="
				+ orderDate + ", orderSalePrice=" + orderSalePrice + ", orderSavePoint=" + orderSavePoint
				+ ", orderFinalSalePrice=" + orderFinalSalePrice + "]";
	}
	
	public void getOrderPriceInfo() {
//		상품금액
			for(OrderItemDTO order : orders) {
				orderSalePrice += order.getTotalPrice();
			}
		/* 배송비용 */
			if(orderSalePrice >= 30000) {
				deliveryCost = 0;
			} else {
				deliveryCost = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderSalePrice + deliveryCost- usePoint;
			
			//최종 비용에서 빼기
			orderSavePoint = (int) (orderFinalSalePrice*0.1);
			
			
	}

	
	
	
	
	
	
	
}
