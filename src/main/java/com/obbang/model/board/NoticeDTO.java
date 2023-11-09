package com.obbang.model.board;

import java.util.Date;

public class NoticeDTO {
	/* 게시판 번호 */
    private int notice_nno;
    
    /* 게시판 제목 */
    private String notice_title;
    
    /* 게시판 내용 */
    private String notice_content;
    
    /* 게시판 작가 */
    private String notice_writer;
    
    /* 등록 날짜 */
    private Date notice_regdate;

    /* 게시판 이미지 */
    private String notice_image;

	public int getNotice_nno() {
		return notice_nno;
	}

	public void setNotice_nno(int notice_nno) {
		this.notice_nno = notice_nno;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public String getNotice_image() {
		return notice_image;
	}

	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_nno=" + notice_nno + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_writer=" + notice_writer + ", notice_regdate=" + notice_regdate
				+ ", notice_image=" + notice_image + "]";
	}

}
