	package com.spring.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import service.JungoBookService;
import service.JungoReplyService;
import utils.UploadFileUtils;
import vo.CategoryVO;
import vo.JungoBookVO;
import vo.JungoReplyVO;
import vo.PageCreator;
import vo.SearchVO;
	
@Controller
public class JungoController {

	JungoBookService service;
	
	JungoReplyService replyservice;
	
	public void setService(JungoBookService service) {
		this.service = service;
	}
	public void setReplyservice(JungoReplyService replyservice) {
		this.replyservice = replyservice;
	}
	
	
	//이미지 업로드
	@Resource(name="uploadPath")
	private String uploadPath;
	
	static final String WEB_PATH = "/WEB-INF/views/";
	
	

	
	//중고 판매자 페이지
	@RequestMapping(value = "/sellerPage", method = RequestMethod.GET)
	public String sellerPage(Model model, @ModelAttribute("search") SearchVO search,@RequestParam("id") String id) throws Exception{

		int uc =service.CountUserJungo(id);
			model.addAttribute("uc", uc);
		
		  return WEB_PATH +"/bookList/jungo/sellerPage.jsp";			
			
			
	}	
	
	
	
	//중고 책 등록하기
	@RequestMapping(value = "/jungoregister", method = RequestMethod.GET)
	public String jungoregister(Model model,@ModelAttribute("search") SearchVO search) throws Exception{

			
		ObjectMapper objm = new ObjectMapper();
		List<CategoryVO> list = service.cateList();
		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
		
		
		  return WEB_PATH +"/bookList/jungo/jungoregister.jsp";			
			
			
	}	
		
	//중고 책 등록하기
	@RequestMapping(value = "/jungoregister", method = RequestMethod.POST)
	public String jungoregister(JungoBookVO book, RedirectAttributes ra,MultipartFile file) throws Exception{

			
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		book.setJimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		
		
		service.JungoBookEnroll(book);
		
		ra.addFlashAttribute("enroll_result", book.getJsubject());
		
		return "redirect:/bookListJungo?c=500000&t=1";
		
			
			
	}	
	
	
	// 중고책 리스트
	@RequestMapping(value = "/bookListJungo", method = RequestMethod.GET)
	public String bookListJungo(@ModelAttribute("search") SearchVO search, @RequestParam("c") int categoryNum,@RequestParam("t") int tier,Model model) throws Exception{

		if(tier==1) {
		List<JungoBookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		
		}
		
		if(tier==2) {
		List<JungoBookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		
		}

		if(tier==3) {
		List<JungoBookVO> list = service.list(categoryNum,tier,search);
		model.addAttribute("list", list);


		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.Count(categoryNum, tier, search));
		model.addAttribute("pc", pc);
		
		}
		
		
		
		  return WEB_PATH +"/bookList/jungo/bookListJungo.jsp";	
	
			
			
	}	
	
	
	//중고책 조회
	@RequestMapping(value="/jungoview",method=RequestMethod.GET)
	public String jungoview(Model model, @RequestParam("JbookNum") int JbookNum,@ModelAttribute("search") SearchVO search) throws Exception{
		
		
		JungoBookVO jungobook = service.jungoview(JbookNum);
		
		model.addAttribute("jungobook", jungobook);
				
		
		ObjectMapper objm = new ObjectMapper();
		List<CategoryVO> list = service.cateList();
		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
		
		
		  return WEB_PATH +"/bookList/jungo/jungoview.jsp";		
		
	}
	
	//중고책 수정
	@RequestMapping(value = "/jungomodify", method=RequestMethod.GET)
	public String jungomodify(Model model, @RequestParam("JbookNum") int JbookNum,@ModelAttribute("search") SearchVO search,@RequestParam("c") int categoryNum,@RequestParam("t") int tier) throws Exception{
		
		JungoBookVO jungobook = service.jungoview(JbookNum);
		
		model.addAttribute("jungobook", jungobook);
				
		
		ObjectMapper objm = new ObjectMapper();
		List<CategoryVO> list = service.cateList();
		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
		
		  return WEB_PATH +"/bookList/jungo/jungomodify.jsp";			
	}
		
	// 중고책 수정
	@RequestMapping(value = "/jungomodify", method=RequestMethod.POST)
	public String jungomodify(JungoBookVO jungo,@ModelAttribute("search") SearchVO search,HttpSession session, RedirectAttributes ra , MultipartFile file, HttpServletRequest req,@RequestParam("c") int categoryNum,@RequestParam("t") int tier,@RequestParam("JbookNum") int JbookNum) throws Exception {
		
		
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("Jimg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  jungo.setJimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
			 jungo.setJimg(req.getParameter("Jimg"));
		  
		 }
		 
		 
			String sessionId = (String)	session.getAttribute("id");
			String InputId = service.idCheck(jungo.getJbookNum());
			
			 if(sessionId.equals(InputId)) {
				  
				 jungo.setId(sessionId);
				 service.jungoModify(jungo);
					ra.addAttribute("JbookNum", JbookNum);	
					ra.addAttribute("c", categoryNum);
					ra.addAttribute("t", tier);
					ra.addAttribute("page", search.getPage());
					ra.addAttribute("countPerPage", search.getCountPerPage());
					ra.addFlashAttribute("msg", "modifySuccess");
				return "redirect:/jungoview";	

			 }
				ra.addAttribute("JbookNum", JbookNum);	
				ra.addAttribute("c", categoryNum);
				ra.addAttribute("t", tier);
				ra.addAttribute("page", search.getPage());
				ra.addAttribute("countPerPage", search.getCountPerPage());
				ra.addFlashAttribute("msg", "modifyfail");
			return "redirect:/jungoview";	
		
	}
	
	
	
	// 중고책 삭제
	@RequestMapping(value = "/jungodelete", method = RequestMethod.POST)
	public String jungoDelete(@ModelAttribute("search") SearchVO search,JungoBookVO jungo , @RequestParam("JbookNum") int JbookNum,HttpSession session, RedirectAttributes ra,@RequestParam("c") int categoryNum,@RequestParam("t") int tier) throws Exception {

		
		
		String sessionId = (String)	session.getAttribute("id");
		String InputId = service.idCheck(jungo.getJbookNum());
		
		 if(sessionId.equals(InputId)) {
			  // 아이디 일치시
			 jungo.setId(sessionId);
			 	service.jungoDelete(jungo);
				ra.addAttribute("JbookNum", JbookNum);		 
				ra.addAttribute("c", categoryNum);
				ra.addAttribute("t", tier);
				ra.addAttribute("page", search.getPage());
				ra.addAttribute("countPerPage", search.getCountPerPage());
			 	ra.addFlashAttribute("msg", "deleteSuccess");
			 	return "redirect:/bookListJungo";
			 	
			 }
		 	//아이디 불일치시
			ra.addAttribute("JbookNum", JbookNum);		 
			ra.addAttribute("c", categoryNum);
			ra.addAttribute("t", tier);
			ra.addAttribute("page", search.getPage());
			ra.addAttribute("countPerPage", search.getCountPerPage());
		 	ra.addFlashAttribute("msg", "deletefail");
		 return "redirect:/jungoview";
	}
	
	
	
	
	
	
	// 중고 검색리스트
	@RequestMapping(value = "/jungoSearch", method = RequestMethod.GET)
	public String jungosearch(@ModelAttribute("search") SearchVO search,Model model) throws Exception{
		
		List<JungoBookVO> list = service.ListJungoSearch(search);
		model.addAttribute("list", list);
		
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		pc.setTotalCount(service.CountJungoSearch(search));
		model.addAttribute("pc", pc);
		System.out.println(pc);
		
		
		  return WEB_PATH +"/bookList/jungo/jungoSearch.jsp";		
		
		
	}
	
	//검색후 중고책 조회
		@RequestMapping(value="/jungosearchview",method=RequestMethod.GET)
		public String jungosearchview(Model model, @RequestParam("JbookNum") int JbookNum, @ModelAttribute("search")SearchVO search) throws Exception{
			
			
			JungoBookVO jungobook = service.jungoview(JbookNum);
			
			model.addAttribute("jungobook", jungobook);
					
			
			ObjectMapper objm = new ObjectMapper();
			List<CategoryVO> list = service.cateList();
			String cateList = objm.writeValueAsString(list);
			model.addAttribute("cateList", cateList);
			
			
			  return WEB_PATH +"/bookList/jungo/jungosearchview.jsp";		
			
		}
	
		
		//검색후 중고책 수정
		@RequestMapping(value = "/jungosearchmodify", method=RequestMethod.GET)
		public String jungosearchmodify(Model model, @RequestParam("JbookNum") int JbookNum,@ModelAttribute("search") SearchVO search) throws Exception{
			
			JungoBookVO jungobook = service.jungoview(JbookNum);
			
			model.addAttribute("jungobook", jungobook);
					
			
			ObjectMapper objm = new ObjectMapper();
			List<CategoryVO> list = service.cateList();
			String cateList = objm.writeValueAsString(list);
			model.addAttribute("cateList", cateList);
			
			  return WEB_PATH +"/bookList/jungo/jungosearchmodify.jsp";			
		}
			
		// 검색후 중고책 수정
		@RequestMapping(value = "/jungosearchmodify", method=RequestMethod.POST)
		public String jungosearchmodify(JungoBookVO jungo,@ModelAttribute("search") SearchVO search, RedirectAttributes ra , MultipartFile file, HttpServletRequest req, HttpSession session, @RequestParam("JbookNum") int JbookNum) throws Exception {
			
			// 새로운 파일이 등록되었는지 확인
			 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 기존 파일을 삭제
			  new File(uploadPath + req.getParameter("Jimg")).delete();
			  
			  // 새로 첨부한 파일을 등록
			  String imgUploadPath = uploadPath + File.separator + "imgUpload";
			  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			  
			  jungo.setJimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  
			 } else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
				 jungo.setJimg(req.getParameter("Jimg"));
			  
			 }
			 
			 
				String sessionId = (String)	session.getAttribute("id");
				String InputId = service.idCheck(jungo.getJbookNum());
				
				 if(sessionId.equals(InputId)) {
					  
					 jungo.setId(sessionId);
					 service.jungoModify(jungo);
						ra.addAttribute("JbookNum", JbookNum);	
						ra.addAttribute("page", search.getPage());
						ra.addAttribute("countPerPage", search.getCountPerPage());
						ra.addAttribute("keyword", search.getKeyword());
						ra.addAttribute("condition", search.getCondition());
						ra.addFlashAttribute("msg", "modifySuccess");
					return "redirect:/jungosearchview";	

				 }
					ra.addAttribute("JbookNum", JbookNum);	
					ra.addAttribute("page", search.getPage());
					ra.addAttribute("countPerPage", search.getCountPerPage());
					ra.addAttribute("keyword", search.getKeyword());
					ra.addAttribute("condition", search.getCondition());
					ra.addFlashAttribute("msg", "modifyfail");
				return "redirect:/jungosearchview";	
			
		}
		
		
	
				
//		검색후 중고책 삭제
		@RequestMapping(value = "/jungosearchdelete", method = RequestMethod.POST)
		public String jungosearchdelete(@ModelAttribute("search") SearchVO search, JungoBookVO jungo , HttpSession session, RedirectAttributes ra, @RequestParam("JbookNum") int JbookNum ) throws Exception {

			
			String sessionId = (String)	session.getAttribute("id");
			String InputId = service.idCheck(jungo.getJbookNum());
			
			 if(sessionId.equals(InputId)) {
				  
				 jungo.setId(sessionId);
				 	service.jungoDelete(jungo);
					ra.addAttribute("JbookNum", JbookNum);		 
					ra.addAttribute("page", search.getPage());
					ra.addAttribute("countPerPage", search.getCountPerPage());
					ra.addAttribute("keyword", search.getKeyword());
					ra.addAttribute("condition", search.getCondition());
				 	ra.addFlashAttribute("msg", "deleteSuccess");
				 	return "redirect:/jungoSearch";
				 	
				 	
				 }
				ra.addAttribute("JbookNum", JbookNum);		 
				ra.addAttribute("page", search.getPage());
				ra.addAttribute("countPerPage", search.getCountPerPage());
				ra.addAttribute("keyword", search.getKeyword());
				ra.addAttribute("condition", search.getCondition());
			 	ra.addFlashAttribute("msg", "deletefail");
			 return "redirect:/jungosearchview";
		}
		
////	검색후 중고책 삭제
//	@ResponseBody	
//	@RequestMapping(value = "/jungosearchdelete", method = RequestMethod.POST)
//	public int jungosearchdelete(@ModelAttribute("search") SearchVO search, JungoBookVO jungo , HttpSession session, RedirectAttributes ra ) throws Exception {
//
//		
//		int result = 0;
//		
//		
//		String sessionId = (String)	session.getAttribute("id");
//		String InputId = service.idCheck(jungo.getJbookNum());
//		
//		 if(sessionId.equals(InputId)) {
//			  
//			 jungo.setId(sessionId);
//				service.jungoDelete(jungo);
//			  
//			  result = 1;
//			 }
//		
//		
//		
//		 return result;
//	}
			
		// 댓글 목록
		@ResponseBody
		@RequestMapping(value = "/jungoreplyList", method = RequestMethod.GET)
		public List<JungoReplyVO> getReplyList(@RequestParam("JbookNum") int JbookNum) throws Exception {
		   
		 List<JungoReplyVO> reply = replyservice.replyList(JbookNum);
		 
		 return reply;
		} 
		// 댓글 작성
		@ResponseBody
		@RequestMapping(value = "/jungoregistReply", method = RequestMethod.POST)
		public void registReply(JungoReplyVO reply,HttpSession session) throws Exception {
			 String sessionId = (String) session.getAttribute("id");
			 reply.setId(sessionId);
		 replyservice.registReply(reply);
		} 
		// 댓글 삭제
		@ResponseBody
		@RequestMapping(value = "/jungodeleteReply", method = RequestMethod.POST)
		public int getReplyList(JungoReplyVO reply,  HttpSession session) throws Exception {

		 int result = 0;
		 
		 String sessionId = (String) session.getAttribute("id");
		 String inputId = replyservice.idCheck(reply.getJrno());
		  
		 if(sessionId.equals(inputId)) {
		  
			 reply.setId(sessionId);
		  replyservice.deleteReply(reply);
		  
		  result = 1;
		 }
		 
		 return result; 
		
		
		
		}
		
		
		// 댓글 수정
		@ResponseBody
		@RequestMapping(value = "/jungomodifyReply", method = RequestMethod.POST)
		public int modifyReply(JungoReplyVO reply, HttpSession session) throws Exception {
			 int result = 0;
			 
			 String sessionId = (String) session.getAttribute("id");
			 String inputId = replyservice.idCheck(reply.getJrno());
			  
			 if(sessionId.equals(inputId)) {
			  
				 reply.setId(sessionId);
			  replyservice.modifyReply(reply);
			  
			  result = 1;
			 }
			 
			 return result; 
			 
			 
		} 



}
