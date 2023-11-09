package com.obbang.model.reply;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class ReplyDTO {
	
	private int reply_id;
	
	private int store_id;
	
	private String user_id;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;
	
	private String content;
	
	private double rating;
}
