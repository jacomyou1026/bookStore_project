package vo;

import java.util.Date;

public class JungoReplyVO {

	
//	create table jungoreply(
//			Jrno number not null,
//			JbookNum number not null,
//			JreplyContent varchar2(1000) not null,
//			JreplyRegdate date default sysdate,
//			Id varchar2(40) not null,
//			primary key(jrno),
//			constraint rs foreign key (Id)
//				references BOOK_USER(Id) on delete cascade,
//			constraint ra foreign key(JbookNum)
//				references jungobook(JbookNum) on delete cascade
//
//			);
//
//			create sequence jungoreply_seq;


		private int Jrno;
		private int JbookNum;
		private String JreplyContent;
		private Date JreplyRegdate;
		private String Id;
		
		
		
		public int getJrno() {
			return Jrno;
		}
		public void setJrno(int jrno) {
			Jrno = jrno;
		}
		public int getJbookNum() {
			return JbookNum;
		}
		public void setJbookNum(int jbookNum) {
			JbookNum = jbookNum;
		}
		public String getJreplyContent() {
			return JreplyContent;
		}
		public void setJreplyContent(String jreplyContent) {
			JreplyContent = jreplyContent;
		}
		public Date getJreplyRegdate() {
			return JreplyRegdate;
		}
		public void setJreplyRegdate(Date jreplyRegdate) {
			JreplyRegdate = jreplyRegdate;
		}
		public String getId() {
			return Id;
		}
		public void setId(String id) {
			Id = id;
		}
		
		
		
		
	

}
