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

import com.syntacks.entities.Question;
import com.syntacks.entities.User;
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
public class AdminController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/view-questions")
	public ModelAndView profile(@ModelAttribute("SpringWeb")Question question, 
	ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<Question> listquestion = syntacksJdbc.listQuestions();
			model.addAttribute("listquestions", listquestion);
		}
		catch(Exception e)
		{
			model.addAttribute("message", "Error occured in viewing profile.");
		}
		
		return new ModelAndView("admin/viewquestions", "command", new Question());
	}
	
	@RequestMapping(value = "/view-tags")
	public ModelAndView viewTags(@ModelAttribute("SpringWeb")Question question, 
	ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			System.out.println(request.getParameter("user"));
			List<Question> listuserquestion = syntacksJdbc.viewUserPost(request.getParameter("user"));
			model.addAttribute("listuserquestions", listuserquestion);
		}
		catch(Exception e)
		{
			model.addAttribute("message", "Error occured in viewing profile.");
		}
		
		return new ModelAndView("admin/viewtags", "command", new Question());
	}
	
	@RequestMapping(value = "/view-users")
	public ModelAndView viewUsers(@ModelAttribute("SpringWeb")Question question, 
	ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<User> listuser= syntacksJdbc.listUsers();
			model.addAttribute("listusers", listuser);
		}
		catch(Exception e)
		{
			System.out.print(e);
			model.addAttribute("message", "Error loading users.");
		}
		
		return new ModelAndView("admin/viewusers", "command", new Question());
	}
	
	
}
