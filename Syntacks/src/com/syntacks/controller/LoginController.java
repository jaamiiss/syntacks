package com.syntacks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;




import com.syntacks.entities.User;


@Controller

public class LoginController {
	  @Autowired
	   private ApplicationContext context;
	
	  @RequestMapping(value={"/login"}, method=RequestMethod.GET)
		public ModelAndView login(
				@RequestParam(value =	 "error", required = false) String error,
				@RequestParam(value = "logout", required = false) String logout)
		{
			ModelAndView model = new ModelAndView();
			if (error != null) {
				model.addObject("error", "Invalid username and password!");
			}
	 
			if (logout != null) {
				model.addObject("msg", "You've been logged out successfully.");
			}
			model.setViewName("user/login");
			return model;
		}
}
