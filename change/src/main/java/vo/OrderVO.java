package vo;

import lombok.Data;

@Data
public class OrderVO {
	
	//purchase
	private int purchaseNum,bookCnt,bookNum,deliverySep;
	private String id,regdate;
	
	
	//book
	private int price,stock,categortnum;
	private String subject,author,publishdate,publisher,intro,img;
	
	

	//user
	private String name, pwd, nickname, gender, address1, tel1, tel2, tel3, address2, email;
	private int jumin1, jumin2, postcode, shopPoint, money ;
	

	private String catename;
	
	
	//shoppingCart
	private int shopnum;
	private String regdate1;
	
	//포인트 추가
	private int point;
	private int totalPoint;
	
	
	//totalprice
	private int totalPrice;
	
	
	
	public void initSaleTotal() {
		this.totalPrice = this.bookCnt* this.price;
		this.point = (int)(Math.floor(this.totalPoint*0.1));
	}
	
	@Override
	public String toString() {
		return " orderVO [id=" + id + ", bookCount=" + bookCnt +", bookNum=" + bookNum+",shopnum="+ shopnum+",price="+price+",subject="+subject+"]";
	
	}

	
	
	
	
}
