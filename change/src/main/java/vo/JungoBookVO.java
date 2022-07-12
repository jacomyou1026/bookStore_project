package vo;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat; 
public class JungoBookVO{

	
	private int JbookNum;
	private String Jsubject;
	private String Jauthor;
	private Date JpublishDate;
	private String Jpublisher;
	private int Jprice;
	private String Jintro;
	private String Jimg;
	private int Jstock;
	
	private String id;
	
	private int tier;
	private String cateName;
	private int categoryNum;
	private int cateParent;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getJbookNum() {
		return JbookNum;
	}
	public void setJbookNum(int jbookNum) {
		JbookNum = jbookNum;
	}
	public String getJsubject() {
		return Jsubject;
	}
	public void setJsubject(String jsubject) {
		Jsubject = jsubject;
	}
	public String getJauthor() {
		return Jauthor;
	}
	public void setJauthor(String jauthor) {
		Jauthor = jauthor;
	}
	public Date getJpublishDate() {
		return JpublishDate;
	}
	public void setJpublishDate(Date jpublishDate) {
		JpublishDate = jpublishDate;
	}
	public String getJpublisher() {
		return Jpublisher;
	}
	public void setJpublisher(String jpublisher) {
		Jpublisher = jpublisher;
	}
	public int getJprice() {
		return Jprice;
	}
	public void setJprice(int jprice) {
		Jprice = jprice;
	}
	public String getJintro() {
		return Jintro;
	}
	public void setJintro(String jintro) {
		Jintro = jintro;
	}
	public String getJimg() {
		return Jimg;
	}
	public void setJimg(String jimg) {
		Jimg = jimg;
	}
	public int getJstock() {
		return Jstock;
	}
	public void setJstock(int jstock) {
		Jstock = jstock;
	}
	public int getTier() {
		return tier;
	}
	public void setTier(int tier) {
		this.tier = tier;
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
		return "JungoBookVO [JbookNum=" + JbookNum + ", Jsubject=" + Jsubject + ", Jauthor=" + Jauthor
				+ ", JpublishDate=" + JpublishDate + ", Jpublisher=" + Jpublisher + ", Jprice=" + Jprice + ", Jintro="
				+ Jintro + ", Jimg=" + Jimg + ", Jstock=" + Jstock + ", id=" + id + ", tier=" + tier + ", cateName="
				+ cateName + ", categoryNum=" + categoryNum + ", cateParent=" + cateParent + "]";
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
}
