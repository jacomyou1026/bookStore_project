package service;

import java.util.List;

import dao.JungoReplyDAO;
import vo.JungoReplyVO;

public class JungoReplyServiceImpl implements JungoReplyService {
	JungoReplyDAO dao;

	public JungoReplyServiceImpl(JungoReplyDAO dao) {
		this.dao = dao;
	}

	@Override
	public void registReply(JungoReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	@Override
	public List<JungoReplyVO> replyList(int JbookNum) throws Exception {
		return dao.replyList(JbookNum);
	}

	@Override
	public String idCheck(int Jrno) throws Exception {
		return dao.idCheck(Jrno);
	}

	@Override
	public void deleteReply(JungoReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	@Override
	public void modifyReply(JungoReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}
	
}
