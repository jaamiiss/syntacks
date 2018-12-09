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
public class DeleteController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@ModelAttribute("SpringWeb")User user, ModelMap model, HttpServletRequest request)
	{
		try
		{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			System.out.println(request.getParameter("id"));
			int id = Integer.parseInt(request.getParameter("id"));
			int user1 = syntacksJdbc.deleteUser(id);
			model.addAttribute("message", "Questions updated successfully.");
		}
		catch(Exception e)
		{
			System.out.print(e);
			model.addAttribute("message", "Error occured in posting question.");
		}
		
		return new ModelAndView("admin/view-users");
	}
}
