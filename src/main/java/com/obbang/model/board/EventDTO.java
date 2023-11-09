package com.obbang.model.board;

import java.util.Date;

public class EventDTO {
	
 /* 게시판 번호 */
 private int event_eno;
 
 /* 게시판 제목 */
 private String event_title;
 
 /* 게시판 내용 */
 private String event_content;
 
 /* 등록 날짜 */
 private Date event_regdate;
 
 /* 이미지 */
 private String event_image;
 

public int getEvent_eno() {
	return event_eno;
}

public void setEvent_eno(int event_eno) {
	this.event_eno = event_eno;
}

public String getEvent_title() {
	return event_title;
}

public void setEvent_title(String event_title) {
	this.event_title = event_title;
}

public String getEvent_content() {
	return event_content;
}

public void setEvent_content(String event_content) {
	this.event_content = event_content;
}

public Date getEvent_regdate() {
	return event_regdate;
}

public void setEvent_regdate(Date event_regdate) {
	this.event_regdate = event_regdate;
}


 public String getEvent_image() {
	return event_image;
}

public void setEvent_image(String event_image) {
	this.event_image = event_image;
}

@Override
public String toString() {
	return "EventDTO [event_eno=" + event_eno + ", event_title=" + event_title + ", event_content=" + event_content
			+ ", event_regdate=" + event_regdate + ", event_image=" + event_image + "]";
}

 

}
