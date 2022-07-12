package dao;

import java.util.List;

import vo.BookVO;
import vo.SearchVO;

public interface BookDAO {

	
	
	
	//국외도서 리스트
	public List<BookVO> listOutcountry(SearchVO search);
	//외국도서 리스트
	public List<BookVO> listIncountry(SearchVO search);
	// 1차분류 리스트	
	public List<BookVO> list_1(int cateParent,SearchVO search);
	//2차분류 리스트
	public List<BookVO> list_2(int categoryNum,SearchVO search);	
	
	
	
	
	
	
	// 국내 도서 총갯수
	public int IncountryCount(SearchVO search) throws Exception ;
	// 외국 도서 총갯수
	public int OutcountryCount(SearchVO search) throws Exception ;
	// 1차분류 도서 총갯수
	public int primaryClassification(int cateParent,SearchVO search) throws Exception;
	// 2차분류 도서 총갯수
	public int secondaryClassification(int categoryNum ,SearchVO search) throws Exception;
	
	
	// 검색시 전체 책 개수
	public int CountAll(SearchVO search) throws Exception;
	// 검색시 전체 책 리스트
	public List<BookVO> ListAll(SearchVO search) throws Exception;
	
	
	// 신간책 갯수
	public int CountNew(SearchVO search) throws Exception;
	// 신간 책 리스트
	public List<BookVO> ListNew(SearchVO search) throws Exception;
	
	
	
	
	//      			베스트 셀러 라인
	
	
	//베스트 셀러 국외도서 리스트
	public List<BookVO> listOutcountry_best(SearchVO search);
	//베스트 셀러 외국도서 리스트
	public List<BookVO> listIncountry_best(SearchVO search);
	// 베스트 셀러 1차분류 리스트	
	public List<BookVO> list_1_best(int cateParent,SearchVO search);
	//베스트 셀러 2차분류 리스트
	public List<BookVO> list_2_best(int categoryNum,SearchVO search);	
	
	// 베스트 셀러  국내 도서 총갯수
	public int IncountryCount_best(SearchVO search) throws Exception ;
	// 베스트 셀러  외국 도서 총갯수
	public int OutcountryCount_best(SearchVO search) throws Exception ;
	// 베스트 셀러  1차분류 도서 총갯수
	public int primaryClassification_best(int cateParent,SearchVO search) throws Exception;
	// 베스트 셀러  2차분류 도서 총갯수
	public int secondaryClassification_best(int categoryNum ,SearchVO search) throws Exception;
	
	// 베스트셀러 전체 책 갯수
	public int CountBestbook(SearchVO search) throws Exception;
	// 베스트셀러  전체 책 리스트
	public List<BookVO> ListBestbook(SearchVO search) throws Exception;
	
	
	
	//api 데이터 삽입
	public void insert_api(BookVO bookVO) throws Exception;
	
	
	
	//책 상세정보 조회
	public BookVO selectListOne(Integer num) ;
	public List<BookVO> selectlist();
	
}
