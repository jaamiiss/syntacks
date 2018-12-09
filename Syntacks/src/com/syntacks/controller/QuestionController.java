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
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
public class QuestionController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/questions", method = RequestMethod.GET)
	public ModelAndView questions(@ModelAttribute("SpringWeb")Question question, ModelMap model)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			List<Question> questions= syntacksJdbc.listQuestions();
			model.addAttribute("listquestions", questions);
		}
		
		catch(Exception e)
		{
			model.addAttribute("message", "Error loading questions.");
		}
		
		return new ModelAndView("user/questions", "command", new Question());
	}
}