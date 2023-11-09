package com.obbang.model.board;

import java.util.Date;

public class BoardDTO {
	/* 게시판 번호 */
    private int board_bno;
    
    /* 게시판 제목 */
    private String board_title;
    
    /* 게시판 내용 */
    private String board_content;
    
    /* 게시판 작가 */
    private String user_id;
    
    /* 등록 날짜 */
    private Date board_regdate;
    
    /* 수정 날짜 */
    private Date board_updateDate;

	/* 댓글 수 */ 
    private int reply_count;
    
    /* 작성자 */ 
    private String user_boardname;
    
    
    
	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_boardname() {
		return user_boardname;
	}

	public void setUser_boardname(String user_boardname) {
		this.user_boardname = user_boardname;
	}

	public int getBoard_bno() {
		return board_bno;
	}

	public void setBoard_bno(int board_bno) {
		this.board_bno = board_bno;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}


	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public Date getBoard_updateDate() {
		return board_updateDate;
	}

	public void setBoard_updateDate(Date board_updateDate) {
		this.board_updateDate = board_updateDate;
	}
	
	
	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_bno=" + board_bno + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", user_id=" + user_id + ", board_regdate=" + board_regdate + ", board_updateDate=" + board_updateDate
				+ ", reply_count=" + reply_count + ", user_boardname=" + user_boardname + "]";
	}
	
}
