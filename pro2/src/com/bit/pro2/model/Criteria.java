package com.bit.pro2.model;

public class Criteria {
	
	private int page;	//������ ��ȣ?
	private int perPageNum;	//한페이지당 보여주는 데이터
	
	public Criteria(){
		this.page=1;
		this.perPageNum=10;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page<=0){
		this.page = 1;
		return;
		}
		this.page=page;
		
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0||perPageNum>100){
		this.perPageNum = 10;
		return;
	}
		this.perPageNum=perPageNum;
	
	}
	
	
	public int getPageStart(){
		return(this.page-1)*this.perPageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria [page="+page+","
				+"perPageNum="+perPageNum+"]";
	}
	//Ŭ�������� ������ �ִµ� ���� �ùٸ��� ����ִ� �� �α׸� Ȯ���� ��  toString() �������̵带 ���ؼ� ���� ������ �ֽ��ϴ�.

	public static void main(String args[]){
		System.out.println(new Criteria());
	}
}
