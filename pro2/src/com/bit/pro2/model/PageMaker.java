package com.bit.pro2.model;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class PageMaker {
	
	private int totalCount;	//��ü�Խù�����
	private int startPage;	//ó��������
	private int endPage;	//��������
	private boolean prev;	//����
	private boolean next;	//����
	
	private int displayPageNum=10;	//화면에 보여지는 페이지 번호
	
	private Criteria cri;
	

	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
	
		calcData();
	}
	
	private void calcData(){
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage=(endPage-displayPageNum)+1;
		
		int tempEndPage=(int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage>tempEndPage){
			endPage=tempEndPage;
		}
		
		prev=startPage==1?false:true;
		
		next=endPage*cri.getPerPageNum()>totalCount?false:true;
	}
	
	
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
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
	
	
	

}
