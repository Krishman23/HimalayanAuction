package com.auction.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.auction.domain.User;
import com.auction.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	ServletContext servletContext;

	/* user registration */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(@ModelAttribute("registerNewUser") User newUser, Model model) {
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerNewUser(@Valid @ModelAttribute("registerNewUser") User newUser, BindingResult result,
			@RequestParam(value = "picture", defaultValue = "") CommonsMultipartFile picture, Model model)
			throws FileNotFoundException {
		if (result.hasErrors()) {
			return "register";
		}

		newUser = userService.addUser(newUser);

		MultipartFile userImage = picture;
		String separator = File.separator;

		String rootDirectory = servletContext.getRealPath("/");
		if (userImage != null && !userImage.isEmpty()) {
			try {
				userImage.transferTo(new File(rootDirectory + "resources" + separator + "img" + separator + "users_"
						+ newUser.getUserId() + ".jpg"));
			} catch (Exception e) {
				throw new FileNotFoundException("Unable to save image: " + userImage.getOriginalFilename());
			}
		}
		return "redirect:/users";
	}

	/* SHOW USER HOME */
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String showUserProfile(HttpServletRequest request, Model model) {
		Principal principal = request.getUserPrincipal();
		String uname = principal.getName();
		User loggedUser = userService.getUserByUserCredentialUserName(uname);
		model.addAttribute("usercredit", userService.getUserByUserName(uname));
		model.addAttribute("user", loggedUser);
		return "users";
	}

	/* USER EDIT */
	@RequestMapping(value = "users/{id}/edit", method = RequestMethod.GET)
	public String getUserEdit(@PathVariable("id") Long id, @ModelAttribute("editUser") User user, Model model) {
		model.addAttribute("user", userService.getUserByUserId(id));
		return "userEditForm";
	}

	@RequestMapping(value = "users/{id}/edit", method = RequestMethod.POST)
	public String setUserEdit(@PathVariable("id") Long id, @ModelAttribute("editUser") User user, Model model) {
		user.setUserCredential(userService.getUserByUserName(user.getUserCredential().getUserName()));
		userService.addUser(user);
		return "redirect:/users";
	}
}