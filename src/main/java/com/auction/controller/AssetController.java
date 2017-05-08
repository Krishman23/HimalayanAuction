package com.auction.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import com.auction.domain.Asset;
import com.auction.domain.Category;
import com.auction.domain.ProductImage;
import com.auction.domain.User;
import com.auction.enums.Status;
import com.auction.service.AssetService;
import com.auction.service.CategoryService;
import com.auction.service.UserService;

@Controller

public class AssetController {
	@Autowired
	AssetService assetService;
	@Autowired
	ServletContext servletContext;
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService userService;
	Map<Long, String> categories = new HashMap<Long, String>();

	@RequestMapping(value = "/Asset/addAsset", method = RequestMethod.GET)
	public String addAsset(@ModelAttribute("addAsset") Asset asset, Model model) {

		User user = new User();

		user = userService.getUserByUserId(1l);
		Enum[] statusArray = Status.values();
		List<Category> categoriesList = categoryService.findAll();
		for (Category category : categoriesList) {
			categories.put(category.getCategoryId(), category.getName());
		}
		model.addAttribute("categories", categories);
		model.addAttribute("statusArray", statusArray);
		return "addAssetForm";

	}

	@RequestMapping(value = "/Asset/addAsset", method = RequestMethod.POST)
	public String saveAsset(@Valid @ModelAttribute("addAsset") Asset asset, BindingResult result, Model model,
			@RequestParam(value = "picture", defaultValue = "") CommonsMultipartFile[] picture)
			throws FileNotFoundException {
		if (result.hasErrors()) {
			List<Category> categoriesList = categoryService.findAll();
			for (Category category1 : categoriesList) {
				categories.put(category1.getCategoryId(), category1.getName());
			}
			model.addAttribute("categories", categories);
			return "addAssetForm";
		}
		Category category = asset.getCategory();
		category = categoryService.findOne(category.getCategoryId());
		asset.setCategory(category);

		User user = asset.getUser();
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userService.getUserByUserCredentialUserName(username);
		asset.setUser(user);
		System.out.println("Country:-----" + user.getCountry());
		System.out.println("name:-----" + username);
		MultipartFile[] productImage = picture;
		List<ProductImage> prodlist = new ArrayList<>();
		for (int i = 0; i < picture.length; i++) {
			ProductImage prod_img = new ProductImage();
			prod_img.setProductName(productImage[i].getOriginalFilename());
			prod_img.setAsset(asset);
			prodlist.add(prod_img);
		}

		asset.setProductImage(prodlist);
		asset = assetService.save(asset);

		System.out.println("picture  " + picture);
		String rootDirectory = servletContext.getRealPath("/");
		String separator = File.separator;
		for (int i = 0; i < productImage.length; i++) {
			if (productImage[i] != null && !productImage[i].isEmpty()) {
				try {
					productImage[i].transferTo(new File(rootDirectory + separator + "resources" + separator + "img"
							+ separator + "assets" + separator + productImage[i].getOriginalFilename()));
				} catch (Exception e) {
					throw new FileNotFoundException("Unable to save image: " + productImage[i].getOriginalFilename());
				}
			}
		}
		return "redirect:/";
	}

	@RequestMapping("/Assets")
	public String getAsstes() {
		List<Asset> assets = assetService.getAllAssets();
		return "home";
	}

	@RequestMapping(value = "/Asset/{id}/edit", method = RequestMethod.GET)
	public String editAsset(@PathVariable("id") long id, @ModelAttribute("editAsset") Asset asset, Model model) {

		User user = asset.getUser();
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userService.getUserByUserCredentialUserName(username);

		if (user.getUserId() >= 0) {
			Enum[] statusArray = Status.values();
			model.addAttribute("statusArray", statusArray);
			asset = assetService.getAsset(id);
			asset.setUser(user);// todo
			model.addAttribute("asset", asset);

			List<Category> categoriesList = categoryService.findAll();
			for (Category category : categoriesList) {
				categories.put(category.getCategoryId(), category.getName());
			}
			model.addAttribute("categories", categories);

			Long assetCategoryId = asset.getCategory().getCategoryId();
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

			model.addAttribute("bidEndDate", sdf.format(asset.getBidEndDate()));
			model.addAttribute("bidStartDate", sdf.format(asset.getBidStartDate()));
			System.out.println(assetCategoryId);
			model.addAttribute("assetCategoryId", assetCategoryId);
			model.addAttribute("assetUserId", asset.getUser().getUserId());
			model.addAttribute("savedPictures", "assets_" + asset.getAssetId());
			return "editAssetForm";
		} else {
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/Asset/{id}/edit", method = RequestMethod.POST)
	public String updateAsset(@Valid @ModelAttribute("editAsset") Asset asset, BindingResult result, Model model,
			@RequestParam(value = "pictures", defaultValue = "") CommonsMultipartFile[] pictures)
			throws FileNotFoundException {
		// @ModelAttribute("editAsset") Asset asset, Model model,

		if (result.hasErrors()) {
			List<Category> categoriesList = categoryService.findAll();
			for (Category category1 : categoriesList) {
				categories.put(category1.getCategoryId(), category1.getName());
			}
			model.addAttribute("categories", categories);
			return "editAssetForm";
		}
		Category category = asset.getCategory();
		category = categoryService.findOne(asset.getCategory().getCategoryId());
		asset.setCategory(category);
		User user = asset.getUser();
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userService.getUserByUserCredentialUserName(username);
		asset.setUser(user);
		asset = assetService.save(asset);
		String separator = File.separator;
		MultipartFile[] productImage = pictures;

		System.out.println("Pictures " + pictures);

		String rootDirectory = servletContext.getRealPath("/");
		// isEmpty means file exists BUT NO Content
		for (int i = 0; i < productImage.length; i++) {
			if (productImage[i] != null && !productImage[i].isEmpty()) {
				try {
					String fileName = productImage[i].getOriginalFilename();
					int lastIndex = fileName.lastIndexOf('.');
					String extension = fileName.substring(lastIndex, fileName.length());
					System.out.println("mime type " + extension);
					productImage[i].transferTo(new File(rootDirectory + separator + "resources" + separator + "img"
							+ separator + "assets" + separator + "assets_" + asset.getAssetId() + "_" + i + extension));
				} catch (Exception e) {
					System.out.println(e.getMessage());
					throw new FileNotFoundException("Unable to save image: " + productImage[i].getOriginalFilename());
				}
			}
		}
		return "redirect:/";

	}

	@RequestMapping("/Assets/User/{userId}")
	public String assetUser(@PathVariable("userId") int userId, Model model) {
		User user = new User();
		user = userService.getUserByUserId((Long) model.asMap().get("userlogin"));
		List<Asset> assets = assetService.getAssetsByUser(user);
		System.out.println(assets.get(0).getBrand());
		return "productdetail";
	}

	@RequestMapping("/Assets/Category/{categoryId}")
	public String assetCategory(@PathVariable("categoryId") int categoryId) {
		// System.out.println(as.get(0).getBrand());
		Category category = categoryService.findOne(categoryId);
		List<Asset> assets = assetService.getAssetsByCategory(category);
		System.out.println(assets.get(0).getBrand());
		return "productdetail";
	}

	@RequestMapping("/Asset/{id}/delete")
	public String deleteAsset(@PathVariable("id") int id, Model model) {
		User user = new User();
		long userid = (long) model.asMap().get("userlogin");
		if (userid >= 0) {
			user = userService.getUserByUserId(userid);
			assetService.deleteAsset(id);
			return "redirect:/Asset/addAsset";
		} else {
			return "redirect:/";
		}
	}
}
