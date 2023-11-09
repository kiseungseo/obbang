package com.obbang.mapper.admin;

import java.util.List;

import com.obbang.model.Criteria;
import com.obbang.model.image.ImageVO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.store.StoreVO;

public interface AdminMapper {
	
	/* 점포 등록 */
	public void storeEnroll(StoreVO store);
	/* 상품 등록 */
	public void menuEnroll(StoreVO store);
	/* 점포 수정 */
	public int storeModify(StoreVO vo);
	/* 점포 수정 */
	public int menuModify(StoreVO vo);
	/* 점포 정보 삭제 */
	public int storeDelete(int store_id);
	/* 상품 정보 삭제 */
	public int menuDelete(int menu_id);
	/* 점포 이미지 등록 */
	public void storeImageEnroll(ImageVO vo);
	/* 점포 이미지 등록 */
	public void storeLogoImageEnroll(ImageVO vo);
	/* 상품 이미지 등록 */
	public void menuImageEnroll(ImageVO vo);
	
	
	/* 지정 점포 이미지 전체 삭제 */
	public void storeDeleteImageAll(int store_id);
	/* 지정 점포 이미지 전체 삭제 */
	public void menuDeleteImageAll(int menu_id);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);	
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 어제자 날짜 이미지 리스트 */
	public List<ImageVO> storeCheckFileList();
	/* 어제자 날짜 이미지 리스트 */
	public List<ImageVO> menuCheckFileList();
	/* 지정 상품 이미지 정보 얻기 */
	public List<ImageVO> getStoreInfo(int store_id);
	/* 지정 상품 이미지 정보 얻기 */
	public List<ImageVO> getMenuInfo(int menu_id);
}
