package vo;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat; 
public class BookVO{

	
	private int bookNum;
	private String subject;
	private String author;
	private Date publishDate;
	private String publisher;
	private int price;
	private String intro;
	private String img;
	private int stock;
	private int bestCk;
	
	
	private int tier;
	private String cateName;
	private int categoryNum;
	private int cateParent;
	
	
	//신규 게시물에 new마크를 붙일지 말지 결정하는 논리필드 선언.
	private boolean newMark;
	
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	
	public boolean isNewMark() {
		return newMark;
	}
	
	public int getBestCk() {
		return bestCk;
	}

	public void setBestCk(int bestCk) {
		this.bestCk = bestCk;
	}

	public int getTier() {
		return tier;
	}
	public void setTier(int tier) {
		this.tier = tier;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public int getCateParent() {
		return cateParent;
	}
	public void setCateParent(int cateParent) {
		this.cateParent = cateParent;
	}

	@Override
	public String toString() {
		return "BookVO [bookNum=" + bookNum + ", subject=" + subject + ", author=" + author + ", publishDate="
				+ publishDate + ", publisher=" + publisher + ", price=" + price + ", intro=" + intro + ", img=" + img
				+ ", stock=" + stock + ", bestCk=" + bestCk + ", tier=" + tier + ", cateName=" + cateName
				+ ", categoryNum=" + categoryNum + ", cateParent=" + cateParent + ", newMark=" + newMark + "]";
	}


	
	
	
	
	
	
	
	
	
	
}
