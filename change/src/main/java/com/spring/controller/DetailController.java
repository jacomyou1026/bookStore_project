package com.spring.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.KeySelector.Purpose;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BookDAO;
import dao.ReviewDAO;
import util.Common;
import util.Paging;
import vo.BookVO;
import vo.ReviewVO;

@Controller
public class DetailController {

	@Autowired
	ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	ReviewDAO review_dao;
	BookDAO book_dao;
//	BookPurchaseDAO bookPurchase_dao;
	
	ReviewVO review_vo;
	
	int load_review = 0;
	
	public void setReview_vo(ReviewVO review_vo) {
		this.review_vo = review_vo;
	}
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	public void setBook_dao(BookDAO book_dao) {
		this.book_dao = book_dao;
	}
	
//	public void setBook_purchase_dao(BookPurchaseDAO book_purchase_dao) {
//		this.bookPurchase_dao = book_purchase_dao;
//	}
	
	//책 상세페이지 이동
	@RequestMapping(value = "bookDetail.do")
	public String bookDetail(Model model, String page, Integer num) {
		  
		int nowPage = 1; //기본페이지는 1페이지로
		
		if( page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		//한페이지에 보여줄 게시물의 시작번호와 끝번호를 계산
		//1page는 1 ~ 5번 게시물까지 보여줘야 하고
		//2page는 6 ~ 10번 게시물까지 보여줄 수 있도록 공식을 만든다.
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST-1;
		
		
		//페이지 별 목록 가져오기
		List<ReviewVO> review_list =review_dao.selectList(start,end,num);
		
		//전체 게시물 수 구하기
		int row_total = review_dao.rowTotal(num);
		
		//하단부에 추가될 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("bookDetail.do?num="+num,//호출되는 페이지 url 경로
											nowPage, //현재 페이지 번호
											row_total,//전체 게시물 수
											Common.Board.BLOCKLIST,
											Common.Board.BLOCKPAGE);
		System.out.println("여기까진 들어오나?");
		//해당 책 가져오기
		BookVO book_vo =book_dao.selectListOne(num);
		
		System.out.println("여기는 못들어오지? "+review_list);
		//리뷰평점 구하기
		if(!review_list.isEmpty()) {
			float rating = review_dao.selectAvg(num);
			model.addAttribute("rating",rating);
		}
		System.out.println("평점을 구하나?");
		String webPath = "/resources";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		System.out.println("check>>"+review_list);
		
//		//구매 리뷰만 작성하기위해 해당 책 구매테이블 가져오기
//		List<BookPurchaseVO> purchase_list = bookPurchase_dao.review_list(num);
		
		
		
		model.addAttribute("review_list",review_list);
		model.addAttribute("pageMenu", pageMenu); //하단 페이지 메뉴 바인딩
		model.addAttribute("book_vo",book_vo);
		
		
		/*
		 * //리뷰 입력 후 갱신시 필요한 값 if(load_review!=null) { } else {
		 * session.setAttribute("load_review", "review_session");
		 * 
		 * }
		 */
		
		
		/*
		 * if(load_review==1) { session.setAttribute("show", "yes"); }
		 */
		
		return "WEB-INF/views/bookDetail.jsp";
	}
	
	//리뷰 작성
	@RequestMapping("/review_write.do")
	@ResponseBody
	public String review_write(int bookNum, String id, String content, Integer rating) { //bookNum 받아와야함.. 
		//대댓글일 경우 평점 안받음
		if(rating != null) {
			rating = rating*20;
			review_vo.setRating(rating);
		}
		
		String ip = request.getRemoteAddr();
		review_vo.setIp(ip);
	
		review_vo.setBookNum(bookNum);
		review_vo.setId(id);
		review_vo.setContent(content);
		
		System.out.println("review_write vo check!!!!!>>   "+bookNum);
		
		int res = review_dao.insert(review_vo);
		
		String result="no";
		if(res==1) {
			result = "yes";
		}
		
		
		/*
		 * String show = (String)session.getAttribute("show"); if(show ==null) {
		 * session.setAttribute("show", "review_show"); }
		 */
		request.setAttribute("show", "review_show");
		return result;
	}
	
	//대댓글 작성
		@RequestMapping("/comment_write.do")
		@ResponseBody
		public String comment_write(Integer bookNum, String id, String content, Integer rating, Integer reviewNum) { //bookNum 받아와야함.. 

			
			System.out.println(id);
			System.out.println(content);
			System.out.println(rating);
			System.out.println(reviewNum);
			
			review_vo = new ReviewVO();
			
			//댓글을 달고자 하는 기준글의 idx를 사용하여 정보를 얻어온다
			ReviewVO baseVO = review_dao.selectOne(reviewNum);
			
			//기준글의 step보다 큰 값을 가진 step들을 +1처리 
			review_dao.update_step( baseVO );
			
			//댓글 vo	
			String ip = request.getRemoteAddr();
			review_vo.setIp(ip);
			review_vo.setRef(baseVO.getRef());
			review_vo.setStep(baseVO.getStep()+1);
			review_vo.setDepth(baseVO.getDepth()+1);
		
			review_vo.setBookNum(bookNum);
			review_vo.setId(id);
			review_vo.setContent(content);
			review_vo.setReviewNum(reviewNum);
			review_vo.setRating(0);
			
			System.out.println("대댓글임: "+review_vo.getRating());
			//댓글등록
			int res =review_dao.reply(review_vo);
			
			/*
			 * //대댓글일 경우 평점 안받음 if(rating != null) { rating = rating*20;
			 * review_vo.setRating(rating); }
			 * 
			 * String ip = request.getRemoteAddr(); review_vo.setIp(ip);
			 * review_vo.setPurchaseNum(bookNum); review_vo.setId(id);;
			 * review_vo.setContent(content);
			 * 
			 * System.out.println("vo check!!!!!>>   "+bookNum);
			 * 
			 * int res = review_dao.insert(review_vo);
			 */
			
			String result="no";
			if(res==1) {
				result = "yes";
			}
			return result;
		}
	
	//리뷰 삭제
	@RequestMapping("/review_delete.do")
	@ResponseBody
	public String review_delete(String step, String reviewNum) {
		System.out.println("첫번째 review 들어오긴 하니..?>"+step+ ","+reviewNum);
		
		int step1 = Integer.parseInt(step);
		int reviewNum1 = Integer.parseInt(reviewNum);
		int res = review_dao.delete(step1, reviewNum1);
		String result="no";
		if(res!=0) {
			if(res==1) {
				result = "yes1";
			}
			if(res>1) {
				result = "yes2";
			}
		}
		return result;
	}
  
 
	//리뷰수정
	@RequestMapping("/review_update.do")
	@ResponseBody
	public String review_update(String reviewNum, String update_text) {
		ReviewVO review_vo = new ReviewVO();
		int reviewNum1 = Integer.parseInt(reviewNum);
		
		review_vo.setReviewNum(reviewNum1);
		review_vo.setContent(update_text);
		int res = review_dao.update(review_vo);
		String result="no";
		if(res!=0) {
			if(res==1) {
				result = "yes1";
			}
			if(res>1) {
				result = "yes2";
			}
		}
		return result;
	}
	
	//리뷰 갱신 체크
	@RequestMapping("/review_check.do")
	public String review_check(Integer load_review) {
		if(load_review!=null) {
			return "redirect:bookDetail.do?load_review=1";
		}else {
			return "redirect:bookDetail.do";
		}
	}
	
	//세션 삭제
	@RequestMapping("/session_logout.do")
	public String session_logout() {
		String show = (String)session.getAttribute("show");
		if(show !=null) {
			session.removeAttribute("show");
		}
		
		return "redirect:bookDetail.do";
	}
			
}
