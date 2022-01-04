package com.puppy.common.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Pagination {
	
	private int totalCount;	//전체 게시글 수
	private int startPage;	//시작 페이지
	private int endPage;	//끝 페이지
	private boolean prev;	//이전글 목록
	private boolean next;	//다음글 목록
	private int displayPageNum = 10;	// 한 페이지에 보여지는 게시글 수
	private PageRequest pageRequest;
	
	public void setPageRequest(PageRequest pageRequest) {
		this.pageRequest = pageRequest;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	
	
	private void calcData() {
		endPage = (int)(Math.ceil(pageRequest.getPage() / (double)
displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double)
pageRequest.getSizePerPage()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * pageRequest.getSizePerPage() >= totalCount ?
	false : true;
		
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
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public PageRequest getPageRequest() {
		return pageRequest;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = 
UriComponentsBuilder.newInstance().queryParam("page", page)
		.queryParam("perPageNum", pageRequest.getSizePerPage()).build();
		
		return uriComponents.toUriString();
	}

}
