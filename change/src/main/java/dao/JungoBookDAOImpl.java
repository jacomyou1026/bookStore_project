package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.CategoryVO;
import vo.JungoBookVO;
import vo.SearchVO;

public class JungoBookDAOImpl implements JungoBookDAO{
	
	private SqlSession sql;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sql = sqlSession;
	}
	@Override
	public void JungoBookEnroll(JungoBookVO book) throws Exception{
		sql.insert("JungoMapper.JungoBookEnroll",book);
	}

	@Override
	public List<CategoryVO> cateList() throws Exception{
		return sql.selectList("JungoMapper.cateList");
	}

	@Override
	public JungoBookVO jungoview(int JbookNum) throws Exception{
		return sql.selectOne("JungoMapper.jungoview",JbookNum);
	}
	@Override
	public List<JungoBookVO> list_2(int categoryNum ,SearchVO search)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectList("JungoMapper.list_2",map);
	}

	//1차분류
	@Override
	public List<JungoBookVO> list_1(int cateParent,SearchVO search) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return  sql.selectList("JungoMapper.list_1" , map);
	}





	@Override
	public List<JungoBookVO> listIncountry(SearchVO search) throws Exception{
		return sql.selectList("JungoMapper.listIncountry", search);
}


	@Override
	public List<JungoBookVO> listOutcountry(SearchVO search) throws Exception{
		return sql.selectList("JungoMapper.listOutcountry", search);
	}
	
	
	
	



	
	@Override
	public int IncountryCount(SearchVO search) throws Exception {
		return sql.selectOne("JungoMapper.IncountryCount",search);
	}

	@Override
	public int OutcountryCount(SearchVO search) throws Exception {
		return sql.selectOne("JungoMapper.OutcountryCount",search);
	}

	@Override
	public int primaryClassification(int cateParent,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("cateParent", cateParent);
		 map.put("search", search);
		return sql.selectOne("JungoMapper.primaryClassification",map);
	}

	@Override
	public int secondaryClassification(int categoryNum,SearchVO search) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("categoryNum", categoryNum);
		 map.put("search", search);
		return sql.selectOne("JungoMapper.secondaryClassification",map);
	}
	@Override
	public int CountJungo(SearchVO search) throws Exception {
		return sql.selectOne("JungoMapper.CountJungo",search);
	}

	@Override
	public List<JungoBookVO> ListJungo(SearchVO search) throws Exception {
		return sql.selectList("JungoMapper.ListJungo", search);
	}

	@Override
	public int CountJungoSearch(SearchVO search) throws Exception {
		return sql.selectOne("JungoMapper.CountJungoSearch",search);
	}

	@Override
	public List<JungoBookVO> ListJungoSearch(SearchVO search) throws Exception {
		return sql.selectList("JungoMapper.ListJungoSearch", search);
	}
	@Override
	public void jungoModify(JungoBookVO book) throws Exception{
		sql.update("JungoMapper.jungoModify",book);
	}

	@Override
	public void jungoDelete(JungoBookVO book) throws Exception {
		sql.delete("JungoMapper.jungoDelete",book);
	}
	@Override
	public int CountUserJungo(String id) throws Exception {
		return sql.selectOne("JungoMapper.CountUserJungo",id);
	}

	@Override
	public String idCheck(int JbookNum) throws Exception {
		return sql.selectOne("JungoMapper.JungoIdCk",JbookNum);
	}

	@Override
	public JungoBookVO getJsubject(int JbookNum) {
		return sql.selectOne("JungoMapper.getJsubject", JbookNum);
	}
	
}
