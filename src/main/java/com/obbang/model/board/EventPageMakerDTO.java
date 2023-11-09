package com.obbang.model.board;

public class EventPageMakerDTO {
	
	/* 시작 페이지 */
    private int event_startPage;
    
    /* 끝 페이지 */
    private int event_endPage;
    
    /* 이전 페이지, 다음 페이지 존재유무 */
    private boolean event_prev, event_next;
    
    /*전체 게시물 수*/
    private int event_total;
    
    /* 현재 페이지, 페이지당 게시물 표시수 정보 */
    private EventCriteria event_cri;
	
	

    /* 생성자 */
    public EventPageMakerDTO(EventCriteria event_cri, int event_total) {
        
        this.event_cri = event_cri;
        this.event_total = event_total;
        
        /* 마지막 페이지 */
        this.event_endPage = (int)(Math.ceil(event_cri.getEvent_pageNum()/4.0))*4;
        /* 시작 페이지 */
        this.event_startPage = this.event_endPage - 3;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(event_total * 1.0/event_cri.getEvent_amount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.event_endPage) {
            this.event_endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.event_prev = this.event_startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        this.event_next = this.event_endPage < realEnd;
        
        
    }



	public int getEvent_startPage() {
		return event_startPage;
	}



	public void setEvent_startPage(int event_startPage) {
		this.event_startPage = event_startPage;
	}



	public int getEvent_endPage() {
		return event_endPage;
	}



	public void setEvent_endPage(int event_endPage) {
		this.event_endPage = event_endPage;
	}



	public boolean isEvent_prev() {
		return event_prev;
	}



	public void setEvent_prev(boolean event_prev) {
		this.event_prev = event_prev;
	}



	public boolean isEvent_next() {
		return event_next;
	}



	public void setEvent_next(boolean event_next) {
		this.event_next = event_next;
	}



	public int getEvent_total() {
		return event_total;
	}



	public void setEvent_total(int event_total) {
		this.event_total = event_total;
	}



	public EventCriteria getEvent_cri() {
		return event_cri;
	}



	public void setEvent_cri(EventCriteria event_cri) {
		this.event_cri = event_cri;
	}



	@Override
	public String toString() {
		return "EventPageMakerDTO [event_startPage=" + event_startPage + ", event_endPage=" + event_endPage
				+ ", event_prev=" + event_prev + ", event_next=" + event_next + ", event_total=" + event_total
				+ ", event_cri=" + event_cri + "]";
	}

}
