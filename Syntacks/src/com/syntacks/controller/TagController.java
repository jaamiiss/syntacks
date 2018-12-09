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
public class TagController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/tags", method = RequestMethod.GET)
	public ModelAndView tags(@ModelAttribute("SpringWeb")Question tag, ModelMap model) {		
		 
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<Question> listtag= syntacksJdbc.listTags();
			model.addAttribute("listtags", listtag);
		}
		
		catch(Exception e)
		{
			model.addAttribute("message", "Error loading tags.");
			System.out.print(e);
			System.out.print(e.getMessage());
		}
		
		return new ModelAndView("user/tags", "command", new User());
	}
}
