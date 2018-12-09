package com.syntacks.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.syntacks.entities.User;
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
public class UserController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView displayUser(@ModelAttribute("SpringWeb")User user, ModelMap model)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<User> listuser= syntacksJdbc.listUsers();
			model.addAttribute("listusers", listuser);
		}
		catch(Exception e)
		{
			model.addAttribute("message", "Error loading users.");
		}
		
		return new ModelAndView("user/users", "command", new User());
	}
	
}