package com.obbang.persistence;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.store.StoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class StoreMapperTests {
	@Autowired
	private StoreMapper mapper;

	/* 상품 리스트 & 상품 총 갯수 */
//	@Test
//	public void goodsGetListTest() {
//
//		Criteria cri = new Criteria();

//		/* 검색조건 */
//		cri.setKeyword("테스트");
//
//				/* 검색 리스트 */
//				List<StoreVO> list = mapper.StoreGetList(cri);
//				for(int i = 0; i < list.size(); i++) {
//					System.out.println("result......." + i + " : " + list.get(i));
//				}
//				
//				/* 상품 총 갯수 */
//				int result = mapper.StoreGetTotal(cri);
//				System.out.println("resutl.........." + result);
//				
//			}
//		/* 상품 조회 페이지 */
//			@Test
//			public void goodsGetDetailTest() {
//				
//				int bookId = 1;
//				
//				StoreVO result = mapper.StoreGetDetail(bookId);
//				
//				System.out.println("상품 조회 데이터 : " + result);
//			}
//	}
	
		
}
