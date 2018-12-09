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
import com.syntacks.entities.Reply;
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
public class ReplyController {
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value ="/reply", method = RequestMethod.POST)
	public ModelAndView reply(@ModelAttribute("SpringWeb")Reply reply, ModelMap model)
	{
		try{
			SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			syntacksJdbc.insertreply(reply.getReply_id(), reply.getTopic_id(), reply.getUser(), reply.getComments(), reply.getDate_reply());
			System.out.print("safd");
		}
		catch(Exception e)
		{
			System.out.print("safd");
			System.out.print(e);
			model.addAttribute("message", "Error adding comment");
		}
		return new ModelAndView("redirect:/view?id="+ reply.getTopic_id());
	}
}
