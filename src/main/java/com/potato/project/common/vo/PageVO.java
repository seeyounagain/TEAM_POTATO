package com.potato.project.common.vo;

public class PageVO extends SearchVO {
	
	// 페이징 처리를 위한 VO
	
	// 현재 선택 된 페이지 번호
	private int nowPage;
	
	// 전체 데이터 갯수
	private int totalCnt;
	
	// 첫 페이지 번호
	// ex) 현재 3 페이지 일 경우 1, 현재 9 페이지 일 경우 5 (5페이지씩 보여준다고 한다면)
	private int startPage;
	
	// 마지막 페이지 번호
	// ex) 현재 3 페이지 일 경우 5, 현재 9 페이지 일 경우 10 (5페이지씩 보여준다고 한다면)
	private int endPage;
	
	// 한 페이지에 보여줄 게시글 갯수 (한 페이지당 글 10개)
	private int displayCnt;
	
	// 한번에 보여지는 페이지 수 (5 = 1페이지~5페이지, 6페이지~10페이지 ...)
	private int displayPageCnt;
	
	// 이전 버튼 유무 (1~5 사이에는 false, 6~ 이후는 true)
	private boolean prev;
	
	// 이후 버튼 유무 (1~5 사이에는 true, 마지막 페이지는 false)
	private boolean next;
	
	// 한 페이지에 보여줄 게시글을 나누어줄 숫자
	// 1 페이지 ( (startNum)1번 게시글 ~ (endNum)10번 게시글)
	// 2 페이지 (11번 게시글 ~ 20번 게시글)
	// 3 페이지 (21번 게시글 ~ 30번 게시글)
	private int startNum;
	
	private int endNum;
	
	// 1페이지 부터 시작, 글 10개씩 5페이지씩 보여주기로 기본값 설정
	public PageVO() {
		nowPage = 1;
		displayCnt = 10;
		displayPageCnt = 5;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public boolean getPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	public int getStartNum() {
		return startNum;
	}

	public void setStartNum() {
		this.startNum = (nowPage - 1) * displayCnt + 1;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum() {
		this.endNum = nowPage * displayCnt;
	}
	
	
	// 메소드 호출 시 페이징 처리의 모든 정보 셋팅
	public void setPageInfo() {
		
		// 화면에 보이는 마지막 페이지 번호 지정 -> endPage 셋팅
		endPage = (int)(Math.ceil(nowPage / (double)displayPageCnt)) * displayPageCnt;
		
		// 첫 페이지 번호 지정 -> startPage
		// (마지막 페이지 번호 - 한번에 보여지는 페이지 수 + 1)
		startPage = endPage - displayPageCnt + 1;
		
		// 전체 페이지 수
		// (전체 데이터수 / 한번에 보여질 데이터 수)
		int totalPage = (int)(Math.ceil(totalCnt / (double)displayCnt));
		
		// next 버튼 유무 true = 유 / false = 무
		// 현재 페이지가 마지막 페이지보다 작을 경우에만 보이도록 지정
		// (현재 페이지가 마지막 페이지일 경우에만 보이지 않도록)
		if (endPage < totalPage) {
			next = true;
		}
		else {
			next = false;
			endPage = totalPage;
			// 10게시글씩 ,5페이지씩 보이도록 페이지 설정 했을 경우 총 80게시글이라면
			// endPage는 8이 아닌 10이 되기 때문에 totalPage로 넣어준다.
		}
		
		// prev 버튼 유무 true = 유 / false = 무
		// 시작 페이지가 1인 경우를 제외하고 보이도록 지정
		prev = startPage == 1 ? false : true;
		
		setStartNum();
		setEndNum();
		
	}
	
}
