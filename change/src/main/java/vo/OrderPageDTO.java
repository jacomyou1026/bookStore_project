package vo;

import java.util.List;

public class OrderPageDTO {
	private List<OrderVO> orders;

	public List<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderVO> orders) {
		this.orders = orders;
	}
	
	
	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
}
