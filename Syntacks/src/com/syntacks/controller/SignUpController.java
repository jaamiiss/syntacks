package com.syntacks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.syntacks.entities.Question;
import com.syntacks.entities.User;
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
public class SignUpController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView registration() {		
		return new ModelAndView("user/signup", "command", new User());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST,params={"signup"})
	public ModelAndView addPerson(@ModelAttribute("SpringWeb")User user, ModelMap model)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			syntacksJdbc.insert(user.getUsername(), user.getPassword(), user.getEmail());
			model.addAttribute("message", "Successfully Registered!");
		}
		catch(Exception e)
		{
			model.addAttribute("message", "Please fill in the fields correctly.");
		}
		
		return new ModelAndView("user/signup", "command", new User());
	}
}
