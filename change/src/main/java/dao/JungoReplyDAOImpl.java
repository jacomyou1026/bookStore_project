package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.JungoReplyVO;

public class JungoReplyDAOImpl implements JungoReplyDAO{
	private SqlSession sql;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sql = sqlSession;
	}
	
	@Override
	public void registReply(JungoReplyVO reply) throws Exception {
		sql.insert("JungoReplyMapper.registReply",reply);
	}

	@Override
	public List<JungoReplyVO> replyList(int JbookNum) throws Exception {
		return sql.selectList("JungoReplyMapper.replyList",JbookNum);
	}

	@Override
	public String idCheck(int Jrno) throws Exception {
		return sql.selectOne("JungoReplyMapper.replyMemberIdCheck", Jrno);
	}

	@Override
	public void deleteReply(JungoReplyVO reply) throws Exception {
		sql.delete("JungoReplyMapper.deleteReply",reply);
	}

	@Override
	public void modifyReply(JungoReplyVO reply) throws Exception {
		sql.update("JungoReplyMapper.modifyReply", reply);
	}
}
