package com.syntacks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HTTPErrorHandlers{

	String path = "/user";
	
	@RequestMapping(value="/400")
	public String error400(){
		return path+"/404";
	}
	
	 @RequestMapping(value="/404")
	 public String error404(){
		 return path+"/404";
	 }
	  
	 @RequestMapping(value="/500")
	 public String error500(){
		 return path+"/404";
	 }
	 
	 @RequestMapping(value="/405")
	 public String error405(){
		 return path+"/404";
	 }
	 
	 @RequestMapping(value="/123")
	 public String error123(){
		 return path+"/404";
	 }
	 
	 @RequestMapping(value="/200")
	 public String error200(){
		 return path+"/404";
	 }
}
