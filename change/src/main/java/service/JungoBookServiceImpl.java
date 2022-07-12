package service;

import java.util.List;

import dao.JungoBookDAO;
import vo.CategoryVO;
import vo.JungoBookVO;
import vo.SearchVO;

public class JungoBookServiceImpl implements JungoBookService {
	
	JungoBookDAO dao;

	public JungoBookServiceImpl(JungoBookDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<JungoBookVO> list(int categoryNum, int tier ,SearchVO search) throws Exception {

		
		
	 int cateParent = 0;

	 
	 if (tier == 1) {
		if( categoryNum >= 100000 && categoryNum < 200000 ) {
			
			return dao.listIncountry(search);	
			
			}
		if(categoryNum >= 200000 && categoryNum < 300000) {
			
			 return dao.listOutcountry(search);	
			
		}
		if(categoryNum == 500000) {		// categoryNum == 500000 이면 중고 리스트
			
			 return dao.ListJungo(search);	
			 }
	 }
	 if(tier == 2) {  
		 
		 cateParent = categoryNum;
		 	
	  return dao.list_1(cateParent,search);	
	 
	  
	 }  else {  
		  
	  return dao.list_2(categoryNum,search);	
	  
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
			 if(categoryNum == 500000)// categoryNum == 500000 이면 중고 리스트
				 return dao.CountJungo(search);
		 }
		 if(tier == 2) {  
		  
			 cateParent = categoryNum;
		  return dao.primaryClassification(cateParent,search);
		 
		  
		 }  else {  
		  
		  return dao.secondaryClassification(categoryNum,search);
		  
		 }

		}
	
	
	
	
	
	
	
	
	
	
	@Override
	public void JungoBookEnroll(JungoBookVO book)throws Exception{
		dao.JungoBookEnroll(book);
	}

	@Override
	public List<CategoryVO> cateList()throws Exception{
		return dao.cateList();
	}







	@Override
	public JungoBookVO jungoview(int JbookNum) throws Exception{
		return dao.jungoview(JbookNum);
	}







	@Override
	public void jungoModify(JungoBookVO book) throws Exception {
		 dao.jungoModify(book);
	}




	@Override
	public void jungoDelete(JungoBookVO book) throws Exception {
		dao.jungoDelete(book);
	}







	@Override
	public int CountJungoSearch(SearchVO search) throws Exception {
		return dao.CountJungoSearch(search);
	}







	@Override
	public List<JungoBookVO> ListJungoSearch(SearchVO search) throws Exception {
		return dao.ListJungoSearch(search);
	}







	@Override
	public int CountUserJungo(String id) throws Exception {
		return dao.CountUserJungo(id);
	}







	@Override
	public String idCheck(int JbookNum) throws Exception {
		return dao.idCheck(JbookNum);
	}


	



	@Override
	public JungoBookVO getJsubject(int JbookNum) {
		return dao.getJsubject(JbookNum);
	}







	
}
