package com.obbang.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.obbang.mapper.admin.AdminMapper;
import com.obbang.model.Criteria;
import com.obbang.model.image.ImageVO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.store.StoreVO;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminmapper;
	
	//점포 등록
	@Transactional
	@Override
	public void storeEnroll(StoreVO store) {
		log.info("(service)storeEnroll......");
		adminmapper.storeEnroll(store);
		
		if(store.getImageList() == null || store.getImageList().size() <=0) {
			return;
		}
		for(ImageVO attach : store.getImageList()) {
			attach.setStore_id(store.getStore_id());
			adminmapper.storeImageEnroll(attach);
		}
		/*
		 * store.getImageList().forEach(attach ->{
		 * attach.setStore_id(store.getStore_id());
		 * adminmapper.storeImageEnroll(attach); });
		 */
	}
	//상품 등록
	@Transactional
	@Override
	public void menuEnroll(StoreVO store) {
		log.info("(service)menuEnroll......");
		adminmapper.menuEnroll(store);
		if(store.getImageList() == null || store.getImageList().size() <=0) {
			return;
		}
		for(ImageVO attach : store.getImageList()) {
			attach.setMenu_id(store.getMenu_id());
			adminmapper.menuImageEnroll(attach);
		}
	}
	//점포 수정
	@Transactional
	@Override
	public int storeModify(StoreVO vo) {
		int result = adminmapper.storeModify(vo);
		if(result==1&& vo.getImageList() != null && vo.getImageList().size() > 0) {
			adminmapper.storeDeleteImageAll(vo.getStore_id());
			vo.getImageList().forEach(attach -> {
				
				attach.setStore_id(vo.getStore_id());
				adminmapper.storeImageEnroll(attach);
				
			});
		}
		return result;
	}
	//상품 수정
	@Transactional
	@Override
	public int menuModify(StoreVO vo) {
		log.info("(service)menuModify......");
		int result = adminmapper.menuModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminmapper.menuDeleteImageAll(vo.getMenu_id());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setMenu_id(vo.getMenu_id());
				adminmapper.menuImageEnroll(attach);
				
			});
			
		}
		
		return result;
	}
	//점포 삭제
	@Override
	public int storeDelete(int store_id) {
		log.info("(service)storeDelete......");
		return adminmapper.storeDelete(store_id);
	}
	//상품 삭제
	@Override
	public int menuDelete(int menu_id) {
		log.info("(service)menuDelete......");
		return adminmapper.menuDelete(menu_id);
	}
	
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return adminmapper.getOrderList(cri);
	}
	@Override
	public int getOrderTotal(Criteria cri) {
		return adminmapper.getOrderTotal(cri);
	}
	/* 지정 상품 이미지 정보 얻기 */
	@Override
	@Transactional
	public List<ImageVO> getStoreInfo(int store_id) {
		
		log.info("getAttachInfo........");
		adminmapper.storeDeleteImageAll(store_id);
		return adminmapper.getStoreInfo(store_id);
	}
	@Override
	public List<ImageVO> getMenuInfo(int menu_id) {
		log.info("getAttachInfo........");
		adminmapper.menuDeleteImageAll(menu_id);
		return adminmapper.getMenuInfo(menu_id);
	}
}
