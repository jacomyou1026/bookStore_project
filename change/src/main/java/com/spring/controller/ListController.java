package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ReviewDAO;
import service.BookService;
import vo.BookVO;
import vo.PageCreator;
import vo.SearchVO;
	
@Controller
public class ListController {

	BookService service;
	
	ReviewDAO review_dao;
	
	public void setService(BookService service) {
		this.service = service;
	}
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	static final String WEB_PATH = "/WEB-INF/views/";
	
	//국내 도서 리스트
	@RequestMapping(value = "bookList/bookList1", method = RequestMethod.GET)
	public String bookList1(SearchVO search, @RequestParam("c") int categoryNum,@RequestParam("t") int tier,Model model) throws Exception{


			
			if(tier==1) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			
			}
			
			if(tier==2) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			System.out.println("booklist1의 tier 2 pc" + pc);
			System.out.println("booklist1의 tier 2 list" + list);
			
			}

			if(tier==3) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			System.out.println("booklist1의 tier 3 pc" + pc);
			System.out.println("booklist1의 tier 3 list" + list);
			
			}
			
			  return WEB_PATH +"bookList/bookList1.jsp";
			
			
	}


	
	// 외국 도서 리스트
	@RequestMapping(value = "bookList/bookList2", method = RequestMethod.GET)
	public String bookList2(SearchVO search, @RequestParam("c") int categoryNum,@RequestParam("t") int tier,Model model) throws Exception{


			
			if(tier==1) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			System.out.println(pc);
			
			}
			
			if(tier==2) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			System.out.println(pc);
			
			}

			if(tier==3) {
			List<BookVO> list = service.list(categoryNum,tier,search);
			model.addAttribute("list", list);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			System.out.println(pc);
			
			}
			
			  return WEB_PATH +"/bookList/bookList2.jsp";
			
			
	}
	// 신간 도서
	@RequestMapping(value = "/bookListNew", method = RequestMethod.GET)
	public String bookListNew(SearchVO search, @RequestParam("c") int categoryNum,@RequestParam("t") int tier,Model model) throws Exception{

		if(tier==1) {
		List<BookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		
		}
		
		if(tier==2) {
		List<BookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		}

		if(tier==3) {
		List<BookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		}
		
		
		
		  return WEB_PATH +"/bookList/bookListNew.jsp";	
	
			
			
	}	
	
	
	
	// 베스트셀러
	@RequestMapping(value = "/bookListBest", method = RequestMethod.GET)
	public String bookListBest(SearchVO search, @RequestParam("c") int categoryNum,@RequestParam("t") int tier,Model model) throws Exception{

		if(tier==1) {
			List<BookVO> list_best = service.list_best(categoryNum,tier,search);
			model.addAttribute("list", list_best);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count_best(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			
			}
			
			if(tier==2) {
			List<BookVO> list_best = service.list_best(categoryNum,tier,search);
			model.addAttribute("list", list_best);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count_best(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			
			}

			if(tier==3) {
			List<BookVO> list_best = service.list_best(categoryNum,tier,search);
			model.addAttribute("list", list_best);


			PageCreator pc = new PageCreator();
			pc.setPaging(search);
			pc.setTotalCount(service.Count_best(categoryNum, tier, search));
			model.addAttribute("pc", pc);
			
			}
			
		
		  return WEB_PATH +"/bookList/bookListBest.jsp";
			
			
	}
	
	
	// 검색리스트
	@RequestMapping(value = "/bookListSearch", method = RequestMethod.GET)
	public String bookListSearch(SearchVO search,Model model) throws Exception{
		
		List<BookVO> list = service.ListAll(search);
		model.addAttribute("list", list);
		
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.CountAll(search));
		model.addAttribute("pc", pc);
		System.out.println(pc);
		
		
		return WEB_PATH +"/bookList/bookListSearch.jsp";		
		
		
	}
	
	
	//메인화면
	@RequestMapping(value = {"/main","/"} , method = RequestMethod.GET )
	public String bookListSearchMain(SearchVO search,Model model) throws Exception{

		List<BookVO> list = service.ListAll(search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.CountAll(search));
		model.addAttribute("pc", pc);
		
		  return WEB_PATH +"main.jsp";			
			
			
	}


		
	
	
	// api 삽입
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() throws Exception{
		
		return WEB_PATH +"/api_register/write.jsp";
	}
	
	// api 삽입
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BookVO bookVO) throws Exception{
		
		service.insert_api(bookVO);
		return "redirect:/write";
	}
		
	
	
	
	
}
