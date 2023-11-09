package com.obbang.service.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.reply.ReplyMapper;
import com.obbang.model.Criteria;
import com.obbang.model.PageMakerDTO;
import com.obbang.model.reply.ReplyDTO;
import com.obbang.model.reply.ReplyPageDTO;
import com.obbang.model.reply.UpdateReplyDTO;

@Service
public class ReplySerivceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replymapper;

	/* 댓글등록 */
	@Override
	public int enrollReply(ReplyDTO dto) {

		int result = replymapper.enrollReply(dto);
		
		setRating(dto.getStore_id());

		return result;
	}
	@Override
	public String checkReply(ReplyDTO dto) {
		Integer result = replymapper.checkReply(dto);

		if(result == null) {
			return "0";
		} else {
			return "1";
		}
	}
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();

		dto.setList(replymapper.getReplyList(cri));
		dto.setPageInfo(new PageMakerDTO(cri, replymapper.getReplyTotal(cri.getStore_id())));

		return dto;
	}
	@Override
	public int updateReply(ReplyDTO dto) {

		int result = replymapper.updateReply(dto); 
		
		setRating(dto.getStore_id());

		return result;
	}
	@Override
	public ReplyDTO getUpdateReply(int reply_id) {
		return replymapper.getUpdateReply(reply_id);
	}
	@Override
	public int deleteReply(ReplyDTO dto) {

		int result = replymapper.deleteReply(dto.getReply_id()); 
		
		setRating(dto.getStore_id());

		return result;
	}
	public void setRating(int store_id) {
		Double ratingAvg = replymapper.getRatingAverage(store_id);	

		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}	

		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setStore_id(store_id);
		urd.setRatingAvg(ratingAvg);	

		replymapper.updateRating(urd);		
	}
}
