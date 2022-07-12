package vo;




public class PageCreator {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private PageVO paging;
	
	public void setPaging(PageVO paging) {
		this.paging = paging;
	}
	
	public PageVO getPaging() {
		return paging;
	}
	 
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	//페이징 알고리즘을 수행할 메서드 선언.
	private void calcData() {
		//보정 전 끝 페이지 구하기
		endPage = (int) (Math.ceil(paging.getPage() / (double)displayPageNum) * displayPageNum);
		//시작 페이지 번호 구하기
		startPage = (endPage - displayPageNum) + 1;

		//현재 시작페이지가 1이라면 이전버튼 활성화 여부를 false로 지정		
		prev = startPage == 1 ? false : true;
		
		//마지막 페이지인지 여부 확인 후 다음 버튼 비활성.
		next = endPage * paging.getCountPerPage() >= totalCount ? false : true;
	
		//재보정 여부 판단하기
		if(!isNext()) {
			//끝 페이지 재보정하기
			endPage = (int)Math.ceil(totalCount / (double)paging.getCountPerPage());
		}
		
//		  
//			int tempEndPage = (int) (Math.ceil(totalCount / (double)paging.getCountPerPage()));
//			if (endPage > tempEndPage) {
//				endPage = tempEndPage;
//			}
			
	
	}

	
	@Override
	public String toString() {
		return "PageCreator [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", paging=" + paging + "]";
	}

}