package service;

import java.util.List;

import vo.BookVO;
import vo.SearchVO;

public interface BookService {

	//게시물 리스트
	public List<BookVO> list(int categoryNum, int tier ,SearchVO search) throws Exception;	
	

	// 게시물 총 갯수
	public int Count(int categoryNum, int tier ,SearchVO search) throws Exception;
	
	
	
	
	
	
	// 검색시 전체 책개수
	public int CountAll(SearchVO search) throws Exception;
	// 검색시 전체 책리스트
	public List<BookVO> ListAll(SearchVO search) throws Exception;
	
	
	
	
	//베스트 셀러 라인
	
	//베스트 셀러 게시물 리스트
	public List<BookVO> list_best(int categoryNum, int tier ,SearchVO search) throws Exception;	
	

	// 베스트 셀러게시물 총 갯수
	public int Count_best(int categoryNum, int tier ,SearchVO search) throws Exception;
	

	//api 데이터 삽입
	public void insert_api(BookVO bookVO) throws Exception;

	//책 상세정보 조회
	public BookVO selectListOne(Integer num) ;
	public List<BookVO> selectlist();

}
