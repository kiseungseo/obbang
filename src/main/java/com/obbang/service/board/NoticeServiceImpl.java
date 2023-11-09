package com.obbang.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.board.NoticeMapper;
import com.obbang.model.board.Criteria;
import com.obbang.model.board.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired 
	private NoticeMapper mapper;

	@Override
	public void enroll(NoticeDTO notice) {

		mapper.enroll(notice);

	}
	//게시판 리스트
	@Override
	public List<NoticeDTO> getList() {

		return mapper.getList();
	}
	  /* 게시판 조회 */
    @Override
    public NoticeDTO getPage(int notice_nno) {
         
        return mapper.getPage(notice_nno);
    }
    /* 게시판 수정 */
    @Override
    public int modify(NoticeDTO notice) {
        
        return mapper.modify(notice);
    }
    /* 게시판 삭제 */
    @Override
    public int delete(int notice_nno) {
        
        return mapper.delete(notice_nno);
    }    
 
    /* 게시판 목록(페이징 적용) */
	@Override
    public List<NoticeDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    } 
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    }

	    
}
