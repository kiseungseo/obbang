package com.obbang.mapper.member;

import java.util.List;

import com.obbang.model.member.MemberVO;

public interface MemberMapper {
	
	//회원가입
		public void memberJoin(MemberVO member);
		
		// 아이디 중복 검사
		public int idCheck(String user_id);
		
		
		 /* 로그인 */
	    public MemberVO memberLogin(MemberVO member);
	    
	    /* 회원 목록 */
	    public List<MemberVO> getList();
	    

	    /* 회원 조회 */
	    public MemberVO getMember(int user_bno);
	    
	    /* 회원 수정 */
	    public int modify(MemberVO member);
	    
	    /* 게시판 삭제 */
	    public int delete(int user_bno);
	    
	    public MemberVO memberIdSearch(MemberVO searchVO);
	    
	    
	    public MemberVO memberPwSearch(MemberVO searchVO);
		
	    /* 주문자 정보 */
		public MemberVO getMemberInfo(String user_id);

}

	  


