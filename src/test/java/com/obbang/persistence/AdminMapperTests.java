package com.obbang.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.obbang.mapper.admin.AdminMapper;
import com.obbang.mapper.store.StoreMapper;
import com.obbang.model.image.ImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private StoreMapper store;
	
//	@Test
//	public void storeEnrollTest() throws Exception{
//		StoreVO store = new StoreVO();
//		
//		store.setStore_store("mapper 테스트");
//		store.setMenu_menu("test");
//		store.setMenu_price(1000);
//		System.out.println("Before BookVO :" + store);
//		mapper.menuEnroll(store);
//		System.out.println("After BookVO :" + store);
//	}
//	/* 상품 조회 페이지 */
//	@Test
//	public void goodsGetDetailTest() {
//		
//		int bookId = 150;
//		
//		StoreVO result = store.StoreGetDetail(bookId);
//		
//		System.out.println("상품 조회 데이터 : " + result);
//	}
	/* 상품 정보 수정 */
//	@Test
//	public void goodsModifyTest() {
//		
//		StoreVO book = new StoreVO();
//		
//		book.setStore_id(1);
//		book.setStore_store("스타벅스");
//		book.setStore_adress("종각역");
//		book.setStore_tel("111-1111");
//		book.setStore_info("커피집입니다");
//		book.setStore_category("coffee");
//		
//		mapper.storeModify(book);
//		
//	}
	/* 상품 정보 삭제 */
//	@Test
//	public void goodsDeleteTest() {
//		
//		int bookId = 107;
//		
//		int result = mapper.storeDelete(bookId);
//		
//		if(result == 1) {
//			System.out.println("삭제 성공");
//		}
//		
//	}
	/* 이미지 등록 */
//	@Test
//	public void imageEnrollTest() {
//		
//		ImageVO vo = new ImageVO();
//		
//		vo.setMenu_id(44);
//		vo.setFileName("test");
//		vo.setUploadPath("test");
//		vo.setUuid("test2");
//		
//		mapper.menuImageEnroll(vo);
//	}
	/* 지정 상품 이미지 삭제 */
//	@Test
//	public void deleteImageAllTest() {
//		
//		int menu_id = 44;
//		
//		mapper.menuDeleteImageAll(menu_id);
//		
//	}
	/* 어제자 날짜 이미지 리스트 */
//	@Test
//	public void checkImageListTest() {
//		
//		mapper.storeCheckFileList();
//		
//	}
	/* 지정 상품 이미지 정보 얻기 */
	@Test
	public void getAttachInfoTest() {
		
		int menu_id = 50;
		
		List<ImageVO> list = mapper.getMenuInfo(menu_id);
		
		System.out.println("list : " + list);
		
	}
}
