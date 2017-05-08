package com.auction.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.auction.dao.CategoryRepository;
import com.auction.domain.Category;
import com.auction.service.CategoryService;

@Controller
@SessionAttributes("adminlogin")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = { "/displayCategory" }, method = RequestMethod.GET)
	public String getCategoryForm(@ModelAttribute("categoryform") Category category, Model model) {

		return "categoryForm";
	}

	@RequestMapping(value = { "/displayCategory" }, method = RequestMethod.POST)
	public String saveCategory(@Valid @ModelAttribute("categoryform") Category category, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "categoryForm";
		}

		categoryService.save(category);
		System.out.println("Saved");
		return "redirect:categoryList";
	}

	@RequestMapping(value = "/categoryList")
	public String getCategoryListByID(Model model) {

		List<Category> categories = (List<Category>) categoryService.findAll();
		System.out.println(categories.get(0).getDescription());
		System.out.println("ID " + categories.get(0).getCategoryId());
		model.addAttribute("categories", categories);
		return "categoryList";
	}

	@RequestMapping(value = "/deleteCategoryList", method = RequestMethod.GET)
	public String deleteCategoryList(@RequestParam("id") long categoryId, Category category) {
		categoryService.delete(categoryId);
		System.out.println("Hello Delete ");
		return "redirect:categoryList";
	}

	@RequestMapping(value = "/editList", method = RequestMethod.GET)
	public String editCategoryList(@ModelAttribute("categoryform") Category category,
			@RequestParam("id") long categoryId, Model model) {

		model.addAttribute("category", categoryService.findOne(categoryId));
		model.addAttribute("addedit", "edit");
		System.out.println("Hello List");

		return "categoryForm";
	}

	@RequestMapping(value = "/editList", method = RequestMethod.POST)
	public String editCategoryList1(@ModelAttribute("categoryform") Category category,
			@RequestParam("id") long categoryId, Model model) {

		System.out.println(categoryId);

		model.addAttribute("category", categoryService.findOne(categoryId));
		categoryService.save(categoryService.findOne(categoryId));
		model.addAttribute("addedit", "edit");
		System.out.println("Hello List");

		return "categoryForm";
	}

}
