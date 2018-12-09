package com.syntacks.controller;

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
import com.syntacks.jdbc.SyntacksJdbc;


@Controller
public class PostQuestionController {
	@Autowired
	private ApplicationContext context;
	 
	@RequestMapping(value = "/questions/ask/post", method = RequestMethod.POST,params={"post"})
	public ModelAndView insertQuestion(@ModelAttribute("SpringWeb")Question question, ModelMap model)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			syntacksJdbc.insertquestion(question.getTitle(),question.getContent(),question.getTags(),question.getDate_time(), question.getUsername());
			model.addAttribute("message", "Successfully posted.");
			
		}
		catch(Exception e)
		{
			System.out.print(e);
			model.addAttribute("message", "Error occured in posting question.");
		}
		
		return new ModelAndView("user/ask", "command", new Question());
	}
	
	@RequestMapping(value = "/questions/ask/post", method = RequestMethod.POST,params={"update"})
	public ModelAndView updatQuestion(@ModelAttribute("SpringWeb")Question question, ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			System.out.println(request.getParameter("title"));
			syntacksJdbc.updatequestion(request.getParameter("id"), question.getTitle(),question.getContent(),question.getTags());
			model.addAttribute("message", "Questions updated successfully.");
		}
		catch(Exception e)
		{
			model.addAttribute("message", "Error occured in posting question.");
		}
		
		return new ModelAndView("user/ask", "command", new Question());
	}
}
