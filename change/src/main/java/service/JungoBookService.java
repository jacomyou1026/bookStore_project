package service;

import java.util.List;

import vo.CategoryVO;
import vo.JungoBookVO;
import vo.SearchVO;

public interface JungoBookService {

	
	// 중고 상품등록
	public void JungoBookEnroll(JungoBookVO book)throws Exception;
	// 중고 카테고리 리스트
	public List<CategoryVO> cateList()throws Exception;
	//중고 상품 수정
	public void jungoModify(JungoBookVO book)throws Exception;
	// 아이디체크
	public String idCheck(int JbookNum) throws Exception;
	//중고 상품 삭제
	public void jungoDelete(JungoBookVO book) throws Exception;
	// 중고 상품 조회
	public JungoBookVO jungoview(int JbookNum)throws Exception;
	
	
	//중고 리스트
	public List<JungoBookVO> list(int categoryNum, int tier ,SearchVO search) throws Exception;	
	// 중고 책  총 갯수
	public int Count(int categoryNum, int tier ,SearchVO search) throws Exception;
	
	// 중고검색 책 개수
	public int CountJungoSearch(SearchVO search) throws Exception;
	// 중고검색 책 리스트
	public List<JungoBookVO> ListJungoSearch(SearchVO search) throws Exception;
	
	// 중고 사용자 책 개수 
	public int CountUserJungo(String id) throws Exception;
	
	/* 중고책 이름 가져오기 */
	public JungoBookVO getJsubject(int JbookNum);
	
	
}
