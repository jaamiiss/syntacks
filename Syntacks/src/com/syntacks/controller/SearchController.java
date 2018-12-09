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
public class SearchController {
	@Autowired
	private ApplicationContext context;
	
						//Global Search//
	@RequestMapping(value = "/search", method = RequestMethod.GET, params={"query"})
	public ModelAndView searchPost(@ModelAttribute("SpringWeb")Question question, ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJDBC = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<Question> listquestion= syntacksJDBC.search(request.getParameter("query"));
			
				if(listquestion.isEmpty())
				{
					model.addAttribute("queryNotFound", "Search Results not found:"+" <u><b>"+request.getParameter("query")+"</b></u>");
				}
				else
				{
					model.addAttribute("listquestions", listquestion);
				}
		}
		catch(Exception e)
		{
			model.addAttribute("message","Search Results not Found");
		}
		
		return new ModelAndView("user/index", "command", new Question());
	}
	
								//Tag Search//
	@RequestMapping(value = "/searchTags", method = RequestMethod.GET, params={"query"})
	public ModelAndView searchTag(@ModelAttribute("SpringWeb")Question tag,  ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJDBC = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<Question> listtag = syntacksJDBC.tags(request.getParameter("query"));
		
				if(listtag.isEmpty())
				{
					model.addAttribute("queryNotFound", "Search Results not found:"+" <u><b>"+request.getParameter("query")+"</b></u>");
				}
				else
				{
					model.addAttribute("listtags", listtag);
				}
		}
		catch(Exception e)
		{
			System.out.println(e);
			model.addAttribute("message","Search Results not Found");
		}
		
		return new ModelAndView("user/tags", "command", new Question());
	}
	
					//User Search//
	@RequestMapping(value = "/searchUser", method = RequestMethod.GET, params={"search"})
	public ModelAndView searchUser(@ModelAttribute("SpringWeb")User user, ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<User> listuser= syntacksJdbc.searchUser(request.getParameter("search"));
			model.addAttribute("listusers", listuser);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return new ModelAndView("user/users", "command", new User());
	}
}