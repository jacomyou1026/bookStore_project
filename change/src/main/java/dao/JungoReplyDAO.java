package dao;

import java.util.List;

import vo.JungoReplyVO;

public interface JungoReplyDAO {
	// 댓글 작성
	public void registReply(JungoReplyVO reply) throws Exception;
	// 댓글 목록
	public List<JungoReplyVO> replyList(int JbookNum) throws Exception;
	// 댓글아이디체크
	public String idCheck(int Jrno) throws Exception;
	// 댓글 삭제
	public void deleteReply(JungoReplyVO reply) throws Exception;
	//댓글 수정
	public void modifyReply(JungoReplyVO reply) throws Exception;
}
