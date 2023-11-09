package com.obbang.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.reply.ReplyMapper;
import com.obbang.model.reply.ReplyDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void replyEnrollTest() {
		
		String id = "hong";
		int store_id = 31;
		double rating = 3.5;
		String content = "댓글 테스트";
		
		ReplyDTO dto = new ReplyDTO();
		dto.setStore_id(store_id);
		dto.setUser_id(id);
		dto.setRating(rating);
		dto.setContent(content);
		
		mapper.enrollReply(dto);
		
		
	}
}
