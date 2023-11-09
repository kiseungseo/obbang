package com.obbang.model.board;

import java.util.Date;

public class BoardReplyDTO {
	
	private int reply_rno;
	
	private int board_bno;
	
	private String user_id;
	
	private String reply_content;
	
	private Date reply_regDate;
	
	private String user_replyname;
	


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_replyname() {
		return user_replyname;
	}

	public void setUser_replyname(String user_replyname) {
		this.user_replyname = user_replyname;
	}

	public int getReply_rno() {
		return reply_rno;
	}

	public void setReply_rno(int reply_rno) {
		this.reply_rno = reply_rno;
	}

	public int getBoard_bno() {
		return board_bno;
	}

	public void setBoard_bno(int board_bno) {
		this.board_bno = board_bno;
	}
	

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_regDate() {
		return reply_regDate;
	}
	
	public void setReply_regDate(Date reply_regDate) {
		this.reply_regDate = reply_regDate;
	}

	@Override
	public String toString() {
		return "BoardReplyDTO [reply_rno=" + reply_rno + ", board_bno=" + board_bno + ", user_id=" + user_id
				+ ", reply_content=" + reply_content + ", reply_regDate=" + reply_regDate + ", user_replyname="
				+ user_replyname + "]";
	}

}
