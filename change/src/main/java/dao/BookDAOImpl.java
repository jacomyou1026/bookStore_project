package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BookVO;
import vo.SearchVO;

public class BookDAOImpl implements BookDAO{
	
	private SqlSession sql;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sql = sqlSession;
	}

	@Override
	public List<BookVO> list_2(int categoryNum ,SearchVO search) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectList("listMapper.list_2",map);
	}

	//1차분류
	@Override
	public List<BookVO> list_1(int cateParent,SearchVO search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return  sql.selectList("listMapper.list_1" , map);
	}





	@Override
	public List<BookVO> listIncountry(SearchVO search) {
		return sql.selectList("listMapper.listIncountry", search);
}


	@Override
	public List<BookVO> listOutcountry(SearchVO search) {
		return sql.selectList("listMapper.listOutcountry", search);
	}
	
	
	
	



	
	@Override
	public int IncountryCount(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.IncountryCount",search);
	}

	@Override
	public int OutcountryCount(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.OutcountryCount",search);
	}

	@Override
	public int primaryClassification(int cateParent,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return sql.selectOne("listMapper.primaryClassification",map);
	}

	@Override
	public int secondaryClassification(int categoryNum,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectOne("listMapper.secondaryClassification",map);
	}

	@Override
	public int CountAll(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.CountAll",search);
	}

	@Override
	public List<BookVO> ListAll(SearchVO search) throws Exception {
		return sql.selectList("listMapper.ListAll", search);
	}



	@Override
	public int CountNew(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.CountNew",search);
	}

	@Override
	public List<BookVO> ListNew(SearchVO search) throws Exception {
		return sql.selectList("listMapper.ListNew", search);
	}


	
	
	
	
		//				베스트 셀러 라인
	

	@Override
	public List<BookVO> list_2_best(int categoryNum ,SearchVO search) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectList("listMapper.list_2_best",map);
	}

	//1차분류
	@Override
	public List<BookVO> list_1_best(int cateParent,SearchVO search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return  sql.selectList("listMapper.list_1_best" , map);
	}





	@Override
	public List<BookVO> listIncountry_best(SearchVO search) {
		return sql.selectList("listMapper.listIncountry_best", search);
}


	@Override
	public List<BookVO> listOutcountry_best(SearchVO search) {
		return sql.selectList("listMapper.listOutcountry_best", search);
	}
	
	
	
	



	
	@Override
	public int IncountryCount_best(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.IncountryCount_best",search);
	}

	@Override
	public int OutcountryCount_best(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.OutcountryCount_best",search);
	}

	@Override
	public int primaryClassification_best(int cateParent,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return sql.selectOne("listMapper.primaryClassification_best",map);
	}

	@Override
	public int secondaryClassification_best(int categoryNum,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectOne("listMapper.secondaryClassification_best",map);
	}
	
	
	@Override
	public int CountBestbook(SearchVO search) throws Exception {
		return sql.selectOne("listMapper.CountBestbook",search);
	}

	@Override
	public List<BookVO> ListBestbook(SearchVO search) throws Exception {
		return sql.selectList("listMapper.ListBestbook", search);
	}

	@Override
	public void insert_api(BookVO bookVO) throws Exception {
		sql.insert("listMapper.insert_api", bookVO);		
	}
	
	
	//책 상세정보 조회
	public BookVO selectListOne(Integer num){
		BookVO vo = sql.selectOne("book.book_list",num);

		return vo;
	}
	
	public List<BookVO> selectlist() {
		List<BookVO> list= sql.selectList("book.book_list2");
		return list;

	}
}
