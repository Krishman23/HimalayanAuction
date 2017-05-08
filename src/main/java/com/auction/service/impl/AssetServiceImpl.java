package com.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.auction.dao.AssetRepository;
import com.auction.domain.Asset;
import com.auction.domain.Category;
import com.auction.domain.User;
import com.auction.service.AssetService;
@Service
public class AssetServiceImpl implements AssetService {
	private static final int PAGE_SIZE = 1;
	@Autowired
	AssetRepository assetRepository;
	@Override
	public Asset getAsset(long id) {
		// TODO Auto-generated method stub
		return assetRepository.findOne(id);
}
	@Override
	public Asset save(Asset asset) {
//		 TODO Auto-generated method stub
		return assetRepository.save(asset);
	}

	@Override
	public List<Asset> getAllAssets() {
		// TODO Auto-generated method stub
		return (List<Asset>) assetRepository.findAll();
	}
	@Override
	public List<Asset> getAssetsByUser(User user) {
		// TODO Auto-generated method stub
		return (List<Asset>) assetRepository.findAssetsByUser(user);
	}
	@Override
	public void deleteAsset(long id) {
		// TODO Auto-generated method stub
		assetRepository.delete(id);
	}
	@Override
	public List<Asset> getAssetsByCategory(Category category) {
		// TODO Auto-generated method stub
		return (List<Asset>) assetRepository.findAssetsByCategory(category);
	}
	@Override
	public List<Asset> searchAssets(String searchAssets) {		
		return assetRepository.searchAssets(searchAssets);
	}
	@Override
	public Page<Asset> getAllAssetsPage(Integer pageNumber) {		
		PageRequest request =
	            new PageRequest(pageNumber - 1, PAGE_SIZE, Sort.Direction.DESC, "assetId");
		return assetRepository.findAll(request);
	}

	

}
