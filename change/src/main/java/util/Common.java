package util;

public class Common {
	
	//클래스 안에 클래스가 들어가는경우는 흔한 경우는아님..
	public static class Board{
		
		public static final String VIEW_PATH="/WEB-INF/views/board/";
		
		//한 페이지에 보여줄 게시물 수
		public final static int BLOCKLIST = 5;
		
		//한 화면에 보여질 페이지 메뉴 수 (최대 몇개까지 보여줄 것인가)
		//< 1 2 3 >
		public final static int BLOCKPAGE = 3;
		
	}
	
	//예를들어 게시판이 여러개인데, 한페이지에 보여줄 게시물 수와
	//페이지 메뉴 수가 다를경우
	public static class Notice{
		public final static int BLOCKLIST = 10;
		public final static int BLOCKPAGE = 5;

	}
}
