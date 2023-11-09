package com.obbang.model.board;

public class EventCriteria {
	/* 현재 페이지 */
    private int event_pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int event_amount;
     
    /* 스킵 할 게시물 수( (pageNum-1) * amount ) */
    private int event_skip;

    /* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
    public EventCriteria() {
        this(1,4);
        this.event_skip = 0;
    }
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public EventCriteria(int event_pageNum, int event_amount) {
        this.event_pageNum = event_pageNum;
        this.event_amount = event_amount;
        this.event_skip = (event_pageNum-1)*event_amount;
    }
    
    
    public int getEvent_pageNum() {
		return event_pageNum;
	}

	public void setEvent_pageNum(int event_pageNum) {
		
		this.event_skip = (event_pageNum-1)*event_amount;
		this.event_pageNum = event_pageNum;
	}

	public int getEvent_amount() {
		return event_amount;
	}

	public void setEvent_amount(int event_amount) {
		
		this.event_skip = (event_pageNum-1)*event_amount;
		this.event_amount = event_amount;
	}

	public int getEvent_skip() {
		return event_skip;
	}

	public void setEvent_skip(int event_skip) {
		this.event_skip = event_skip;
	}
   

	@Override
	public String toString() {
		return "EventCriteria [event_pageNum=" + event_pageNum + ", event_amount=" + event_amount + ", event_skip="
				+ event_skip + "]";
	}

}
