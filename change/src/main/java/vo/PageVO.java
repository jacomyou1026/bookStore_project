package vo;


public class PageVO {
	
	private int page;
	private int countPerPage;
	private int rowStart;
	private int rowEnd;
	
	public PageVO() {
		this.page = 1;
		this.countPerPage = 10;
	}
	
	
	
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
	
	
	public void setCountPerPage(int countPerPage) {
		if (countPerPage <= 0 || countPerPage > 50) {
			this.countPerPage = 10;
			return;
		}
		this.countPerPage = countPerPage;
	}
	
	
	public int getCountPerPage() {
		return this.countPerPage;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * countPerPage) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + countPerPage - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", countPerPage=" + countPerPage + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}