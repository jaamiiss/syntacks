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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.syntacks.dao.SyntacksDao;
import com.syntacks.entities.Question;
import com.syntacks.entities.Reply;
import com.syntacks.entities.User;
import com.syntacks.jdbc.SyntacksJdbc;

@Controller
@SessionAttributes({"sessionQuestion"})
public class ViewController {
	
	@Autowired
	private SyntacksDao SyntacksDao;
	
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	   public ModelAndView displayQuestion(@ModelAttribute("SpringWeb")Question question,
	   ModelMap model) {
		   try
		   {
			   SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
			   List<Question> listquestion= syntacksJdbc.listQuestions();
			   model.addAttribute("listquestions", listquestion);
		   }
		   catch(Exception e)
		   {
			   model.addAttribute("message", "Error");
		   }
		   return new ModelAndView("user/index", "command", new Question());
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView home() {		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public ModelAndView indexHtml() {		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/profile")
	public ModelAndView profile(@ModelAttribute("SpringWeb")Question question, 
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
		
		return new ModelAndView("user/profile", "command", new Question());
	}
	
	@RequestMapping(value = "/view-profile", method = RequestMethod.GET)
	public ModelAndView viewProfile() {		
		return new ModelAndView("user/view_profile");
	}
	
	@RequestMapping(value = "/unanswered", method = RequestMethod.GET)
	public ModelAndView unanswered() {		
		return new ModelAndView("user/unanswered", "command", new User());
	}
	
	@RequestMapping(value = "/questions/ask", method = RequestMethod.GET)
	public ModelAndView ask() {		
		return new ModelAndView("user/ask", "command", new User());
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public ModelAndView displayQuestion(HttpServletRequest request) {
		
		SyntacksJdbc syntacksJdbc = (SyntacksJdbc)context.getBean("syntacksJdbc");
		int topicId = Integer.parseInt(request.getParameter("id"));
		Question question = SyntacksDao.getQuestion(topicId);
		ModelAndView model = new ModelAndView("user/question_view");
		model.addObject("sessionQuestion", question);
		List<Reply> listreply = syntacksJdbc.listreply(topicId);
		model.addObject("listreplies", listreply);
		return model;	
	}
	
}
