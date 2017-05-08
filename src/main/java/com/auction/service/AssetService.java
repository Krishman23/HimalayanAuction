package com.auction.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.auction.domain.Asset;
import com.auction.domain.Category;
import com.auction.domain.User;

public interface AssetService {

List<Asset> getAllAssets();
Asset save(Asset asset);
Asset getAsset(long id);
List<Asset> getAssetsByUser(User user);
void deleteAsset(long id);
List<Asset> getAssetsByCategory(Category category);
List<Asset> searchAssets(String searchAssets);
Page<Asset> getAllAssetsPage(Integer pageNo);
}
