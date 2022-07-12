package service;

import java.util.List;


import dao.BookDAO;
import vo.BookVO;
import vo.SearchVO;

public class BookServiceImpl implements BookService {
	
	BookDAO dao;

	public BookServiceImpl(BookDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BookVO> list(int categoryNum, int tier ,SearchVO search) throws Exception {

		
		
	 int cateParent = 0;

	 
	 if (tier == 1) {
		if( categoryNum >= 100000 && categoryNum < 200000 ) {
			
			
			List<BookVO> listIncountry = dao.listIncountry(search);				
			//2주 이내 신규책 new마크 붙히기
			for(BookVO book : listIncountry) {
				//현재 시간 읽어오기
				long now = System.currentTimeMillis(); 
				//각 책들의 출판 시간 밀리초로 읽어오기
				long regTime = book.getPublishDate().getTime();
				
				if(now - regTime < 60 * 60 * 24 * 1000 * 14) {
					book.setNewMark(true);
				}
			}
			
			return listIncountry;
			}
		if(categoryNum >= 200000 && categoryNum < 300000) {
			
			List<BookVO> listOutcountry = dao.listOutcountry(search);				
			//2주 이내 신규책 new마크 붙히기
			for(BookVO book : listOutcountry) {
				//현재 시간 읽어오기
				long now = System.currentTimeMillis();
				//각 책들의 출판 시간 밀리초로 읽어오기
				long regTime = book.getPublishDate().getTime();
				
				if(now - regTime < 60 * 60 * 24 * 1000 * 14) {
					book.setNewMark(true);
				}
			}
			
			
			 return listOutcountry;
			 }
		if(categoryNum == 300000) {		// categoryNum == 300000 이면 신간 리스트
			
			List<BookVO> listNew = dao.ListNew(search);				
			//2주 이내 신규책 new마크 붙히기
			for(BookVO book : listNew) {
				//현재 시간 읽어오기
				long now = System.currentTimeMillis();
				//각 책들의 출판 시간 밀리초로 읽어오기
				long regTime = book.getPublishDate().getTime();
				
				if(now - regTime < 60 * 60 * 24 * 1000 * 14) {
					book.setNewMark(true);
				}
			}
			
			
			 return listNew;
			 }
	 }
	 if(tier == 2) {  
		 cateParent = categoryNum;
			List<BookVO> list_1 = dao.list_1(cateParent,search);		
			//2주 이내 신규책 new마크 붙히기
			for(BookVO book : list_1) {
				//현재 시간 읽어오기
				long now = System.currentTimeMillis();
				//각 책들의 출판 시간 밀리초로 읽어오기
				long regTime = book.getPublishDate().getTime();
				
				if(now - regTime < 60 * 60 * 24 * 1000 * 14) {
					book.setNewMark(true);
				}
			}
		 	
	  return list_1;
	 
	  
	 }  else {  
		 
		  
				List<BookVO> list_2 = dao.list_2(categoryNum,search);			
				//2주 이내 신규책 new마크 붙히기
				for(BookVO book : list_2) {
					//현재 시간 읽어오기
					long now = System.currentTimeMillis();
					//각 책들의 출판 시간 밀리초로 읽어오기
					long regTime = book.getPublishDate().getTime();
					
					if(now - regTime < 60 * 60 * 24 * 1000 * 14) {
						book.setNewMark(true);
					}
				}
		 
	  
	  return list_2;
	  
	 }

	}




	@Override
	public int Count(int categoryNum, int tier, SearchVO search) throws Exception {
		 int cateParent = 0;

		 
		 if (tier == 1) {
			if( categoryNum >= 100000 && categoryNum < 200000 )
				return dao.IncountryCount(search);
			 if(categoryNum >= 200000 && categoryNum < 300000)
				 return dao.OutcountryCount(search);
			 if(categoryNum == 300000)// categoryNum == 300000 이면 신간 리스트
				 return dao.CountNew(search);
		 }
		 if(tier == 2) {  
		  
			 cateParent = categoryNum;
		  return dao.primaryClassification(cateParent,search);
		 
		  
		 }  else {  
		  
		  return dao.secondaryClassification(categoryNum,search);
		  
		 }

		}




	@Override
	public int CountAll(SearchVO search) throws Exception {
		return dao.CountAll(search);
	}


		


	@Override
	public List<BookVO> ListAll(SearchVO search) throws Exception {
		return  dao.ListAll(search);	
	
	}









	
	
	//					베스트 셀러 라인


	@Override
	public List<BookVO> list_best(int categoryNum, int tier ,SearchVO search) throws Exception {

		 
		 int cateParent = 0;

		 
		 if (tier == 1) {
			if( categoryNum >= 100000 && categoryNum < 200000 )
				return dao.listIncountry_best(search);
			if(categoryNum >= 200000 && categoryNum < 300000)
				 return dao.listOutcountry_best(search);
			if(categoryNum == 400000) {// categoryNum == 400000 이면 베스트셀러
				 return dao.ListBestbook(search);
			}
		 }
		 if(tier == 2) {  
		  
			 cateParent = categoryNum;
		  return dao.list_1_best(cateParent,search);
		 
		  
		 }  else {  
		  
		  return dao.list_2_best(categoryNum,search);
		  
		 }

	}
	 


	



	@Override
	public int Count_best(int categoryNum, int tier, SearchVO search) throws Exception {
				
		
		int cateParent = 0;

		 
		 if (tier == 1) {
			if( categoryNum >= 100000 && categoryNum < 200000 )
				return dao.IncountryCount_best(search);
			 if(categoryNum >= 200000 && categoryNum < 300000)
				 return dao.OutcountryCount_best(search);
			 if(categoryNum == 400000)				// categoryNum == 400000 이면 베스트셀러
				 return dao.CountBestbook(search);
		 }
		 if(tier == 2) {  
		  
			 cateParent = categoryNum;
		  return dao.primaryClassification_best(cateParent,search);
		 
		  
		 }  else {  
		  
		  return dao.secondaryClassification_best(categoryNum,search);
		  
		 }


		}

	@Override
	public void insert_api(BookVO bookVO) throws Exception {
		dao.insert_api(bookVO);
	}

	@Override
	public BookVO selectListOne(Integer num) {
		return dao.selectListOne(num);
	}

	@Override
	public List<BookVO> selectlist() {
		return dao.selectlist();
	}












	
}
