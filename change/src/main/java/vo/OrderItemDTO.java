package vo;

import java.util.Date;

public class OrderItemDTO {
	
	private String orderId;
	
	/* 상품 번호 */
    private int booknum;
    
   
	/* 주문 수량 */
    private int bookcnt;
    
	/* vam_orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int price;
    
	/* 상품 할인 율 */
    private double bookDiscount;
    
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
//    장바구니 삭제
    private int shopnum;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;
    
    

    

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}



	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	private String author;
    private Date publishdate;
    private String publisher;
	private String subject;
	
	

    
    


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	

	

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}

	public int getBookcnt() {
		return bookcnt;
	}

	public void setBookcnt(int bookcnt) {
		this.bookcnt = bookcnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getBookDiscount() {
		return bookDiscount;
	}

	public void setBookDiscount(double bookDiscount) {
		this.bookDiscount = bookDiscount;
	}



	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getShopnum() {
		return shopnum;
	}

	public void setShopnum(int shopnum) {
		this.shopnum = shopnum;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}

	@Override
	public String toString() {
		return "OrderItemDTO [orderId=" + orderId + ", booknum=" + booknum + ", bookcnt=" + bookcnt + ", orderItemId="
				+ orderItemId + ", price=" + price + ", bookDiscount=" + bookDiscount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", shopnum=" + shopnum + ", totalSavePoint=" + totalSavePoint
				+ ", author=" + author + ", publishdate=" + publishdate + ", publisher=" + publisher + ", subject="
				+ subject + "]";
	}
	
	
	
	public void initSaleTotal() {
		totalPrice = (int) (bookcnt * (price * 0.9));
	}
 


    
    
    

	
	
	
}
