package com.obbang.service.admin;

import java.util.List;

import com.obbang.model.Criteria;
import com.obbang.model.image.ImageVO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.store.StoreVO;

public interface AdminService {
	/* 점포 등록 */
	public void storeEnroll(StoreVO store);
	/* 상품 등록 */
	public void menuEnroll(StoreVO store);
	/* 점포 수정 */
	public int storeModify(StoreVO vo);
	/* 상품 수정 */
	public int menuModify(StoreVO vo);
	/* 점포 정보 삭제 */
	public int storeDelete(int store_id);
	/* 상품 정보 삭제 */
	public int menuDelete(int menu_id);
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 지정 상품 이미지 정보 얻기 */
	public List<ImageVO> getStoreInfo(int store_id);
	/* 지정 상품 이미지 정보 얻기 */
	public List<ImageVO> getMenuInfo(int menu_id);
}
