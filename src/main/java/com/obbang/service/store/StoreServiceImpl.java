package com.obbang.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.image.ImageMapper;
import com.obbang.mapper.store.StoreMapper;
import com.obbang.model.Criteria;
import com.obbang.model.image.ImageVO;
import com.obbang.model.store.StoreVO;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class StoreServiceImpl implements StoreService{
	@Autowired
	StoreMapper mapper;
	@Autowired
	ImageMapper imageMapper;

	public StoreServiceImpl() {
		System.out.println("Spring Service 자동생성");
	}
	@Override
	public List<StoreVO> StoreGetList(Criteria cri) {
		log.info("StoreGetList().........");
		List<StoreVO> list = mapper.StoreGetList(cri);
		
		list.forEach(store -> {
			
			int store_id = store.getStore_id();
			
			List<ImageVO> imageList = imageMapper.storeGetImageList(store_id);
			
			store.setImageList(imageList);
			
		});
		return list;
	}
	@Override
	public int StoreGetTotal(Criteria cri) {
		log.info("StoreGetTotal().........");
		return mapper.StoreGetTotal(cri);
	}
	@Override
	public int StoreGetTotalMenu(Criteria cri) {
		log.info("StoreGetTotalMenu().........");
		return mapper.StoreGetTotalMenu(cri);
	}
	/* 상품 조회 페이지 */
	@Override
	public StoreVO StoreGetDetail(int store_id) {

		log.info("(service)StoreGetDetail......." + store_id);

		return mapper.StoreGetDetail(store_id);
	}
	/*상품 조회*/
	@Override
	public List<StoreVO> storeGet(Criteria cri) {
		log.info("StoreGet().........");
		List<StoreVO> list = mapper.storeGet(cri);
		list.forEach(menu -> {
			
			int menu_id = menu.getMenu_id();
			List<ImageVO> imageList = imageMapper.menuGetImageList(menu_id);
			
			menu.setImageList(imageList);
			
		});
		return list;
	}
	//카테고리	
	@Override
	public StoreVO categoryGet(StoreVO vo) {
		log.info("categoryGet()........");
		return mapper.categoryGet(vo);
	}
	//점포 리스트
	@Override
	public List<StoreVO> StoreGetListAdmin(Criteria cri) {
		log.info("StoreGetListAdmin().........");
		return mapper.StoreGetListAdmin(cri);
	}
	//상품 리스트
	@Override
	public List<StoreVO> menuGet(Criteria cri) {
		log.info("MenuGet().........");
		return mapper.menuGet(cri);
	}
	//점포
	@Override
	public int StoreGetTotaladmin(Criteria cri) {
		log.info("StoreGetTotaladmin().........");
		return mapper.StoreGetTotaladmin(cri);

	}@Override
	public StoreVO menuGetDetail(int menu_id) {
		log.info("(service)MenuGetDetail......." + menu_id);
		return mapper.menuGetDetail(menu_id);
	}
	@Override
	public StoreVO getStoreIdName(int store_id) {
		
		return mapper.getStoreIdName(store_id);
	}
 @Override
public List<StoreVO> menuGetimage(Criteria cri) {
	 log.info("menuGetimage().........");
		List<StoreVO> list = mapper.menuGetimage(cri);
		list.forEach(menu -> {
			
			int menu_id = menu.getMenu_id();
			List<ImageVO> imageList = imageMapper.menuGetImageList(menu_id);
			
			menu.setImageList(imageList);
			
		});
		return list;
}
 @Override
public List<StoreVO> StoreGetimage(Criteria cri) {
	 log.info("StoreGetimage().........");
		List<StoreVO> list = mapper.StoreGetimage(cri);
		list.forEach(menu -> {
			
			int store_id = menu.getStore_id();
			List<ImageVO> imageList = imageMapper.storeGetImageList(store_id);
			
			menu.setImageList(imageList);
			
		});
		return list;
}
}
