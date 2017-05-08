package com.auction.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.auction.domain.Admin;
import com.auction.domain.AdminCredential;
import com.auction.domain.User;
import com.auction.service.AdminService;
import com.auction.service.UserService;

@Controller
@SessionAttributes("adminlogin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	ServletContext servletContext;

	@Autowired
	UserService userService;

	@RequestMapping(value = { "/adminDashboard" })
	public String adminDashboard() {
		return "dashboard";
	}

	@RequestMapping(value = { "/adminLogin" }, method = RequestMethod.GET)
	public String adminLogin(@ModelAttribute("adminForm") AdminCredential adminCredential, Model model) {
		model.addAttribute("message", "Please enter the user credentials.");
		return "adminloginpage";
	}

	@RequestMapping(value = { "/adminLogin" }, method = RequestMethod.POST)
	public String checkLogin(@Valid @ModelAttribute("adminForm") AdminCredential adminCredent, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			return "adminloginpage";
		} else {

			Long status = adminService.AdminValidation(adminCredent);
			System.out.println(status);
			System.out.println("Status" + status);
			if (status != 0l) {

				Admin admin = adminService.findOne(status);
				System.out.println("UserName" + admin);

				return "forward:/adminDashboard";
			} else {
				model.addAttribute("message", "Wrong username and password. Try Again");
				return "adminloginpage";
			}
		}
	}

	@RequestMapping(value = { "/adminRegister" }, method = RequestMethod.GET)
	public String getAdminRegister(@ModelAttribute("admin") Admin admin, Model model) {

		return "AdminRegister";
	}

	@RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
	public String saveAdmin(@Valid @ModelAttribute("admin") Admin adminSave, BindingResult result,
			RedirectAttributes redirectAttribute, Model model) {

		if (result.hasErrors()) {
			return "AdminRegister";
		}
		adminService.saveAdmin(adminSave);
		return "redirect:/adminList";
	}

	@RequestMapping(value = { "/adminList" })
	public String getAdmin(Model model, Admin admin) {
		List<Admin> admins = (List<Admin>) adminService.findAll();
		model.addAttribute("admins", admins);
		return "AdminList";
	}

	@RequestMapping(value = { "/adminDetail" })
	public String getAdminDetails(Model model, Admin admin) {
		return "AdminDetail";
	}

	@RequestMapping(value = "/editAdmin", method = RequestMethod.GET)
	public String editAdminGet(@ModelAttribute("admin") Admin admin, @RequestParam("id") long adminId, Model model) {

		model.addAttribute("admin", adminService.findOne(adminId));
		return "AdminRegister";
	}

	@RequestMapping(value = "/editAdmin", method = RequestMethod.POST)
	public String editAdminPost(@ModelAttribute("admin") Admin admin, @RequestParam("id") long adminId, Model model) {
		model.addAttribute("admin", adminService.findOne(adminId));
		adminService.saveAdmin(adminService.findOne(adminId));
		return "AdminRegister";
	}

	@RequestMapping(value = "/deleteAdminList", method = RequestMethod.GET)
	public String deleteAdminList(@RequestParam("id") long adminId, Admin admin, Model model) {

		adminService.delete(adminId);
		return "redirect:adminList";
	}

	@RequestMapping(value = "/adminlogout", method = RequestMethod.POST)
	public String logout(HttpSession session, SessionStatus status) {
		session.invalidate();
		return "redirect:/adminLogin";
	}

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String getUserList(Model model, User user) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "UserDetail";
	}

	@RequestMapping(value = "/deleteUserList", method = RequestMethod.GET)
	public String delteUser(@RequestParam("id") long userId, User user, Model model) {

		userService.delete(userId);
		return "redirect:userList";

	}

}
