package com.obbang.model.reply;

import java.util.List;

import com.obbang.model.PageMakerDTO;

import lombok.Data;

@Data
public class ReplyPageDTO {
	List<ReplyDTO> list;

	PageMakerDTO pageInfo;
}
